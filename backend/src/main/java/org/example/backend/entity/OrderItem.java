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
public class OrderItem {
    private int id;
    private int oid;
    private int bid;
    private int quantity;
    private BookInfo book;

    public static OrderItem mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new OrderItem(
            rs.getInt("id"),
            rs.getInt("oid"),
            rs.getInt("bid"),
            rs.getInt("quantity"),
            new BookInfo(rs.getString("title"), rs.getDouble("price"), rs.getString("cover"))
        );
    }
    public Map<String, Object> toMap() {
        return Map.of(
            "id", id,
            "oid", oid,
            "bid", bid,
            "quantity", quantity,
            "book", book
        );
    }
}
