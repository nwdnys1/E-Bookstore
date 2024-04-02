package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.CartItem;
import org.example.backend.entity.Order;
import org.example.backend.entity.OrderItem;
import org.example.backend.entity.Result;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    @PostMapping("/add")
    public Result<Order> addOrder() {
       return Result.success(null);
    }
}
