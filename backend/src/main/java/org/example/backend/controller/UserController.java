package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.Result;
import org.example.backend.service.MyUserDetails;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {
    private final MyUserDetails service;
    public UserController(MyUserDetails service) {
        this.service = service;
    }
    @GetMapping("/check")
    public Result<String> check() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success("已登录");
    }
    @GetMapping("/get")
    public Result<org.example.backend.entity.User> name() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success(service.getUserByUsername(user.getUsername()));
    }
    @DeleteMapping("/delete/{id}")
    public Result<org.example.backend.entity.User> delete(@PathVariable int id) {
        return service.deleteUser(id);
    }
}
