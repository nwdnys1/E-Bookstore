package org.example.backend.repository;

import org.example.backend.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    public List<Order> getOrdersByUserId(int uid);
    public Order getOrderById(int id);
    public List<Order> getOrdersByOrderItemsBookTitleLikeAndUserId(String title, int uid);
    public List<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndUserId(LocalDateTime start, LocalDateTime end, int uid);
}