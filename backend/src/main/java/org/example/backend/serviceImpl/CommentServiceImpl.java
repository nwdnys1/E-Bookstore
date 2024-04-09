package org.example.backend.serviceImpl;

import org.example.backend.entity.Book;
import org.example.backend.entity.Comment;
import org.example.backend.entity.Result;
import org.example.backend.entity.User;
import org.example.backend.repository.CommentRepository;
import org.example.backend.service.CommentService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    private final CommentRepository repository;
    public CommentServiceImpl(CommentRepository repository) {
        this.repository = repository;
    }
    public Result<List<Comment>> getCommentsByBid(int bid) {
        List<Comment> comments = repository.getCommentsByBookId(bid);
        return Result.success(comments);
    }
    public Result<Comment> addComment(int bid,int uid, String content) {
        Comment comment = new Comment();
        comment.setBook(new Book());
        comment.getBook().setId(bid);
        comment.setUser(new User());
        comment.getUser().setId(uid);
        comment.setContent(content);
        comment.setTime(LocalDateTime.now());//获取当前时间
        repository.save(comment);
        return Result.success(comment);
    }
    public Result<Comment> deleteComment(int id) {
       if (repository.existsById(id)) {
            repository.deleteById(id);
            return Result.success(null);
        }
        return Result.error(404,"评论不存在");
    }

}
