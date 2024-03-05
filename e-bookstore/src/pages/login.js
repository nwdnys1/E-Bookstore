import React, { useState } from "react";
import { Form, Input, Button, Checkbox } from "antd";


import {
  UserOutlined,
  LockOutlined,
  EyeTwoTone,
  EyeInvisibleOutlined,
} from "@ant-design/icons";

const LoginPage = () => {
  const [loading, setLoading] = useState(false);

  const onFinish = (values) => {
    console.log("Received values of form: ", values);
    // 在这里处理登录逻辑
    window.alert("登录成功");
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "85vh",
        minHeight: "450px",
        width: "100%",
        minWidth: "350px",
        background: `url("bg.jpg")`,
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <Form
        name="login_form"
        className="login-form"
        initialValues={{ remember: true }}
        onFinish={onFinish}
        style={{
          backgroundColor: "white",
          width: "20vw",
          minWidth: "300px",
          height: "20vw",
          minHeight: "400px",
          boxShadow:
            "0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1)", // 添加阴影
          borderRadius: "30px", // 添加圆角
          display: "flex",
          padding: "20px",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <div
          style={{
            width: "100%",
            height: "100%",
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <img alt="logo" src="logo.jpg" width="45px"></img>
          <h1 style={{ marginTop: "0px", marginBottom: "0px" }}>E-BOOKSTORE</h1>
          <h3 style={{ color: "rgba(0, 0, 0, .45)", marginTop: "0px" }}>
            电子书城
          </h3>
          <Form.Item
            name="username"
            rules={[{ required: true, message: "请输入您的用户名!" }]}
            style={{ marginBottom: "15px", width: "100%" }}
          >
            <Input
              prefix={<UserOutlined className="site-form-item-icon" />}
              placeholder="用户名"
              allowClear // 可以一键清除输入框内容
            />
          </Form.Item>
          <Form.Item
            name="password"
            rules={[{ required: true, message: "请输入您的密码!" }]}
            style={{ marginBottom: "10px", width: "100%" }}
          >
            <Input.Password
              prefix={<LockOutlined className="site-form-item-icon" />}
              type="password"
              placeholder="密码"
              iconRender={(visible) =>
                visible ? <EyeTwoTone /> : <EyeInvisibleOutlined />
              }
            />
          </Form.Item>
          <Form.Item style={{ marginBottom: "10px", width: "100%" }}>
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <Form.Item name="remember" valuePropName="checked" noStyle>
                <Checkbox>记住我</Checkbox>
              </Form.Item>
              <a className="login-form-forgot" href="/forgotpassword">
                忘记密码？
              </a>
            </div>
          </Form.Item>
          <Form.Item style={{ marginBottom: "10px", width: "100%" }}>
            <Button
              type="primary"
              htmlType="submit"
              className="login-form-button"
              style={{ width: "100%", marginBottom: "15px" }}
              loading={loading}
            >
              登录
            </Button>
            或者<a href="/register"> 现在注册！</a>
          </Form.Item>
        </div>
      </Form>
    </div>
  );
};

export default LoginPage;
