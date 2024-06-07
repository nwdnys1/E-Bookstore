package org.example.backend.DAO;

import org.example.backend.entity.User;

import java.util.List;

public interface UserDAO {
    User findUserByUsername(String username);

    boolean existsUserByUsername(String username);

    boolean existsUserByEmail(String email);

    User findById(int id);

    void save(User user);

    boolean existsById(int id);

    void deleteById(int id);

    List<User> findAll();
}
