package org.example.entity;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Document(collection = "comments")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) // 忽略book属性，并解决replies属性为空的问题
public class Comment {
	@Id
	private String id;
	private int rating;
	private String content;
	private LocalDateTime time;
	private int uid;
	private int bid;
	private List<Reply> replies;
	private List<Integer> likes;// 点赞的用户id
}
