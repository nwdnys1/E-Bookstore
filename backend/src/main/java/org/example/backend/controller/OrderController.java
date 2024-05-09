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
    public OrderController(OrderService service) {
        this.service = service;
    }
    @GetMapping("/list")
    public Result<List<Order>> getOrders() {
       return service.getOrders();
    }
    @PostMapping("/add")
    public Result<Order> addOrder(@RequestBody OrderRequest request) {
       return service.addOrder(request);
    }
    @DeleteMapping("/delete/{id}")
    public Result<Order> deleteOrder(@PathVariable int id) {
        return service.deleteOrder(id);
    }
    @GetMapping("/search")
    public Result<List<Order>> searchOrderByBookTitle(@RequestParam String keyword) {
        return service.getOrdersByBookTitle(keyword);
    }
}
