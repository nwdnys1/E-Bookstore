import { Divider, Tabs } from "antd";
import { useState } from "react";
import CommentBox from "./comment_box";
import CommentList from "./comment_list";

export const BookComments= ({ comments }) => {
    const { TabPane } = Tabs;
  
    const [activeTab, setActiveTab] = useState("latest");
  
    const handleTabChange = (key) => {
      setActiveTab(key);
    };
  
    return (
      <div style={{ padding: "10px" }}>
        <Divider>书籍评论</Divider>
        <CommentBox />
        <Tabs activeKey={activeTab} onChange={handleTabChange}>
          <TabPane tab="最新评论" key="latest">
            <CommentList comments={comments} />
          </TabPane>
          <TabPane tab="最热评论" key="hottest">
            <CommentList comments={comments} />
          </TabPane>
          <TabPane tab="最多回复" key="mostReplies">
            <CommentList comments={comments} />
          </TabPane>
        </Tabs>
      </div>
    );
  };
  