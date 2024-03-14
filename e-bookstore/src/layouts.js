import React, { useState, useEffect } from "react";
import { List, Card, Button, Typography, Image, Divider, Tabs } from "antd";
import { ShoppingCartOutlined, PayCircleOutlined } from "@ant-design/icons";
import usePaginationHook from "./components/paginationResize";
import BookListItem from "./components/book_listitem";
import BookInfoCard from "./components/book_card";
import CommentList from "./components/comment_list";
import CommentBox from "./components/comment_box";
const { Title, Paragraph } = Typography;

export const ListLayout = ({ books }) => {
  const paginationProps = usePaginationHook();
  return (
    <List
      itemLayout="vertical"
      pagination={paginationProps}
      dataSource={books}
      renderItem={(book) => (
        <List.Item>
          <BookListItem book={book} />
        </List.Item>
      )}
    />
  );
};

export const BlockLayout = ({ books }) => {
  return (
    <List
      grid={{
        column: 6,
      }}
      pagination={{
        position: "bottom",
        pageSize: 18,
        showTotal: (total, range) =>
          `${total} 项中的 ${range[0]}-${range[1]} 项 `,
      }}
      dataSource={books}
      renderItem={(book) => (
        <List.Item style={{ margin: "0" }}>
          <BookInfoCard book={book} />
        </List.Item>
      )}
    />
  );
};

export const DetailLayout = ({ book }) => {
  const handleAddToCart = () => {
    // 处理加入购物车逻辑
  };

  const handleBuyNow = () => {
    // 处理立即购买逻辑
  };
  return (
    <div style={{ display: "flex", alignItems: "center" }}>
      <Image
        alt="Book Cover"
        src={"/" + book.image}
        style={{
          width: "300px",
          aspectRatio: "3/4",
          margin: "0 auto",
          margin: "5px",
          borderRadius: "10px",
          objectFit: "cover",
        }}
      />
      <Card
        bodyStyle={{
          // background: "yellow",
          minHeight: "400px",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          padding: "5px 25px",
        }}
      >
        <Title style={{ margin: "5px" }} level={2}>
          {book.title}
        </Title>
        <Divider orientation="left" style={{ margin: "0px" }}>
          <strong>作者</strong>
        </Divider>
        <Paragraph style={{ textIndent: "2em" }}>{book.author}</Paragraph>
        <Divider orientation="left" style={{ margin: "0px" }}>
          <strong>简介</strong>
        </Divider>
        <Paragraph
          style={{ textIndent: "2em" }}
          ellipsis={{
            rows: 4,
            expandable: true,
            symbol: "展开",
          }}
        >
          {book.description}
        </Paragraph>

        <div style={{ minHeight: "60px" }}>
          <Paragraph>
            价格：
            {book.price.toFixed(2) + "¥"}
          </Paragraph>
        </div>

        <Divider style={{ margin: "0 0 5px 0" }} />
        <div
          style={{
            display: "flex",
            justifyContent: "flex-end",
            // background: "red",
          }}
        >
          <Button
            type="primary"
            icon={<ShoppingCartOutlined />}
            onClick={handleAddToCart}
            style={{ marginRight: "10px" }}
          >
            加入购物车
          </Button>
          <Button
            type="primary"
            icon={<PayCircleOutlined />}
            onClick={handleBuyNow}
          >
            立即购买
          </Button>
        </div>
      </Card>
    </div>
  );
};

export const CommentLayout = ({ comments }) => {
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
