package org.example.backend.serviceImpl;

import org.example.backend.entity.*;
import org.example.backend.sqlRepository.CommentRepository;
import org.example.backend.sqlRepository.MysqlUserRepository;
import org.example.backend.service.CommentService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    private final CommentRepository repository;
    private final MysqlUserRepository userRepository;
    public CommentServiceImpl(CommentRepository repository, MysqlUserRepository userRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
    }
    public int getUid() {//从数据库里查询id
        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        return userRepository.findUserByUsername(username).getId();
    }
    public Result<List<Comment>> getCommentsByBid(int bid) {
        List<Comment> comments = repository.getCommentsByBookId(bid);
        return Result.success(comments);
    }
    public Result<Comment> addComment(int bid, String content) {
        int uid = getUid();
        Comment comment = new Comment();
        comment.setBook(new Book());
        comment.getBook().setId(bid);
        User user = userRepository.findById(uid).orElse(null);
        comment.setUser(user);
        comment.setContent(content);
        comment.setTime(LocalDateTime.now());//获取当前时间
        comment.setReplies(List.of());//设置回复为空 防止空指针异常
        repository.save(comment);
        return Result.success(comment);
    }
    public Result<Comment> deleteComment(int id) {
       if (repository.existsById(id)) {
           if(repository.getCommentById(id).getUser().getId() != getUid())
               return Result.error(403,"无权删除");
            repository.deleteById(id);
            return Result.success(null);
        }
        return Result.error(404,"评论不存在");
    }

    public Result<Reply> addReply(int cid, String content) {
        int uid = getUid();
        Comment comment = repository.findById(cid).orElse(null);
        if (comment == null) {
            return Result.error(404,"评论不存在");
        }
        Reply reply = new Reply();
        reply.setComment(comment);
        User user = userRepository.findById(uid).orElse(null);
        if (user == null) {
            return Result.error(404,"用户不存在");
        }
        reply.setUser(user);
        reply.setContent(content);
        reply.setTime(LocalDateTime.now());
        comment.getReplies().add(reply);
        repository.save(comment);
        return Result.success(reply);
    }
}
