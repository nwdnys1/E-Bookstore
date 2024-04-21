package org.example.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Data
@Entity
@Table(name = "books")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","cartItems"})//忽略cartItems属性 并且解决cartItems属性为null的问题

public class Book {
    @Id
    @GeneratedValue( strategy = jakarta.persistence.GenerationType.IDENTITY)
    private int id;
    private String title;
    private String author;
    @Lob
    private String description;
    @Column(precision = 3,scale = 1)
    private BigDecimal rating;
    @Column(precision = 5,scale = 2)
    private BigDecimal price;
    private String cover;
    private int stock;
    private String ISBN;
    @OneToMany(mappedBy = "book",cascade = CascadeType.ALL,orphanRemoval = true,fetch = FetchType.LAZY)
    private List<CartItem> cartItems;
    @JsonIgnoreProperties("replies")
    @OneToMany(mappedBy = "book",cascade = CascadeType.ALL,orphanRemoval = true,fetch = FetchType.LAZY)
    private List<Comment> comments;

}
