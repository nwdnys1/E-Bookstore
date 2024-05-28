package org.example.backend.serviceImpl;

import org.example.backend.entity.Comment;
import org.example.backend.entity.Like;
import org.example.backend.entity.Result;
import org.example.backend.entity.User;
import org.example.backend.sqlRepository.LikeRepository;
import org.example.backend.sqlRepository.MysqlUserRepository;
import org.example.backend.service.LikeService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LikeServiceImpl implements LikeService {
    private final LikeRepository repository;
    private final MysqlUserRepository userRepository;
    public LikeServiceImpl(LikeRepository repository, MysqlUserRepository userRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
    }
    public int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findUserByUsername(username).getId();
    }
    public Result<String> likeComment(int cid) {
        int uid = getUid();
        Like like = repository.getLikeByUserIdAndCommentId(uid, cid);
        if(like != null)
        {
            repository.delete(like);
            return Result.success("取消点赞");
        }
        like = new Like();
        like.setComment(new Comment());
        like.getComment().setId(cid);
        like.setUser(new User());
        like.getUser().setId(uid);
        repository.save(like);
        return Result.success("点赞成功");
    }
    public Result<List<Integer>> getCids() {
        int uid = getUid();
        List<Integer> cids = new ArrayList<>();
        List<Like> likes = repository.getLikesByUserId(uid);
        for(Like like : likes)
        {
            cids.add(like.getComment().getId());
        }
        return Result.success(cids);
    }
}