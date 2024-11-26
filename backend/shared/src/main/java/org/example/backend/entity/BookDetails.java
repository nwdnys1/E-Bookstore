package org.example.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@Entity
@Table(name = "book_details")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","cartItems","orderItems"})//忽略cartItems属性 并且解决某一字段可能为null的问题
public class BookDetails {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private int id;
    private int rating;
    private int stock;
    private int sales;//销量
    @Transient //不映射到数据库
    private List<Comment> comments;
}
