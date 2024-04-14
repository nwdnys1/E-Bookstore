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
    //理论上应该做到后端业务逻辑里
    comments.sort((a, b) => new Date(b.time) - new Date(a.time));
  }
  if (sortBy === "hottest") {
    comments.sort((a, b) => b.likes - a.likes);
  }
  if (sortBy === "mostReplies") {
    comments.sort((a, b) => b.replies.length - a.replies.length);
  }
  const TabPanes = [
    {
      label: "最热评论",
      key: "hottest",
      children: <CommentList comments={comments} setComments={setComments} />,
    },
    {
      label: "最新评论",
      key: "latest",
      children: <CommentList comments={comments} setComments={setComments} />,
    },
    {
      label: "最多回复",
      key: "mostReplies",
      children: <CommentList comments={comments} setComments={setComments} />,
    },
  ];
  return (
    <Flex vertical>
      <Divider orientation="left">书籍评论</Divider>
      <CommentBox setComments={setComments} />
      <Tabs
        activeKey={sortBy}
        onChange={handleTabChange}
        items={TabPanes}
      ></Tabs>
    </Flex>
  );
};
