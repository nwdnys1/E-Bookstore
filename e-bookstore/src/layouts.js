import React, { useState, useEffect } from "react";
import { List, Card, Button, Typography, Space, Image, Divider } from "antd";
import {
  LikeOutlined,
  MessageOutlined,
  ShoppingCartOutlined,
} from "@ant-design/icons";
import usePaginationHook from "./components/paginationResize";
import Link from "antd/es/typography/Link";
const { Title, Paragraph } = Typography;

const IconText = ({ icon, text }) => (
  <Space>
    {React.createElement(icon)}
    {text}
  </Space>
);

// 列表布局组件
export const ListLayout = ({ books }) => {
  const paginationProps = usePaginationHook();
  return (
    <List
      itemLayout="vertical"
      pagination={paginationProps}
      dataSource={books}
      renderItem={(book) => (
        <List.Item>
          <Card
            hoverable
            bodyStyle={{ padding: "10px 15px" }}
            actions={[
              <IconText
                icon={ShoppingCartOutlined}
                text="156"
                key="list-vertical-star-o"
              />,
              <IconText
                icon={LikeOutlined}
                text="156"
                key="list-vertical-like-o"
              />,
              <IconText
                icon={MessageOutlined}
                text="2"
                key="list-vertical-message"
              />,
            ]}
          >
            <Link
              href={`/details/${book.id}`}
              style={{ display: "flex", justifyContent: "space-between" }}
            >
              <div
                className="book-info"
                style={{
                  display: "flex",
                  flexDirection: "column",
                  marginRight: "10px",
                }}
              >
                <Title
                  level={4}
                  style={{ margin: "0 0 3px 0px" }}
                  ellipsis={{ rows: 2 }}
                  title={book.title}
                >
                  {book.title}
                </Title>
                <Title
                  type="secondary"
                  style={{ margin: "0 0 3px 0px", fontSize: "14px" }}
                >
                  {book.author}
                </Title>
                <Paragraph
                  ellipsis={{
                    rows: 6,
                    expandable: true,
                    symbol: "展开",
                  }}
                  style={{
                    margin: "0 0 10px 0px",
                    fontSize: "16px",
                    textIndent: "1em",
                  }}
                >
                  {book.description}
                </Paragraph>
              </div>

              <img
                src={"/" + book.image}
                alt="Book Cover"
                style={{
                  alignSelf: "center",
                  width: "12%",
                  minWidth: 120,
                  aspectRatio: "0.75/1",
                  borderRadius: "10px",
                  objectFit: "cover",
                  flex: "none",
                }}
              />
            </Link>
          </Card>
        </List.Item>
      )}
    />
  );
};
// 块状布局组件
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
          <div
            style={{
              width: "90%",
              minWidth: 100,
              aspectRatio: "0.6",
              margin: "0 auto",
              paddingBottom: "5px",
              marginTop: "15px",
              borderRadius: "10px",
              //border: "1px solid #f0f0f0",
              backgroundColor: "#f5f5f5",
            }}
          >
            <Link href={`/details/${book.id}`}>
              <Card
                hoverable
                key={book.id}
                style={{
                  width: "100%",
                  aspectRatio: "0.75/1",
                }}
                bodyStyle={{ display: "none" }}
                cover={
                  <>
                    <img
                      alt="Book Cover"
                      src={book.image}
                      style={{
                        width: "100%",
                        aspectRatio: "3/4",
                        objectFit: "cover",
                        borderRadius: "7px",
                      }}
                    />
                    <div
                      style={{
                        fontSize: "20px",
                        width: "40px",
                        position: "absolute",
                        bottom: 3,
                        right: 5,
                        color: "yellow",
                        textAlign: "right",
                      }}
                    >
                      {book.rating.toFixed(1)}
                    </div>
                  </>
                }
              ></Card>
            </Link>
            <div style={{ height: "70px" }}>
              <Link href={`/details/${book.id}`}>
                <Title
                  style={{
                    color: "blue",
                    paddingBottom: "3px",
                    margin: "3px 0px 0px 5px",
                    fontSize: "14px",
                  }}
                  ellipsis={{ rows: 3 }}
                >
                  {book.title}
                </Title>
              </Link>
              <Title
                style={{
                  margin: "0 0 0px 5px",
                  fontSize: "12px",
                  paddingBottom: "3px",
                }}
                ellipsis={{ rows: 1 }}
              >
                {book.author}
              </Title>
            </div>
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
              }}
            >
              <span
                style={{
                  fontSize: "15px",
                  fontWeight: "bold",
                  marginLeft: "5px",
                }}
              >
                {book.price.toFixed(2) + "¥"}
              </span>
              <Button
                icon={<ShoppingCartOutlined />}
                style={{
                  backgroundColor: "#f0f0f0",
                  borderRadius: "5px",
                  marginRight: "5px",
                }}
              />
            </div>
          </div>
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
    <div style={{ background: "pink", display: "flex" }}>
      <img
        alt="Book Cover"
        src={"/" + book.image}
        style={{
          width: "30%",
          aspectRatio: "3/4",
          margin: "5px",
          borderRadius: "10px",
          objectFit: "cover",
        }}
      />
      <Card
        bodyStyle={{
          background: "yellow",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
        }}
      >
        <Title level={1}>{book.title}</Title>
        <Divider orientation="left">
          <strong>作者：</strong>
        </Divider>
        <Paragraph>{book.author}</Paragraph>
        <Divider orientation="left">
          <strong>简介：</strong>
        </Divider>
        <Paragraph>{book.description}</Paragraph>
        
        <div>
          <Paragraph>
            价格：
            {book.price.toFixed(2) + "¥"}
          </Paragraph>
        </div>

        <Divider />
        <div style={{ display: "flex", justifyContent: "space-between" }}>
          <Button type="primary" onClick={handleAddToCart}>
            加入购物车
          </Button>
          <Button type="primary" onClick={handleBuyNow}>
            立即购买
          </Button>
        </div>
      </Card>
    </div>
  );
};

export const CommentLayout = ({ comments }) => {
  return (
    <div style={{ background: "lightblue", padding: "10px" }}>
      <Title level={3}>评论</Title>
      {comments.map((comment, index) => (
        <Card key={index} style={{ margin: "10px 0" }}>
          <Title level={5}>{comment.user}</Title>
          <Paragraph>{comment.content}</Paragraph>
        </Card>
      ))}
    </div>
  );
};
