package org.example.service;

import org.example.entity.Result;

import java.util.List;

public interface BookService {
	Result<List<String>> searchAuthorByTitle(String title);
}
