package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "book_tags")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class BookTag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int bid;
	private Long tid;
}
