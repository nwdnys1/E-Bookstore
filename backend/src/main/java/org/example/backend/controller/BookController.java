package org.example.backend.controller;

import org.example.backend.DTO.BookPageResponse;
import org.example.backend.entity.Book;
import org.example.backend.entity.Result;
import org.example.backend.service.BookService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/book")
public class BookController {

    private final BookService service;
    public BookController(BookService service) {
        this.service = service;
    }
    @GetMapping("/list")
    public Result<List<Book>> list() {
       return service.getBooks();
    }
    @GetMapping("/get/{id}")
    public Result<Book> getBookById(@PathVariable int id) {
       return service.getBookById(id);
    }
    @GetMapping("/recommend/{nums}")
    public Result<List<Book>> getRecommendations(@PathVariable int nums) {//依据rating进行推荐 选取rating最高的前6本书
       return service.getRecommendations(nums);
    }
    @PutMapping("/admin/update/{id}")
    @PreAuthorize("hasRole('admin')")
    public Result<Book> updateBook(@PathVariable int id, @RequestBody Book book) {
        return service.updateBook(id, book);
    }
    @DeleteMapping("/admin/delete/{id}")
    public Result<Book> deleteBook(@PathVariable int id) {
         return service.deleteBook(id);
    }
    @PostMapping("/admin/add")
    public Result<Book> addBook(@RequestBody Book book) {
       return service.addBook(book);
    }
    @GetMapping("/search")
    public Result<BookPageResponse> searchBooks(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize){
        return service.searchBooks(keyword, page, pageSize);
    }
    @GetMapping("/category")
    public Result<BookPageResponse> categorySearch(@RequestParam(defaultValue = "") int tag, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize){
        return service.categorySearch(tag, page, pageSize);
    }



}
