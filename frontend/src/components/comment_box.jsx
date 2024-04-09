import React, { useState} from "react";
import { Input, Button, Avatar, Rate, Row } from "antd";
import { addCartItem } from "../services/cartService";
import { addComment } from "../services/commentService";
import { useParams } from "react-router-dom";

const CommentBox = ({ onAddComment }) => {
  const [content, setContent] = useState("");
  const [rating, setRating] = useState(0);
  let { id } = useParams();

  const handleInputChange = (e) => {
    setContent(e.target.value);
  }

  const handleRatingChange = (value) => {
    setRating(value);
  };

  const handleSubmit = async() => {
    if (!content || !rating) {
      alert("请填写评论内容和评分");
      return;
    }
    await addComment({ bid: id, content: content }).then((res) => {
      alert("评论成功！");
      location.reload();
    });
  };

  return (
    <Row align={"middle"} justify={"space-evenly"}>
      <Avatar src="/1.jpg" size="large" />
      <Input.TextArea
        rows={2}
        placeholder="请输入您的评论"
        value={content}
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
