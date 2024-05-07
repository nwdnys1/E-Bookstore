import React, { useState } from "react";
import { Card, Avatar, Button, List, Flex, Typography } from "antd";
import ReplyBox from "./reply_box";
import { Link } from "react-router-dom";
import { ReplyList } from "./reply_list";
const { Paragraph } = Typography;
const CommentList = ({ comments, setComments }) => {
  const [replying, setReplying] = useState(null);
  const handleReply = (id) => {
    setReplying(replying === id ? null : id);
  };
  const handleCancel = () => {
    setReplying(null);
  };

  return (
    <List
      dataSource={comments}
      renderItem={(comment) => (
        <List.Item>
          <Flex vertical style={{ width: "100%" }}>
            <Card
              style={{ margin: 0, width: "100%" }}
              actions={
                [
                  // <Button icon={<LikeOutlined />} key="like">
                  //   点赞 ({3})
                  // </Button>,
                  // <Button
                  //   icon={<MessageOutlined />}
                  //   onClick={() => {
                  //     handleReply(comment.id);
                  //   }}
                  //   key="reply"
                  // >
                  //   回复 ({3})
                  // </Button>,
                ]
              }
            >
              <Card.Meta
                avatar={
                  <Link to={`/user/${comment.user.username}`}>
                    <Avatar src={comment.user.avatar} size="large" />
                  </Link>
                }
                title={comment.user.username}
                description={<Paragraph>{comment.content}</Paragraph>}
              />

              <p style={{ fontSize: 14, textAlign: "right" }}>
                {new Date(comment.time).toDateString()}
              </p>
              {!(replying === comment.id) && (
                <Button
                  type={"primary"}
                  onClick={() => handleReply(comment.id)}
                  style={{ float: "right" }}
                >
                  回复
                </Button>
              )}

              {comment.id === replying && (
                <ReplyBox
                  handleCancel={handleCancel}
                  id={comment.id}
                  setComments={setComments}
                  comments={comments}
                />
              )}
              {comment.replies.length > 0 && (
                <ReplyList replies={comment.replies} />
              )}
            </Card>
          </Flex>
        </List.Item>
      )}
      pagination={{
        pageSize: 5,
        showSizeChanger: true,
        position: "bottom",
      }}
    />
  );
};

export default CommentList;
