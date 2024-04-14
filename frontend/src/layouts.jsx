import React from "react";
import Navbar from "./components/navbar";
import CustomFooter from "./components/footer";
import { Layout } from "antd";
const { Content } = Layout;

export const BasicLayout = ({ children }) => {
  return (
    <Layout
      style={{ minWidth: "1000px", background: "white", minHeight: "100vh" }}
    >
      <Navbar />
      <Content
        style={{
          alignSelf: "center",
          margin: "20px 0",
          width: "65%",
          minWidth: 800,
        }}
      >
        {children}
      </Content>
      <CustomFooter />
    </Layout>
  );
};
