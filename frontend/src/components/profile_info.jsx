import React from "react";
import { Avatar, Button, Col, Flex, Row, Space, Tag, Typography } from "antd";

const { Text, Title, Paragraph } = Typography;

const ProfileInfo = ({ user, handleClick }) => {
  return (
    <Row style={{ width: "65%", margin: "0 auto", minWidth: 800 }}>
      <Space direction="vertical" align="center">
        <Avatar src={user.avatar} size={200} />
        <Title level={2} style={{ margin: "10px 0 0 0" }}>
          {user.username}
        </Title>
        <Space>
          <Text type="secondary" strong>
            {user.role === "admin" ? "管理员" : "普通用户"}
          </Text>
          <Tag color={"gold"}>{`Lv.${user.level}`}</Tag>
        </Space>
        <Text strong> {`TEL：${user.tel}`}</Text>
        <Text strong underline>
          {" "}
          {`${user.email}`}
        </Text>
      </Space>
      <Col flex={"1"}>
        <Row justify={"space-between"} align={"middle"}>
          <Paragraph
            strong
            style={{ fontSize: "1.5em", margin: "30px 0 30px 40px" }}
          >
            {`个人简介:`}
          </Paragraph>
          <Button onClick={handleClick}>修改资料</Button>
        </Row>
        <Paragraph
          style={{
            fontSize: "1.2em",
            margin: "30px 0 0 40px",
            textIndent: "2em",
          }}
        >
          {user.aboutMe}
        </Paragraph>
      </Col>
    </Row>
  );
};

export default ProfileInfo;
