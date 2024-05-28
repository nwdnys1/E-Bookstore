package org.example.backend.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.backend.entity.Book;
import org.example.backend.entity.Order;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderPageResponse {
    private long total;
    private int pages;
    private List<Order> orders;
}
