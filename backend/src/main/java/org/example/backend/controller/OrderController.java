package org.example.backend.controller;


import org.example.backend.DTO.OrderRequest;
import org.example.backend.entity.*;
import org.example.backend.repository.UserRepository;
import org.example.backend.service.MyUserDetailsService;
import org.example.backend.service.OrderService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/api/order")
public class OrderController {
    private final OrderService service;
    private final MyUserDetailsService userService;
    public OrderController(OrderService service, MyUserDetailsService userService) {
        this.service = service;
        this.userService = userService;
    }
    @GetMapping("/list")
    public Result<List<Order>> getOrders() {
       return service.getOrders(userService.getUid());
    }
    @PostMapping("/add")
    public Result<Order> addOrder(@RequestBody OrderRequest request) {
       return service.addOrder(request, userService.getUid());
    }
    @DeleteMapping("/delete/{id}")
    public Result<Order> deleteOrder(@PathVariable int id) {
        return service.deleteOrder(id);
    }
    @GetMapping("/search")
    public Result<List<Order>> searchOrderByBookTitle(@RequestParam String keyword) {
        return service.getOrdersByBookTitle(keyword, userService.getUid());
    }
}
