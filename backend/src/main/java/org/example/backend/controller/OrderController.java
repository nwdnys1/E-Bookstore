package org.example.backend.controller;


import org.example.backend.DTO.PageResponse;
import org.example.backend.entity.OrderRequest;
import org.example.backend.entity.*;
import org.example.backend.service.OrderService;
import org.springframework.format.annotation.DateTimeFormat;
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
    public Result<PageResponse<Order>> searchOrders(@RequestParam String keyword, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime start, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime end, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize) {
        return service.searchOrders(keyword, start, end, page, pageSize);
    }
    @GetMapping("/admin/search")
    public Result<PageResponse<Order>> searchAllOrdersByBookTitle(@RequestParam String keyword, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime start, @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") LocalDateTime end) {
        return service.searchAllOrders(keyword, page, pageSize, start, end);
    }
}
