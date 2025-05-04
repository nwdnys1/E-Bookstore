package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name = "users")
@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})//忽略cartItems,orders,comments属性
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String username;
    private String role;
    private String avatar;
    private String email;
    private boolean enabled;
    private int level;
    private String tel;
    @Lob
    private String aboutMe;

    public User() {
        id = 0;
        username = "";
        role = "user";
        avatar = "";
        email = "";
        enabled = true;
        level = 0;
        tel = "";
        aboutMe = "";
    }
}
