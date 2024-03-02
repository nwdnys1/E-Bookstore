import React, { useState } from "react";
import { Form, Input, Button, Checkbox, } from "antd";
import { LoginFormPage, ProFormText } from '@ant-design/pro-components';

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
        height: "83vh",
        width: "100vw",
        background: `url("bg.jpg")`,
        backgroundSize: "cover",
        backgroundPosition: "center",
        margin: "0",
        padding: "0",
      }}
    >
      <Form
        name="login_form"
        className="login-form"
        initialValues={{ remember: true }}
        onFinish={onFinish}
        style={{
          backgroundColor: "white",
          minWidth: "350px",
          width: "20vw",
          height: "420px",
          boxShadow:
            "0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1)", // 添加阴影
          padding: "40px", // 如果需要，可以根据实际情况调整内边距
          borderRadius: "10px", // 添加圆角
        }}
      >
        <div style={{ textAlign: "center", marginBottom: "24px" }}>
          {<img alt="logo" src="logo.jpg" width="40px"></img>}
          <h1 style={{ marginTop: "0px", marginBottom: "5px" }}>E-BOOKSTORE</h1>
          <h3 style={{ color: "rgba(0, 0, 0, .45)", marginTop: "5px" }}>
            电子书城
          </h3>
        </div>

        <Form.Item
          name="username"
          rules={[{ required: true, message: "请输入您的用户名!" }]}
        >
          <Input
            prefix={<UserOutlined className="site-form-item-icon" />}
            placeholder="用户名"
            allowClear // 允许清除输入框内容
          />
        </Form.Item>

        <Form.Item
          name="password"
          rules={[{ required: true, message: "请输入您的密码!" }]}
          style={{ marginBottom: "0px" }}
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

        <Form.Item style={{ marginTop: "10px", marginBottom: "10px" }}>
          <Form.Item name="remember" valuePropName="checked" noStyle>
            <Checkbox>记住我</Checkbox>
          </Form.Item>

          <a className="login-form-forgot" href="" style={{ float: "right" }}>
            忘记密码？
          </a>
        </Form.Item>

        <Form.Item>
          <Button
            type="primary"
            htmlType="submit"
            className="login-form-button"
            style={{ width: "100%", marginBottom: "10px" }}
            loading={loading}
          >
            登录
          </Button>
          或者 <a href="">现在注册！</a>
        </Form.Item>
      </Form>
    </div>
  );
};

export default LoginPage;
