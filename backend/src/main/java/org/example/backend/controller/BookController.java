package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.Book;
import org.example.backend.entity.Result;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/book")
public class BookController {
    @Resource
    private JdbcTemplate bookService;

    @GetMapping("/list")
    public Result<List<Book>> list() {
        List<Book> books = bookService.query("select * from books", Book::mapRow);
        return Result.success(books);
    }

    @GetMapping("/get/{id}")
    public Result<Book> getBookById(@PathVariable Long id) {
        List<Book> result = bookService.query("select * from books where id = ?", new Object[]{id}, Book::mapRow);
        if (!result.isEmpty()) {
            return Result.success(result.get(0));
        } else {
            return Result.error(404, "Book not found");
        }
    }





}
