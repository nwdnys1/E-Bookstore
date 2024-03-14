// 首页热门话题的标签栏
import React, { useState } from "react";
import { Col, Flex, Tag, Row, Button } from "antd";
import TagContext from "../context/tagcontext";
import { getAllArticles } from "../services/articleService";
import SearchContext from "../context/searchcontext";

const TagBar = () => {
  return (
    <Col justify="left" style={{ marginLeft: "30px", marginTop: "30px" }}>
      <Flex gap="4px 0" wrap="wrap" align="center">
        <Col justify={"right"} style={{ margin: "30px" }}>
          <Button onClick={handleClick} hoverable>
            <Row align="middle">
            
            </Row>
          </Button>
        </Col>
        <div
          style={{
            overflow: "hidden",
            transition: "height 0.5s",
          }}
        >
          {tagsData.map((tag) => (
            <Tag.CheckableTag
              key={tag}
              checked={selectedTags === tag}
              onChange={() => {
                handleChange(tag);
                handleSearch("");
              }}
              style={{
                fontSize: "20px",
                margin: "5px",
                padding: "15px",
                borderRadius: "10px",
              }}
            >
              {tag}
            </Tag.CheckableTag>
          ))}
        </div>
      </Flex>
    </Col>
  );
};
export default TagBar;
