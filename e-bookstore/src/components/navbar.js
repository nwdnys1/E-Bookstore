import React from "react";
import { Menu } from "antd";
import { Link } from "react-router-dom";
import {
  BookOutlined,
  HomeOutlined,
  ShoppingCartOutlined,
  OrderedListOutlined,
  BarChartOutlined,
} from "@ant-design/icons";

const Navbar = () => {
  return (
    <Menu
      mode="horizontal"
      style={{
        height: "8vh",
        display: "flex",
        alignItems: "center",
        backgroundColor: "#f2f2f2",
      }}
    >
      <Menu.Item key="logo" icon={<BookOutlined />}>
        BOOKSTORE
      </Menu.Item>
      <Menu.Item key="home" icon={<HomeOutlined />}>
        <Link to="/">首页</Link>
      </Menu.Item>
      <Menu.Item key="cart" icon={<ShoppingCartOutlined />}>
        <Link to="/cart">购物车</Link>
      </Menu.Item>
      <Menu.Item key="order" icon={<OrderedListOutlined />}>
        <Link to="/orders">订单</Link>
      </Menu.Item>
      <Menu.Item key="stats" icon={<BarChartOutlined />}>
        <Link to="/stats">统计</Link>
      </Menu.Item>
    </Menu>
  );
};

export default Navbar;
