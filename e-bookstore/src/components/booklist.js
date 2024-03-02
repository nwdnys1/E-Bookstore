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
      <Button onClick={toggleLayout} style={{ margin: "10px 0px 0px 10px" }}>
        {layout === "block" ? (
          <UnorderedListOutlined />
        ) : (
          <AppstoreAddOutlined />
        )}
      </Button>

      {layout === "list" ? (
        <List
          style={{ padding: "10px 10px" }}
          grid={{ gutter: 16, column: 1 }}
          dataSource={books}
          renderItem={(book) => (
            <List.Item>
              <Card hoverable>
                <div style={{ display: "flex" ,}}>
                  <div
                    style={{
                      width: "70%",
                      display: "flex",
                      flexDirection: "column",
                      flexGrow: 1,
                      marginRight: "20px",
                    }}
                  >
                    <Title
                      level={5}
                      style={{ margin: "0 0 5px 0px" }}
                      ellipsis={{
                        rows: 1,
                      }}
                    >
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
                        symbol: "展开",
                      }}
                      style={{
                        margin: "0 0 10px 0px",
                        fontSize: "14px",
                        textIndent: "1em",
                      }}
                      title={book.description}
                    >
                      {book.description}
                    </Paragraph>
                  </div>

                  <img
                    src={book.image}
                    alt="Book Cover"
                    style={{
                      margin: "auto",
                      width: 100,
                      height: 120,
                      flex: "0 0 100px",
                      objectFit: "cover",

                      //marginLeft: "auto",
                    }}
                  />
                </div>
              </Card>
            </List.Item>
          )}
        />
      ) : (
        <div
          style={{
            padding: "0px 0px",
            display: "flex",
            flexWrap: "wrap",
            justifyContent: "space-evenly",
            //alignItems: "center",
          }}
        >
          {books.map((book) => (
            <Card
              hoverable
              key={book.id}
              style={{
                width: "14.5vw",
                minWidth: 100,
                height: "auto",
                margin: "10px 10px",
              }}
            >
              <img
                src={book.image}
                alt="Book Cover"
                style={{ width: "100%", height: "auto", objectFit: "cover" }}
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
                    symbol: "展开",
                  }}
                  style={{
                    margin: "0 0 10px 0px",
                    fontSize: "14px",
                    textIndent: "1em",
                  }}
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
