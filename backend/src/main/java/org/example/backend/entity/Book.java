package org.example.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
public class Book {
    int id;
    String title;
    String author;
    String description;
    float rating;
    float price;

    public static Book mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Book(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("author"),
                rs.getString("description"),
                rs.getFloat("rating"),
                rs.getFloat("price")
        );
    }

}
