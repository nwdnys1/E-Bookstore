import { Tabs } from "antd";
import CommentList from "./comment_list";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getCommentsByBookId } from "../services/commentService";

const { TabPane } = Tabs;

const BookCommentList = ({ sortBy, handleTabChange }) => {
  let { id } = useParams();
  const [comments, setComments] = useState([]);
  useEffect(() => {
    getCommentsByBookId(id).then((res) => {
      setComments(res);
    });
  }, []);
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
    <Tabs activeKey={sortBy} onChange={handleTabChange}>
      <TabPane tab="最热评论" key="hottest">
        <CommentList comments={comments} />
      </TabPane>
      <TabPane tab="最新评论" key="latest">
        <CommentList comments={comments} />
      </TabPane>

      <TabPane tab="最多回复" key="mostReplies">
        <CommentList comments={comments} />
      </TabPane>
    </Tabs>
  );
};

export default BookCommentList;
