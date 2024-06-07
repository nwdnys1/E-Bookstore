package org.example.backend.DAO;

import org.example.backend.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderDAO {
    List<Order> getOrdersByUserId(int uid);

    Order getOrderById(int id);

    List<Order> getOrdersByOrderItemsBookTitleLikeAndUserId(String title, int uid);

    Page<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndUserId(LocalDateTime start, LocalDateTime end, int uid, Pageable pageable);

    Page<Order> getOrdersByOrderItemsBookTitleLike(String s, Pageable pageable);

    Page<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndOrderItemsBookTitleLikeAndUserId(LocalDateTime start, LocalDateTime end, String title, int uid, Pageable pageable);

    Page<Order> getOrdersByCreateTimeAfterAndCreateTimeBeforeAndOrderItemsBookTitleLike(LocalDateTime start, LocalDateTime end, String s, Pageable pageable);

    Page<Order> getOrdersByCreateTimeAfterAndCreateTimeBefore(LocalDateTime start, LocalDateTime end, Pageable pageable);

    void save(Order order);

    boolean existsById(int id);

    void deleteById(int id);

    List<Order> findAll();
}
