package org.example.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private int id;
    private int uid;
    private String receiver;
    private String address;
    private String tel;
    private List<OrderItem> items;

    public static Order mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Order(
            rs.getInt("id"),
            rs.getInt("uid"),
            rs.getString("receiver"),
            rs.getString("address"),
            rs.getString("tel"),
            null
        );
    }
    public Map<String, Object> toMap() {
        return Map.of(
            "id", id,
            "uid", uid,
            "receiver", receiver,
            "address", address,
            "tel", tel
        );
    }
}
