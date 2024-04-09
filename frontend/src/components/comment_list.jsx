import React, { useEffect, useState } from "react";
import { Card, Avatar, Collapse, Button, List } from "antd";
import { UserOutlined, LikeOutlined, MessageOutlined } from "@ant-design/icons";
import { useParams } from "react-router-dom";
import { getCommentsByBookId } from "../services/commentService";
const { Panel } = Collapse;

const CommentList = () => {
  const [comments, setComments] = useState([]);
  let { id } = useParams();
  useEffect(() => {
    getCommentsByBookId(id).then((res) => {
      setComments(res);
    });
  }, []);
  return (
    <List
      dataSource={comments}
      renderItem={(comment) => (
        <List.Item>
          <Card
            style={{ margin: 0, width: "100%" }}
            actions={[
              // <Button icon={<LikeOutlined />} key="like">
              //   点赞 ({comment.likes})
              // </Button>,
              // <Button icon={<MessageOutlined />} key="reply">
              //   回复 ({comment.replies.length})
              // </Button>,
            ]}
          >
            <Card.Meta
              avatar={<Avatar icon={<UserOutlined />} size="large" />}
              title={comment.user.username}
              description={comment.content}
            />
            <p style={{ fontSize: 12, textAlign: "right" }}>{comment.time}</p>
            {0 && (
              <Collapse ghost size="small">
                {/* <Panel header={`回复 (${comment.replies.length})`} key="1">
                  {comment.replies.map((reply, index) => (
                    <div
                      key={index}
                      style={{ display: "flex", alignItems: "center" }}
                    >
                      <Avatar
                        icon={<UserOutlined />}
                        style={{ marginRight: 8 }}
                      />
                      <div>
                        <p>{reply.user}</p>
                        <p>{reply.content}</p>
                      </div>
                    </div>
                  ))}
                </Panel> */}
              </Collapse>
            )}
          </Card>
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
