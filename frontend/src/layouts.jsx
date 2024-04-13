import React from "react";
import Navbar from "./components/navbar";
import CustomFooter from "./components/footer";
import { Layout } from "antd";
const { Header, Content, Footer } = Layout;

export const BasicLayout = ({ children }) => {
  return (
    <Layout
      style={{ minWidth: "1000px", background: "white", minHeight: "100vh" }}
    >
      <Navbar />
      <Content style={{ margin: "20px 0" }}>{children}</Content>
      <CustomFooter />
    </Layout>
  );
};
