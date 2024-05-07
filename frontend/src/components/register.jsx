import React, { useContext } from "react";
import { Form, Input, Button, Checkbox, Typography, Flex, Row } from "antd";
import {
  UserOutlined,
  LockOutlined,
  EyeTwoTone,
  EyeInvisibleOutlined,
  MailOutlined,
} from "@ant-design/icons";
import {  register } from "../services/loginService";

const { Title, Paragraph } = Typography;

const RegisterModal = () => {
  
  return (
    <Form initialValues={{ remember: true }} onFinish={register}>
      <Flex
        vertical
        align="center"
        justify="space-evenly"
        style={{ width: 400, height: 400 }}
      >
        <img alt="logo" src="/logo.jpg" width="45px"></img>
        <Title level={2} style={{ margin: "0" }}>
          E-BOOKSTORE
        </Title>
        <Paragraph type="secondary" style={{ fontSize: 16, margin: "0px" }}>
          电子书城
        </Paragraph>
        <Form.Item
          id="username"
          name="username"
          rules={[{ required: true, message: "请输入您的用户名!" }]}
          style={{ width: "100%", margin: 0 }}
        >
          <Input
            size="large"
            prefix={<UserOutlined />}
            placeholder="用户名"
            allowClear
          />
        </Form.Item>
        <Form.Item
          id="password"
          name="password"
          rules={[{ required: true, message: "请输入您的密码!" }]}
          style={{ width: "100%", margin: 0 }}
        >
          <Input.Password
            size="large"
            prefix={<LockOutlined />}
            type="password"
            placeholder="密码"
            iconRender={(visible) =>
              visible ? <EyeTwoTone /> : <EyeInvisibleOutlined />
            }
          />
        </Form.Item>
        <Form.Item
          id="email"
          name="email"
          rules={[{ required: true, message: "请输入您的邮箱!" }]}
          style={{ width: "100%", margin: 0 }}
        >
          <Input
            size="large"
            prefix={<MailOutlined />}
            placeholder="邮箱"
            allowClear
          />
        </Form.Item>
        <Button type="primary" htmlType="submit" style={{ width: "100%" }}>
          注册
        </Button>
      </Flex>
    </Form>
  );
};

export default RegisterModal;
