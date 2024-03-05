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
        margin: "0 auto",
        marginBottom: "40px",
        height: "20px",
        minWidth: "530px",
      }}
    >
      <p>© 2024 E-BOOKSTORE</p>
      <a href="/about">关于作者 </a>
    </Footer>
  );
};

export default CustomFooter;
