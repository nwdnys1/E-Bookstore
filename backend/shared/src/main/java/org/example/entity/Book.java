package org.example.entity;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "books")
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) // 忽略cartItems属性 并且解决某一字段可能为null的问题
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String author;
	@Lob // 长文本类型
	private String description;
	private int price;
	private String cover;
	private String isbn;
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	@JoinColumn(name = "id")
	private BookDetails bookDetails;
	@Transient
	private List<Tag> tags;

	public Book() {
		title = "";
		author = "";
		description = "";
		price = 0;
		cover = "";
		isbn = "";
		bookDetails = new BookDetails();
		bookDetails.setRating(0);
		bookDetails.setSales(0);
		bookDetails.setComments(new ArrayList<>());
		bookDetails.setId(0);
		bookDetails.setStock(0);
		tags = new ArrayList<>();
	}
}
