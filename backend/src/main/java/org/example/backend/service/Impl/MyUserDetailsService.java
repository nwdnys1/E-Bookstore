package org.example.backend.service.Impl;

import org.example.backend.DAO.UserDAO;
import org.example.backend.entity.RegisterRequest;
import org.example.backend.entity.Result;
import org.example.backend.entity.User;
import org.example.backend.entity.UserProfile;
import org.example.backend.repository.MySQLRepository.UploadRepository;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MyUserDetailsService implements UserDetailsService {
    UserDAO userDAO;
    UploadRepository uploadRepository;
    public MyUserDetailsService(UserDAO userDAO, UploadRepository uploadRepository) {
        this.userDAO = userDAO;
        this.uploadRepository = uploadRepository;
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DisabledException{
        User user = userDAO.findUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("未找到用户");
        }
        List< GrantedAuthority > authorities = new ArrayList<>();
        authorities.add((GrantedAuthority) () -> "ROLE_" + user.getRole());
        System.out.println("loadUserByUsername: "+user.getUsername());
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),  user.isEnabled(), true, true, true, authorities);
    }
    public Result<User> updateUser(UserProfile request) {
        int id = getUid();
        User user = userDAO.findById(id);
        if (user == null) {
            return Result.error(404, "用户不存在！");
        }
        if(userDAO.existsUserByUsername(request.getUsername()) && !request.getUsername().equals(user.getUsername())) {
            return Result.error(400, "用户名已存在！");
        }
        user.setUsername(request.getUsername());
        user.setEmail(request.getEmail());
        user.setTel(request.getTel());
        user.setAboutMe(request.getAboutMe());
        userDAO.save(user);
        return Result.success(user);

    }
    public Result<User> addUser(RegisterRequest request) {
        if(userDAO.existsUserByUsername(request.getUsername())) {
            return Result.error(400, "用户名已存在！");
        }
        if(userDAO.existsUserByEmail(request.getEmail())) {
            return Result.error(400, "邮箱已被占用！");
        }
        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(new BCryptPasswordEncoder().encode(request.getPassword()));//加密密码
        user.setEmail(request.getEmail());
        user.setRole("user");
        user.setEnabled(true);
        user.setLevel(1);
        user.setAvatar("https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg");//默认头像
        user.setTel("");
        user.setAboutMe("");
        userDAO.save(user);
        return Result.success(user);
    }
    public Result<User> deleteUser(int id) {
        if (userDAO.existsById(id)) {
            userDAO.deleteById(id);
            return Result.success(null);
        } else {
            return Result.error(404, "用户不存在！");
        }
    }
    public Result<User> getUserByUsername(String username) {
        User user = userDAO.findUserByUsername(username);
        if (user == null) {
            return Result.error(404, "用户不存在！");
        }
        return Result.success(user);
    }
    public int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userDAO.findUserByUsername(username).getId();
    }
    public Result<String> updateAvatar(MultipartFile file)  {
        int id = getUid();
        User user = userDAO.findById(id);
        if (user == null) {
            return Result.error(404, "用户不存在！");
        }
        try {
            String url = uploadRepository.uploadFile(file, "image");
            user.setAvatar(url);
            userDAO.save(user);
            return Result.success(url);
        }
        catch (IOException e) {
            return Result.error(500, e.getMessage());
        }
    }

    public Result<User> disableUser(int id) {
        User user = userDAO.findById(id);
        if (user == null) {
            return Result.error(404, "用户不存在！");
        }
        if(user.getRole().equals("admin")) {
            return Result.error(403, "无法禁用管理员！");
        }
        user.setEnabled(false);
        userDAO.save(user);
        return Result.success(user);
    }

    public Result<List<User>> getAllUsers() {
        return Result.success(userDAO.findAll());
    }

    public Result<User> enableUser(int id) {
        User user = userDAO.findById(id);
        if (user == null) {
            return Result.error(404, "用户不存在！");
        }
        user.setEnabled(true);
        userDAO.save(user);
        return Result.success(user);
    }
}
