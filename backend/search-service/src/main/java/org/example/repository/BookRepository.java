package org.example.repository;

import java.util.List;

import org.example.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Integer> {
	List<Book> findByTitle(String title);
}
