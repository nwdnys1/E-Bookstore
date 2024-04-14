package org.example.backend.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "comments")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","book"})//忽略cartItems属性 并且解决cartItems属性为null的问题
public class Comment {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private int id;
    @Lob
    private String content;
    private LocalDateTime time;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid")
    @JsonIgnoreProperties({"comments","aboutMe"})
    private User user;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bid")
    private Book book;
    @OneToMany(mappedBy = "comment",cascade = CascadeType.ALL,orphanRemoval = true,fetch = FetchType.LAZY)
    private List<Reply> replies;
}
