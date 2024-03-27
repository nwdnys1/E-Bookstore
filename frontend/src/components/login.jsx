import React from "react";
import { Form, Input, Button, Checkbox, Typography, Flex, Row } from "antd";
import {
  UserOutlined,
  LockOutlined,
  EyeTwoTone,
  EyeInvisibleOutlined,
} from "@ant-design/icons";
import { Link, useNavigate } from "react-router-dom";
import { login } from "../services/loginService";

const { Title, Paragraph } = Typography;

const LoginModal = () => {
  return (
    <Form initialValues={{ remember: true }} onFinish={login}>
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
        <Row justify={"space-between"} style={{ width: "100%" }}>
          <Form.Item name="remember" valuePropName="checked" noStyle>
            <Checkbox>记住我</Checkbox>
          </Form.Item>
          <Link to="/forgotpassword">忘记密码？</Link>
        </Row>
        <Button type="primary" htmlType="submit" style={{ width: "100%" }}>
          登录
        </Button>
        <Row justify={"end"} style={{ alignSelf: "end" }}>
          或者<Link to={"/register"}>现在注册！</Link>
        </Row>
      </Flex>
    </Form>
  );
};

export default LoginModal;
