package org.example.backend.service;

import org.example.backend.entity.Book;
import org.example.backend.entity.CartItem;
import org.example.backend.entity.Result;
import org.example.backend.entity.User;
import org.example.backend.repository.CartItemRepository;
import org.example.backend.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartItemService {
    private final CartItemRepository repository;
    private final UserRepository userRepository;
    public CartItemService(CartItemRepository repository, UserRepository userRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
    }
    public int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findUserByUsername(username).getId();
    }
    public Result<List<CartItem>> getCartItems(){
        return Result.success(repository.getCartItemsByUserId(getUid()));
    }
    public Result<CartItem> addCartItem(int bid){//需要判断是否已经存在
        int uid = getUid();
        if(repository.existsByUserIdAndBookId(uid, bid)){
            return Result.error(400, "购物车项目已存在！");
        }else{
            CartItem item = new CartItem();
            item.setQuantity(1);
            item.setUser(new User());
            item.getUser().setId(uid);
            item.setBook(new Book());
            item.getBook().setId(bid);
            repository.save(item);
            return Result.success(item);
        }
    }
    public Result<CartItem> deleteCartItem(int id){//需要判断是否存在
        if(repository.existsById(id)){
            if(repository.getCartItemById(id).getUser().getId()!=getUid()){
                return Result.error(403, "无权操作！");
            }
            repository.deleteById(id);
            return Result.success(null);
        }else{
            return Result.error(404, "购物车项目不存在！");
        }
    }
    public Result<CartItem> updateCartItem(int id, int quantity){//需要判断是否存在
        if(repository.existsById(id)){
            CartItem item = repository.getCartItemById(id);
            if(item.getUser().getId()!=getUid()){
                return Result.error(403, "无权操作！");
            }
            item.setQuantity(quantity);
            repository.save(item);
            return Result.success(item);
        }else{
            return Result.error(404, "购物车项目不存在！");
        }
    }
}
