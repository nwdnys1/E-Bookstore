package org.example.controller;

import java.util.List;

import org.example.entity.Result;
import org.example.service.BookService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/search")
public class BookController {
	private final BookService service;
	public BookController(BookService service) {
		this.service = service;
	}
	@GetMapping("/author")
	public Result<List<String>> searchAuthor(@RequestParam String title) {
		return service.searchAuthorByTitle(title);
	}
}
