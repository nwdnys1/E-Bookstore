import React from "react";
import { Layout } from "antd";

const { Footer } = Layout;

const CustomFooter = () => {
  return (
    <Footer
      style={{
        textAlign: "center",
      }}
    >
      <p>© 2024 E-BOOKSTORE</p>
      <a href="/about">关于作者 </a>
    </Footer>
  );
};

export default CustomFooter;
