package org.example.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    int id;
    String title;
    String author;
    String description;
    float rating;
    float price;
    String cover;

    public static Book mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Book(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("author"),
                rs.getString("description"),
                rs.getFloat("rating"),
                rs.getFloat("price"),
                rs.getString("cover")
        );
    }
    public Map<String, Object> toMap() {
        return Map.of(
                "id", id,
                "title", title,
                "author", author,
                "description", description,
                "rating", rating,
                "price", price,
                "cover", cover
        );
    }
}
