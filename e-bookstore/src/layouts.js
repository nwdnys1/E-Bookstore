import React, { useState, useEffect } from "react";
import { List, Card, Button, Typography, Space, Pagination } from "antd";
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
            bodyStyle={{ display: "flex", padding: "10px 15px" }}
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
                //title={book.description}
              >
                {book.description}
              </Paragraph>
            </div>

            <img
              src={book.image}
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
        xs: 3,
        sm: 3,
        md: 3,
        lg: 4,
        xl: 5,
        xxl: 6,
      }}
      pagination={{
        position: "bottom",
        showTotal: (total, range) =>
          `${total} 项中的 ${range[0]}-${range[1]} 项 `,
      }}
      dataSource={books}
      renderItem={(book) => (
        <List.Item style={{ padding: "0", margin: "0" }}>
          <div
            style={{
              width: "12%",
              minWidth: 150,
              aspectRatio: "0.45",
              margin: "0 auto",
              marginTop: "15px",
            }}
          >
            <Link href={`/book/${book.id}`}>
              <Card
                hoverable
                key={book.id}
                style={{
                  width: "100%",
                  aspectRatio: "0.75/1",
                }}
                bodyStyle={{ display: "none" }}
                cover={
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
                }
              ></Card>
            </Link>
            
            <Link href={`/book/${book.id}`}>
              <Title
                style={{
                  color: "blue",
                  paddingBottom: "3px",
                  margin: "0 0px 0px 5px",
                  fontSize: "16px",
                }}
                ellipsis={{ rows: 2 }}
              >
                {book.title}
              </Title>
            </Link>
            <Title
              style={{ margin: "0 0 0px 5px", fontSize: "12px" }}
              ellipsis={{ rows: 2 }}
            >
              {book.author}
            </Title>
            <Card
              style={{
                boxShadow: "none",
              }}
              bordered={false}
              bodyStyle={{ display: "none" }}
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
              ]}
            />
          </div>
        </List.Item>
      )}
    />
  );
};
