import React, { useEffect, useState } from "react";
import { Card, Avatar, Collapse, Button, List, Input } from "antd";
import { UserOutlined, LikeOutlined, MessageOutlined } from "@ant-design/icons";
import { useParams } from "react-router-dom";
import { getCommentsByBookId } from "../services/commentService";
const { Panel } = Collapse;

const CommentList = () => {
  const [comments, setComments] = useState([]);
  const [replying, setReplying] = useState(null);
  let { id } = useParams();
  useEffect(() => {
    getCommentsByBookId(id).then((res) => {
      setComments(res);
    });
  }, []);
  const handleReply = (id) => {
    setReplying(replying === id ? null : id);
  };
  return (
    <List
      dataSource={comments}
      renderItem={(comment) => (
        <List.Item>
          <Card
            style={{ margin: 0, width: "100%" }}
            actions={[
              <Button icon={<LikeOutlined />} key="like">
                点赞 ({3})
              </Button>,
              <Button
                icon={<MessageOutlined />}
                onClick={() => {
                  handleReply(comment.id);
                }}
                key="reply"
              >
                回复 ({3})
              </Button>,
            ]}
          >
            <Card.Meta
              avatar={<Avatar src={comment.user.avatar} size="large" />}
              title={comment.user.username}
              description={comment.content}
            />
            <p style={{ fontSize: 12, textAlign: "right" }}>
              {new Date(comment.time).toLocaleString()}
            </p>
            {comment.replies.length > 0 && (
              <Collapse ghost size="small">
                <Panel header={`回复 (${comment.replies.length})`} key="1">
                  {comment.replies.map((reply, index) => (
                    <div
                      key={index}
                      style={{ display: "flex", alignItems: "center" }}
                    >
                      <Avatar
                        src={reply.user.avatar}
                        style={{ marginRight: 8 }}
                      />
                      <div>
                        <p>{reply.user.username}</p>
                        <p>{reply.content}</p>
                      </div>
                    </div>
                  ))}
                </Panel>
              </Collapse>
            )}
          </Card>
          {comment.id === replying && <Input />}
        </List.Item>
      )}
      pagination={{
        pageSize: 5,
        showSizeChanger: true,
        position: "top",
      }}
    />
  );
};

export default CommentList;
