import React, { useState } from "react";
import { Button } from "antd";
import { ListLayout, BlockLayout } from "../layouts";
import { UnorderedListOutlined, AppstoreAddOutlined } from "@ant-design/icons";
import Link from "antd/es/typography/Link";

const BookList = ({ books }) => {
  const [layout, setLayout] = useState("list");
  const toggleLayout = () => {
    setLayout(layout === "list" ? "block" : "list");
  };

  return (
    <div
      style={{
        position: "relative",
        minWidth: "500px",
        padding: "15px",
        margin:"0"
      }}
    >
      <div style={{ display: "flex", justifyContent: "space-between" }}>
        <Button onClick={toggleLayout}>
          {layout === "block" ? (
            <UnorderedListOutlined />
          ) : (
            <AppstoreAddOutlined />
          )}
        </Button>
        <Link href="/allbooks">
          <Button type="primary">浏览全部</Button>
        </Link>
      </div>
      {layout === "list" ? (
        <ListLayout books={books} />
      ) : (
        <BlockLayout books={books} />
      )}
    </div>
  );
};

export default BookList;
