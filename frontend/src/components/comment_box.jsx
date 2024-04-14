import React, { useContext, useEffect, useState } from "react";
import { Input, Button, Avatar, Rate, Row } from "antd";
import { addComment } from "../services/commentService";
import { useParams } from "react-router-dom";
import { getUser } from "../services/userService";

const CommentBox = ({ setComments }) => {
  const [content, setContent] = useState("");
  const [rating, setRating] = useState(0);
  const [avatar, setAvatar] = useState("https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg");
  let { id } = useParams();
  useEffect(() => {
    const get = async () => {
      try {
        await getUser().then((res) => {
          setAvatar(res.avatar);
        });
      } catch (e) {
      }
    };
    get();
  }, []);
  const handleInputChange = (e) => {
    setContent(e.target.value);
  };
  const handleRatingChange = (value) => {
    setRating(value);
  };
  const handleSubmit = async () => {
    if (!content || !rating) {
      alert("请填写评论内容和评分");
      return;
    }
    try {
      await addComment({ bid: id, content: content }).then((res) => {
        setComments((comments) => [...comments, res]);
        setContent("");
        alert("评论成功！");
      });
    } catch (e) {
      alert(e);
    }
  };

  return (
    <Row align={"middle"} justify={"space-evenly"}>
      <Avatar src={avatar} size="large" />
      <div style={{ width: 20 }} />
      <Input.TextArea
        rows={2}
        placeholder="请输入您的评论"
        value={content}
        onChange={handleInputChange}
        style={{ flex: 1 }}
      />
      <div style={{ width: 20 }} />
      <Rate value={rating} onChange={handleRatingChange} />
      <div style={{ width: 20 }} />
      <Button type="primary" onClick={handleSubmit}>
        提交评论
      </Button>
    </Row>
  );
};

export default CommentBox;
