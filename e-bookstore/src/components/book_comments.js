import { Divider, Flex, Tabs } from "antd";
import { useState } from "react";
import CommentBox from "./comment_box";

import BookCommentList from "./book_commentlist";

export const BookComments = () => {

  const [sortBy, setSortBy] = useState("latest");
  const handleTabChange = (key) => {
    setSortBy(key);
  };

  return (
    <Flex vertical style={{ width: "65%", minWidth: 800 }}>
      <Divider>书籍评论</Divider>
      <CommentBox />
      <BookCommentList sortBy={sortBy} handleTabChange={handleTabChange} />
    </Flex>
  );
};
