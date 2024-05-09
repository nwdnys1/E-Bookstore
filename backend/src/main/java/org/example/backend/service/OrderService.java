package org.example.backend.service;

import org.example.backend.DTO.OrderRequest;
import org.example.backend.entity.*;
import org.example.backend.repository.CartItemRepository;
import org.example.backend.repository.OrderRepository;
import org.example.backend.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    private final OrderRepository repository;
    private final CartItemRepository cartItemRepository;
    private final UserRepository userRepository;
    public OrderService(OrderRepository repository,  CartItemRepository cartItemRepository, UserRepository userRepository) {
        this.repository = repository;
        this.cartItemRepository = cartItemRepository;
        this.userRepository = userRepository;
    }
    public int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findUserByUsername(username).getId();
    }
    public Result<List<Order>> getOrders(){
        return Result.success(repository.getOrdersByUserId(getUid()));
    }
    public Result<Order> addOrder(OrderRequest request){
        int uid = getUid();
        Order order = new Order();
        order.setAddress(request.getAddress());
        order.setTel(request.getTel());
        order.setReceiver(request.getReceiver());
        order.setCreateTime(LocalDateTime.now());
        order.setUser(new User());
        order.getUser().setId(uid);
        List<OrderItem> orderItems = new ArrayList<>();

        // 一次性从购物车中获取所有商品项
        List<CartItem> cartItems = cartItemRepository.getCartItemsByUserId(uid);
        for (int cid:request.getCids()){
            CartItem cartItem = findCartItemById(cartItems, cid);
            if(cartItem == null){
                return Result.error(400, "购物车项目不存在！");
            }
        }
        for (int cid : request.getCids()) {
            // 在购物车项中查找对应的商品项
            CartItem cartItem = findCartItemById(cartItems, cid);
            // 创建订单项并设置到订单中
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setBook(new Book());
            orderItem.getBook().setId(cartItem.getBook().getId());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItems.add(orderItem);

            // 从购物车中移除对应的商品项
            cartItems.remove(cartItem);
            cartItemRepository.deleteById(cartItem.getId());
        }
        order.setOrderItems(orderItems);
        repository.save(order);
        return Result.success(order);
    }

    // 在购物车项列表中查找指定ID的购物车项
    private CartItem findCartItemById(List<CartItem> cartItems, int cid) {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getId() == cid) {
                return cartItem;
            }
        }
        return null;
    }

    public Result<Order> deleteOrder(int id){
        if(repository.existsById(id)){
            if(repository.getOrderById(id).getUser().getId() != getUid()){
                return Result.error(403, "无权删除他人订单！");
            }
            repository.deleteById(id);
            return Result.success(null);
        }else{
            return Result.error(404, "订单不存在！");
        }
    }
    public Result<List<Order>> getOrdersByBookTitle(String title) {
        int uid = getUid();
        List<Order> orders = repository.getOrdersByUserId(uid);
        List<Order> result = new ArrayList<>();

        // 将查询关键字转换为小写字母
        String lowercaseTitle = title.toLowerCase();

        for (Order order : orders) {
            boolean found = false; // 用于标记是否找到符合条件的订单项
            for (OrderItem orderItem : order.getOrderItems()) {
                // 将书籍标题转换为小写字母进行比较
                String lowercaseBookTitle = orderItem.getBook().getTitle().toLowerCase();
                if (lowercaseBookTitle.contains(lowercaseTitle)) {
                    result.add(order);
                    found = true;
                    break; // 找到符合条件的订单项后立即跳出内层循环
                }
            }
            if (found) {
                // 如果找到符合条件的订单项，则跳出外层循环
                break;
            }
        }

        return Result.success(result);
    }
}
