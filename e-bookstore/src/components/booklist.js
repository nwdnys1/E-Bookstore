import React, { useState } from "react";
import { List, Card, Button, Typography } from "antd";
import {
  OrderedListOutlined,
  AppstoreAddOutlined,
  BlockOutlined,
  UnorderedListOutlined,
} from "@ant-design/icons";
const { Title, Author, Paragraph } = Typography;

const BookList = ({ books }) => {
  const [layout, setLayout] = useState("block");

  const toggleLayout = () => {
    setLayout(layout === "list" ? "block" : "list");
  };

  return (
    <div style={{ background: "#f2f2f2", position: "relative" }}>
      <Button onClick={toggleLayout} style={{ margin: "10px 10px 10px 20px" }}>
        {layout === "list" ? (
          <UnorderedListOutlined />
        ) : (
          <AppstoreAddOutlined />
        )}
      </Button>

      {layout === "list" ? (
        <List
          style={{ padding: "20px" }}
          grid={{ gutter: 16, column: 1 }}
          dataSource={books}
          renderItem={(book) => (
            <List.Item>
              <Card style={{ height: "150px", position: "relative" }}>
                <div
                  style={{
                    position: "absolute",
                    top: 15,
                    left: 10,
                    right: 120,
                  }}
                >
                  <Title level={5} style={{ margin: "0 0 5px 0px" }}>
                  {book.title}
                </Title>
                <Title
                  type="secondary"
                  style={{ margin: "0 0 5px 0px", fontSize: "10px" }}
                >
                  {book.author}
                </Title>
                <Paragraph
                  ellipsis={{
                    rows: 3,
                    expandable: true,
                  }}
                  style={{ margin: "0 0 10px 0px", fontSize: "14px",textIndent:'1em'}}
                  title={book.description}
                >
                  {book.description}
                </Paragraph>
                </div>
                <img
                  src={book.image}
                  alt="Book Cover"
                  style={{
                    width: 100,
                    height: 120,
                    objectFit: "cover",
                    position: "absolute",
                    top: 15,
                    right: 10,
                  }}
                />
              </Card>
            </List.Item>
          )}
        />
      ) : (
        <div
          style={{
            display: "flex",
            flexWrap: "wrap",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          {books.map((book) => (
            <Card
              key={book.id}
              style={{ width: "17%", minWidth: 270, margin: 16, height: 500 }}
            >
              <img
                src={book.image}
                alt="Book Cover"
                style={{ width: "100%", height: 200, objectFit: "cover" }}
              />
              <div style={{ margin: "10px 0 10px 0px" }}>
                <Title level={5} style={{ margin: "0 0 5px 0px" }}>
                  {book.title}
                </Title>
                <Title
                  type="secondary"
                  style={{ margin: "0 0 5px 0px", fontSize: "10px" }}
                >
                  {book.author}
                </Title>
                <Paragraph
                  ellipsis={{
                    rows: 5,
                    expandable: true,
                  }}
                  style={{ margin: "0 0 10px 0px", fontSize: "14px",textIndent:'1em'}}
                  title={book.description}
                >
                  {book.description}
                </Paragraph>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
};

export default BookList;
