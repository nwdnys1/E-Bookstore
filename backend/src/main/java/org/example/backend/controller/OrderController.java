package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/order")
public class OrderController {
    @Resource
    private JdbcTemplate orderService;
    private int getUid() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username =user.getUsername();
        List<Integer> result = orderService.query("select id from users where username = ?", new Object[]{username}, (rs, rowNum) -> rs.getInt("id"));
        if (!result.isEmpty()) {
            return result.get(0);
        } else {
            return -1;
        }
    }
    private List<OrderItem> getOrderItems(int oid) {
        List<OrderItem> items = orderService.query(
                "SELECT *, b.title, b.price " +
                        "FROM order_items oi " +
                        "JOIN books b ON oi.bid = b.id " +
                        "WHERE oi.oid = ?",
                new Object[]{oid},
                OrderItem::mapRow
        );
        return items;
    }
    @GetMapping("/list")
    public Result<List<Order>> getOrders() {
        int uid = getUid();
        List<Order> orders = orderService.query(
                "SELECT * FROM orders WHERE uid = ?",
                new Object[]{uid},
                Order::mapRow
        );
        for (Order order : orders) {
            order.setItems(getOrderItems(order.getId()));
        }
        return Result.success(orders);
    }
    private void addOrderItems(int orderId, List<CartItem> cartItems) {
        if (cartItems == null || cartItems.isEmpty()) {
            return; // 如果购物车为空，则直接返回
        }
        String sql = "INSERT INTO order_items (oid, bid, quantity) VALUES (?, ?, ?)";
        List<Object[]> batchArgs = new ArrayList<>();
        for (CartItem cartItem : cartItems) {
            batchArgs.add(new Object[]{orderId, cartItem.getBid(), cartItem.getQuantity()});
        }
        orderService.batchUpdate(sql, batchArgs);

    }
    @PostMapping("/add")
    public Result<Order> addOrder(@RequestBody OrderRequest request) {
        int uid = getUid();
        SimpleJdbcInsert insert = new SimpleJdbcInsert(orderService).withTableName("orders").usingGeneratedKeyColumns("id");
        Order order = new Order( 0, uid, request.getReceiver(), request.getAddress(), request.getTel(), null);
        Number id = insert.executeAndReturnKey(order.toMap());
        order.setId(id.intValue());
        String cids = Arrays.stream(request.getCids())
                .mapToObj(String::valueOf)
                .collect(Collectors.joining(", "));
        List<CartItem> cartItems = orderService.query("select * from cart_items where id in (" + cids + ")", CartItem::mapRow);
        addOrderItems(order.getId(), cartItems);
        int rows = orderService.update("delete from cart_items where id in (" + cids + ")");
        if (rows > 0) {
            return Result.success(order);
        } else {
            return Result.error(404, "添加订单失败！");
        }
    }
    @DeleteMapping("/delete/{id}")
    public Result<Order> deleteOrder(@PathVariable Long id) {
        int rows = orderService.update("delete from orders where id = ?", id);
        if (rows > 0) {
            if(orderService.update("delete from order_items where oid = ?", id) > 0){//删除订单的同时删除订单项
                return Result.success(null);
            }else {
                return Result.error(404, "删除订单失败！");
            }
        } else {
            return Result.error(404, "删除订单失败！");
        }
    }
}
