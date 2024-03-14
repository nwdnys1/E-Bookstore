import React, { useState } from "react";
import { Input, Button, Avatar, Rate } from "antd";

const CommentBox = ({ onAddComment }) => {
  const [commentText, setCommentText] = useState("");
  const [rating, setRating] = useState(0);

  const handleInputChange = (e) => {
    setCommentText(e.target.value);
  };

  const handleRatingChange = (value) => {
    setRating(value);
  };

  const handleSubmit = () => {
    if (commentText.trim() !== "") {
      onAddComment({
        text: commentText,
        avatar: "https://example.com/avatar.jpg", // 替换成用户的头像地址
        rating: rating,
      });
      setCommentText("");
      setRating(0);
    }
  };

  return (
    <div style={{ display: "flex", alignItems: "center" }}>
      <Avatar src="https://example.com/avatar.jpg" size="large" />
      <Input.TextArea
        rows={2}
        placeholder="请输入您的评论"
        value={commentText}
        onChange={handleInputChange}
        style={{ marginLeft: 16, flex: 1 }}
      />
      <Rate
        value={rating}
        onChange={handleRatingChange}
        style={{ marginLeft: 16 }}
      />
      <Button type="primary" onClick={handleSubmit} style={{ marginLeft: 16 }}>
        提交评论
      </Button>
    </div>
  );
};

export default CommentBox;
