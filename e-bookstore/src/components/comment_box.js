import React, { useState } from "react";
import { Input, Button, Avatar, Rate, Row, Col, Space } from "antd";

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
    <Row align={"middle"} justify={"space-evenly"}>
      <Avatar src="/1.jpg" size="large" />
      <Input.TextArea
        rows={2}
        placeholder="请输入您的评论"
        value={commentText}
        onChange={handleInputChange}
        style={{ flex: 1 }}
      />
      <Rate value={rating} onChange={handleRatingChange} />
      <Button type="primary" onClick={handleSubmit}>
        提交评论
      </Button>
    </Row>
  );
};

export default CommentBox;
