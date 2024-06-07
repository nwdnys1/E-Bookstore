package org.example.backend.service;

import org.example.backend.DTO.BookPageResponse;
import org.example.backend.entity.Book;
import org.example.backend.entity.Result;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
public interface BookService {
    public Result<List<Book>> getBooks();
    public Result<Book> getBookById(int id);
    public Result<List<Book>> getRecommendations(int nums);
    public Result<Book> addBook(Book book);
    public Result<Book> updateBook(int id, Book book);
    public Result<Book> deleteBook(int id);
    public Result<BookPageResponse> searchBooks(String keyword, int page, int pageSize);
    public Result<BookPageResponse> categorySearch(int tid, int page, int pageSize);
    public Result<String> updateCover(int id, MultipartFile file);
}

