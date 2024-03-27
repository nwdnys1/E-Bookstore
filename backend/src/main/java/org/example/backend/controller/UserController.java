package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.Result;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @GetMapping("/check")
    public Result<String> check() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success("已登录");
    }
    @GetMapping("/name")
    public Result<String> name() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success(user.getUsername());
    }
}
