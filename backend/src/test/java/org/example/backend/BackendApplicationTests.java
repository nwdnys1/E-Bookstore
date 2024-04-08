package org.example.backend;

import jakarta.annotation.Resource;
import org.example.backend.repository.CartItemRepository;
import org.example.backend.repository.UserRepository;
import org.example.backend.service.CartItemService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BackendApplicationTests {
    @Resource
    CartItemRepository cartItemRepository;
    CartItemService cartItemService;

    @Test
    void contextLoads() {
        cartItemService = new CartItemService(cartItemRepository);
        cartItemService.getCartItems(2);
    }

}
