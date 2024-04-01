package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.Book;
import org.example.backend.entity.Result;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping("/recommend/{nums}")
    public Result<List<Book>> getRecommendations(@PathVariable int nums) {//依据rating进行推荐 选取rating最高的前6本书
        List<Book> books = bookService.query("select * from books order by rating desc limit ?", new Object[]{nums}, Book::mapRow);
        if(!books.isEmpty()){
            return Result.success(books);
        }
        else {
            return Result.error(404, "No books found");
        }
    }

    @PutMapping("/update/{id}")
    public Result<Book> updateBook(@PathVariable Long id, @RequestBody Book book) {
        int rows = bookService.update("update books set title = ?, author = ?, description = ?, rating = ?, price = ? where id = ?",
                book.getTitle(), book.getAuthor(), book.getDescription(), book.getRating(), book.getPrice(), id);
        if (rows > 0) {
            return Result.success(book);
        } else {
            return Result.error(404, "修改书籍信息失败！");
        }
    }

    @DeleteMapping("/delete/{id}")
    public Result<Book> deleteBook(@PathVariable Long id) {
        int rows = bookService.update("delete from books where id = ?", id);
        if (rows > 0) {
            return Result.success(null);
        } else {
            return Result.error(404, "删除书籍失败！");
        }
    }

    @PostMapping("/add")
    public Result<Book> addBook(@RequestBody Book book) {
        SimpleJdbcInsert insert = new SimpleJdbcInsert(bookService).withTableName("books").usingGeneratedKeyColumns("id");
        Number id = insert.executeAndReturnKey(book.toMap());
        if (id != null) {
            book.setId(id.intValue());
            return Result.success(book);
        } else {
            return Result.error(404, "添加书籍失败！");
        }
    }




}
