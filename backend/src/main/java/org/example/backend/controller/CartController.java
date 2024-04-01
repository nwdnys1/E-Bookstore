package org.example.backend.controller;

import jakarta.annotation.Resource;
import org.example.backend.entity.Book;
import org.example.backend.entity.BookInfo;
import org.example.backend.entity.CartItem;
import org.example.backend.entity.Result;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/cart")
public class CartController {
    @Resource
    private JdbcTemplate cartService;
    private int getUid() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username =user.getUsername();
        List<Integer> result = cartService.query("select id from users where username = ?", new Object[]{username}, (rs, rowNum) -> rs.getInt("id"));
        if (!result.isEmpty()) {
            return result.get(0);
        } else {
            return -1;
        }
    }
    @GetMapping("/get")
    public Result<List<CartItem>> getCartItems() {
        int uid = getUid();
        List<CartItem> items = cartService.query(
                "SELECT *, b.title, b.price " +
                        "FROM cart_items ci " +
                        "JOIN books b ON ci.bid = b.id " +
                        "WHERE ci.uid = ?",
                new Object[]{uid},
                CartItem::mapRow
        );
        return Result.success(items);
    }
    @PostMapping("/add/{bid}")
    public Result<CartItem> addCartItem(@PathVariable int bid) {
        int uid = getUid();
        int count = cartService.queryForObject("SELECT COUNT(*) FROM cart_items WHERE uid = ? AND bid = ?", Integer.class, uid, bid);
        if (count > 0) {
            // 如果已存在相同的购物车项目，返回错误信息
            return Result.error(400, "请勿重复添加同一商品！");
        }
        SimpleJdbcInsert insert = new SimpleJdbcInsert(cartService).withTableName("cart_items").usingGeneratedKeyColumns("id");
        Book book= cartService.query("select * from books where id = ?", new Object[]{bid}, Book::mapRow).get(0);
        CartItem item = new CartItem(0, uid, bid, 1, new BookInfo(book.getTitle(), book.getPrice(), book.getCover()));
        item.setId(insert.executeAndReturnKey(item.toMap()).intValue());
        return Result.success(null);
    }
    @DeleteMapping("/delete/{id}")
    public Result<CartItem> deleteCartItem(@PathVariable int id) {
        int uid = getUid();
        int rows = cartService.update("delete from cart_items where uid = ? and id = ?", uid, id);
        if (rows > 0) {
            return Result.success(null);
        } else {
            return Result.error(404, "删除购物车商品失败！");
        }
    }
    @PutMapping("/update/{id}")
    public Result<CartItem> updateCartItem(@PathVariable int id, @RequestParam int quantity) {
        int uid = getUid();
        int rows = cartService.update("update cart_items set quantity = ?  where uid = ? and id = ?", quantity, uid, id);
        if (rows > 0) {
            return Result.success(null);
        } else {
            return Result.error(404, "更新购物车商品失败！");
        }
    }
}
