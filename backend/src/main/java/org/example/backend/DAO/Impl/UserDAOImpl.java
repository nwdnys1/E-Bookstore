package org.example.backend.DAO.Impl;

import org.example.backend.DAO.UserDAO;
import org.example.backend.entity.User;
import org.example.backend.repository.MySQLRepository.MysqlUserRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {
    private final MysqlUserRepository mysqlUserRepository;
    public UserDAOImpl(MysqlUserRepository mysqlUserRepository) {
        this.mysqlUserRepository = mysqlUserRepository;
    }

    @Override
    public User findUserByUsername(String username) {
        return mysqlUserRepository.findUserByUsername(username);
    }

    @Override
    public boolean existsUserByUsername(String username) {
        return mysqlUserRepository.existsUserByUsername(username);
    }

    @Override
    public boolean existsUserByEmail(String email) {
        return mysqlUserRepository.existsUserByEmail(email);
    }

    @Override
    public User findById(int id) {
        return mysqlUserRepository.findById(id).orElse(null);
    }

    @Override
    public void save(User user) {
        mysqlUserRepository.save(user);
    }

    @Override
    public boolean existsById(int id) {
        return mysqlUserRepository.existsById(id);
    }

    @Override
    public void deleteById(int id) {
        mysqlUserRepository.deleteById(id);
    }

    @Override
    public List<User> findAll() {
        return mysqlUserRepository.findAll();
    }
}