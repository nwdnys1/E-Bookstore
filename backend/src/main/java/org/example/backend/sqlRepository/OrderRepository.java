package org.example.backend.sqlRepository;

import org.example.backend.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    public List<Order> getOrdersByUserId(int uid);
    public Order getOrderById(int id);
    public List<Order> getOrdersByOrderItemsBookTitleLikeAndUserId(String title, int uid);
    public List<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndUserId(LocalDateTime start, LocalDateTime end, int uid);
    public List<Order> getOrdersByOrderItemsBookTitleLike(String s);
    public Page<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndOrderItemsBookTitleLikeAndUserId(LocalDateTime start, LocalDateTime end, String title, int uid, Pageable pageable);
}