import React, { useEffect, useState } from "react";
import { Button, Flex, Row } from "antd";
import SwitchButton from "./switchbtn";
import { ListLayout } from "./book_list";
import { BlockLayout } from "./book_block";
import { Link } from "react-router-dom";

const BookDisplay = ({ books, withButton, length }) => {
  const [layout, setLayout] = useState(
    sessionStorage.getItem("layout") || "block"
  );
  sessionStorage.setItem("layout", layout);
  return (
    <Flex vertical gap={20} style={{ width: "100%" }}>
      <Row justify={"space-between"}>
        <SwitchButton handleChange={setLayout} layout={layout} />
        {withButton && (
          <Link to="/allbooks/list" style={{ fontSize: "20px" }}>
            <Button type="primary" size="large">
              浏览全部！
            </Button>
          </Link>
        )}
      </Row>
      {layout === "list" ? (
        <ListLayout books={books} length={length} />
      ) : (
        <BlockLayout books={books} length={length} />
      )}
    </Flex>
  );
};

export default BookDisplay;
