package org.example.backend.controller;


import org.example.backend.entity.OrderRequest;
import org.example.backend.entity.*;
import org.example.backend.service.OrderService;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
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
    @GetMapping("/admin/list")
    public Result<List<Order>> getAllOrders() {
        return service.getAllOrders();
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
        return service.searchOrders(keyword);
    }
    @GetMapping("/filter")
    public Result<List<Order>> filterOrders(@RequestParam LocalDateTime start, @RequestParam LocalDateTime end) {
        return service.filterOrders(start, end);
    }
}
