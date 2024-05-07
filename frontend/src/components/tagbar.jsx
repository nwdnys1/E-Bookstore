// 首页热门话题的标签栏
import React, { useState } from "react";
import { Col, Flex, Tag, Row, Button } from "antd";

const TagBar = ({ tags }) => {
  return (
    tags && (
      <Row align={"middle"}>
        {tags.map((tag) => (
          <Tag key={tag.id} color="blue">
            {tag.content}
          </Tag>
        ))}
      </Row>
    )
  );
};
export default TagBar;
