import { Divider, Flex, Tabs } from "antd";
import { useEffect, useState } from "react";
import CommentBox from "./comment_box";
import CommentList from "./comment_list";
import { useParams } from "react-router-dom";
import { getCommentsByBookId } from "../services/commentService";

const { TabPane } = Tabs;

export const BookComments = () => {
  const [sortBy, setSortBy] = useState("hottest");
  let { id } = useParams();
  const [comments, setComments] = useState([]);
  useEffect(() => {
    getCommentsByBookId(id).then((res) => {
      setComments(res);
    });
  }, []);
  const handleTabChange = (key) => {
    setSortBy(key);
  };
  if (sortBy === "latest") {
    comments.sort((a, b) => new Date(b.time) - new Date(a.time));
  }
  if (sortBy === "hottest") {
    comments.sort((a, b) => b.likes - a.likes);
  }
  if (sortBy === "mostReplies") {
    comments.sort((a, b) => b.replies.length - a.replies.length);
  }

  return (
    <Flex vertical style={{ width: "65%", minWidth: 800 }}>
      <Divider orientation="left">书籍评论</Divider>
      <CommentBox setComments={setComments}/>
      <Tabs activeKey={sortBy} onChange={handleTabChange}>
        <TabPane tab="最热评论" key="hottest">
          <CommentList comments={comments} setComments={setComments} />
        </TabPane>
        <TabPane tab="最新评论" key="latest">
          <CommentList comments={comments} setComments={setComments} />
        </TabPane>
        <TabPane tab="最多回复" key="mostReplies">
          <CommentList comments={comments} setComments={setComments} />
        </TabPane>
      </Tabs>
    </Flex>
  );
};
