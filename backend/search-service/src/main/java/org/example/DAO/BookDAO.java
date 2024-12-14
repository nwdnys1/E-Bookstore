package org.example.DAO;

import java.util.List;

import org.example.entity.Book;

public interface BookDAO {
	List<Book> findByTitle(String title);
}
