package org.example.DAO.Impl;

import java.util.List;

import org.example.DAO.BookDAO;
import org.example.entity.Book;
import org.example.repository.BookRepository;
import org.springframework.stereotype.Repository;
@Repository
public class BookDAOImpl implements BookDAO {
	private final BookRepository repository;
	public BookDAOImpl(BookRepository repository) {
		this.repository = repository;
	}
	@Override
	public List<Book> findByTitle(String title) {
		return repository.findByTitle(title);
	}
}
