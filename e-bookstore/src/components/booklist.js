import React, { useState } from "react";
import { Button, Segmented } from "antd";
import { ListLayout, BlockLayout } from "../layouts";
import { BarsOutlined, AppstoreOutlined } from "@ant-design/icons";
import Link from "antd/es/typography/Link";

const BookList = ({ books, withButton }) => {
  const [layout, setLayout] = useState("list");
  const toggleLayout = () => {
    setLayout(layout === "list" ? "block" : "list");
  };

  return (
    <div
      style={{
        position: "relative",
        minWidth: "970px",
        padding: "15px",
        margin: "0",
      }}
    >
      <div style={{ display: "flex", justifyContent: "space-between" }}>
        <Segmented
          value={layout}
          onChange={setLayout}
          size="large"
          options={[
            {
              value: "list",
              icon: <BarsOutlined />,
            },
            {
              value: "block",
              icon: <AppstoreOutlined />,
            },
          ]}
        />
        {withButton ? (
          <Link href="/allbooks" style={{ fontSize: "20px" }}>
            <Button type="primary" size="large">
              浏览全部！
            </Button>
          </Link>
        ) : null}
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
