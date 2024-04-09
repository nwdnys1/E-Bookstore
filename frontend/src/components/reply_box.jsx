import { Avatar, Button, Input, Row } from "antd";
import { useState } from "react";
import { useParams } from "react-router-dom";
import { addReply } from "../services/commentService";

const ReplyBox = ({id, handleCancel }) => {
  const [content, setContent] = useState("");

  const handleInputChange = (e) => {
    setContent(e.target.value);
  };

  const handleSubmit = async () => {
    console.log(id);
    if (!content) {
      alert("回复内容不能为空！");
      return;
    }
    await addReply({ cid: id, content: content }).then((res) => {
      alert("回复成功！");
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
      <Button type="primary" onClick={handleSubmit}>
        回复
      </Button>
      <Button type="primary" onClick={handleCancel}>
        取消
      </Button>
    </Row>
  );
};

export default ReplyBox;
