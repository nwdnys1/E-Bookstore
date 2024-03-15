// 首页热门话题的标签栏
import React, { useState } from "react";
import { Col, Flex, Tag, Row, Button } from "antd";


const TagBar = ({tags}) => {
  return (
    <Row>
      <Tag color="blue">百合</Tag>
      <Tag color="blue">轻松</Tag>
      <Tag color="blue">日常</Tag>
      <Tag color="blue">萌系</Tag>
    </Row>
  );
};
export default TagBar;
