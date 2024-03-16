import React, { useState } from "react";
import { Button, Flex, Row } from "antd";
import SwitchButton from "./switchbtn";
import { ListLayout } from "./book_list";
import { BlockLayout } from "./book_block";
import { Link } from "react-router-dom";

const BookDisplay = ({ books, withButton }) => {
  const [layout, setLayout] = useState("block");

  return (
    <Flex
      vertical
      style={{
        padding: "0 30px",
        width: "65%",
        minWidth: 800,
      }}
      gap={20}
    >
      <Row justify={"space-between"}>
        <SwitchButton handleChange={setLayout} />
        {withButton && (
          <Link to="/allbooks" style={{ fontSize: "20px" }}>
            <Button type="primary" size="large">
              浏览全部！
            </Button>
          </Link>
        )}
      </Row>
      {layout === "list" ? (
        <ListLayout books={books} />
      ) : (
        <BlockLayout books={books} />
      )}
    </Flex>
  );
};

export default BookDisplay;
