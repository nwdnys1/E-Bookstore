package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.*;
import org.example.backend.repository.UserRepository;
import org.example.backend.service.OrderService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/order")
public class OrderController {
    private final OrderService service;
    private final UserRepository userRepository;
    public OrderController(OrderService service, UserRepository userRepository) {
        this.service = service;
        this.userRepository = userRepository;
    }
    private int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findUserByUsername(username).getId();
    }
    @GetMapping("/list")
    public Result<List<Order>> getOrders() {
       return service.getOrders(getUid());
    }
    @PostMapping("/add")
    public Result<Order> addOrder(@RequestBody OrderRequest request) {
       return service.addOrder(request, getUid());
    }
    @DeleteMapping("/delete/{id}")
    public Result<Order> deleteOrder(@PathVariable int id) {
        return service.deleteOrder(id);
    }
}
