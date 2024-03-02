import React from "react";
import { Layout } from "antd";

const { Footer } = Layout;

const CustomFooter = () => {
  return (
    <Footer
      style={{
        backgroundColor: "white",
        textAlign: "center",
        padding: "0",
        margin: "0",
        height: "5vh",
      }}
    >
      <p>© 2024 E-BOOKSTORE</p>
      <div>
        <a href="/about">关于作者 </a>
        <a href="/contact">联系我们 </a>
        <a href="/terms">服务条款</a>
      </div>
    </Footer>
  );
};

export default CustomFooter;
