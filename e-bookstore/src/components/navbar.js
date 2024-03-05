import React from "react";
import { Menu,Button } from "antd";
import { Link } from "react-router-dom";
import {
  BookOutlined,
  HomeOutlined,
  ShoppingCartOutlined,
  UnorderedListOutlined,
  OrderedListOutlined,
  ReadOutlined,
  ProfileOutlined,
  BarChartOutlined,
  UserOutlined
} from "@ant-design/icons";

const Navbar = () => {
  return (
    <Menu
      mode="horizontal"
      style={{
        minWidth: "1000px",
        height: "60px",
        display: "flex",
        alignItems: "center",
        backgroundColor: "#f5f5f5",
      }}
    >
      <Menu.Item key="logo" icon={<BookOutlined />}>
        BOOKSTORE
      </Menu.Item>
      <Menu.Item key="home" icon={<HomeOutlined />}>
        <Link to="/">首页</Link>
      </Menu.Item>
      <Menu.Item key="allBooks" icon={<ReadOutlined />}>
        <Link to="/allbooks">所有书籍</Link>
      </Menu.Item>
      <Menu.Item key="cart" icon={<ShoppingCartOutlined />}>
        <Link to="/cart">购物车</Link>
      </Menu.Item>
      <Menu.Item key="order" icon={<OrderedListOutlined />}>
        <Link to="/order">订单</Link>
      </Menu.Item>
      <Menu.Item key="stats" icon={<BarChartOutlined />}>
        <Link to="/rank">统计</Link>
      </Menu.Item>
      <Menu.Item
        key="profile"
        icon={<UserOutlined />}
      ></Menu.Item>

    </Menu>
  );
};

export default Navbar;
