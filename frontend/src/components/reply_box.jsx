import { Avatar, Button, Input, Row } from "antd";
import { useState } from "react";
import { addReply } from "../services/commentService";

const ReplyBox = ({ id, handleCancel, setComments }) => {
  const [content, setContent] = useState("");
  const handleInputChange = (e) => {
    setContent(e.target.value);
  };
  const handleSubmit = async () => {
    if (!content) {
      alert("回复内容不能为空！");
      return;
    }
    try {
      await addReply({ cid: id, content: content }).then((res) => {
        setContent("");
        setComments((comments) => {
          return comments.map((comment) => {
            if (comment.id === id) {
              return {
                ...comment,
                replies: [...comment.replies, res],
              };
            }
            return comment;
          });
        });
        alert("回复成功！");
      });
    } catch (e) {
      alert(e);
    }
  };

  return (
    <Row align={"middle"} justify={"space-evenly"}>
      <Avatar src="/1.jpg" size="large" />
      <div style={{ width: 20 }} />
      <Input.TextArea
        rows={2}
        placeholder="请输入您的评论"
        value={content}
        onChange={handleInputChange}
        style={{ flex: 1 }}
      />
      <div style={{ width: 20 }} />
      <Button type="primary" onClick={handleSubmit}>
        回复
      </Button>
      <div style={{ width: 20 }} />
      <Button onClick={handleCancel}>取消</Button>
    </Row>
  );
};

export default ReplyBox;
