package org.example.backend.service;

import org.example.backend.DTO.BookPageResponse;
import org.example.backend.DTO.OrderPageResponse;
import org.example.backend.entity.OrderRequest;
import org.example.backend.entity.*;
import org.example.backend.sqlRepository.CartItemRepository;
import org.example.backend.sqlRepository.OrderRepository;
import org.example.backend.sqlRepository.MysqlUserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    private final MysqlUserRepository userRepository;
    public OrderService(OrderRepository repository,  CartItemRepository cartItemRepository, MysqlUserRepository userRepository) {
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
    public Result<List<Order>> getAllOrders() {
        return Result.success(repository.findAll());
    }
    public Result<OrderPageResponse> searchAllOrders(String keyword, int page, int pageSize,LocalDateTime start,LocalDateTime end){
        System.out.print(keyword+" "+start+" "+end+" "+page+" "+pageSize+"\n");
        Pageable pageable = PageRequest.of(page - 1, pageSize);

        Page<Order> orders = repository.getOrdersByCreateTimeAfterAndCreateTimeBeforeAndOrderItemsBookTitleLike(start, end, "%" + keyword + "%", pageable);
        System.out.println(orders.getTotalElements());
        OrderPageResponse response = new OrderPageResponse(
                orders.getTotalElements(),
                orders.getTotalPages(),
                orders.getContent()
        );
        return Result.success(response);
    }
    public Result<OrderPageResponse> searchOrders(String keyword,LocalDateTime start,LocalDateTime end, int page, int pageSize){

        Pageable pageable = PageRequest.of(page - 1, pageSize);
        Page<Order> orders = repository.getOrdersByCreateTimeAfterAndCreateTimeBeforeAndOrderItemsBookTitleLikeAndUserId(start, end, "%" + keyword + "%", getUid(), pageable);
        OrderPageResponse response = new OrderPageResponse(
                orders.getTotalElements(),
                orders.getTotalPages(),
                orders.getContent()
        );
        return Result.success(response);
    }
}
