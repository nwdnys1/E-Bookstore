package org.example.backend.controller;

import org.example.backend.DTO.RegisterRequest;
import org.example.backend.entity.Result;
import org.example.backend.DTO.UserProfile;
import org.example.backend.service.MyUserDetailsService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {
    private final MyUserDetailsService service;
    public UserController(MyUserDetailsService service) {
        this.service = service;
    }
    @GetMapping("/check")
    public Result<String> check() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success("已登录");
    }
    @GetMapping("/get")
    public Result<org.example.backend.entity.User> get() {
        User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return Result.success(service.getUserByUsername(user.getUsername()));
    }
    @GetMapping("/get/{username}")
    public Result<org.example.backend.entity.User> get(@PathVariable String username) {
        return Result.success(service.getUserByUsername(username));
    }
    @PostMapping("/register")
    public Result<org.example.backend.entity.User> register(@RequestBody RegisterRequest request) {
        return service.addUser(request);
    }
    @PutMapping("/update")
    public Result<org.example.backend.entity.User> update(@RequestBody UserProfile request) {
        return service.updateUser(request);
    }
    @DeleteMapping("/admin/delete/{id}")
    public Result<org.example.backend.entity.User> delete(@PathVariable int id) {
        return service.deleteUser(id);
    }
}
