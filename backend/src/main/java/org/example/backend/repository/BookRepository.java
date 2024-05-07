package org.example.backend.repository;

import org.example.backend.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {
    public Book getBookById(int id);
    public List<Book> getBooksByRatingGreaterThanOrderByRatingDesc(BigDecimal rating);
    public List<Book> getBooksByTitleLikeOrAuthorLike(String title, String author);
}
