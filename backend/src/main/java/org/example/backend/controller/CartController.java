package org.example.backend.controller;

import org.example.backend.entity.*;
import org.example.backend.repository.UserRepository;
import org.example.backend.service.CartItemService;
import org.example.backend.service.MyUserDetailsService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/cart")
public class CartController {
    private final CartItemService service;
    private final MyUserDetailsService userService;
    public CartController(CartItemService service, MyUserDetailsService userService) {
        this.service = service;
        this.userService = userService;
    }

    @GetMapping("/list")
    public Result<List<CartItem>> getCartItems() {
        int uid = userService.getUid();
        return service.getCartItems(uid);
    }
    @PostMapping("/add/{bid}")
    public Result<CartItem> addCartItem(@PathVariable int bid) {
        int uid = userService.getUid();
        return service.addCartItem(uid, bid);
    }
    @DeleteMapping("/delete/{id}")
    public Result<CartItem> deleteCartItem(@PathVariable int id) {
        return service.deleteCartItem(id);
    }
    @PutMapping("/update/{id}")
    public Result<CartItem> updateCartItem(@PathVariable int id, @RequestParam int quantity) {
        return service.updateCartItem(id, quantity);
    }
}
