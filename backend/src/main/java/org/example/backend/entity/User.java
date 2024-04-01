package org.example.backend.entity;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    Integer id;
    String username;
    String password;
    String role;
}
