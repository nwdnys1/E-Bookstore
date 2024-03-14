import React from "react";
import { Menu, Layout, Row } from "antd";
import { Link } from "react-router-dom";
import {
  BookOutlined,
  HomeOutlined,
  ShoppingCartOutlined,
  UnorderedListOutlined,
  ReadOutlined,
  BarChartOutlined,
  UserOutlined,
} from "@ant-design/icons";
import SearchBox from "./searchbox";
const { Header } = Layout;

const Items = [
  { key: "logo", icon: <BookOutlined />, label: "BOOKSTORE", link: "/" },
  { key: "home", icon: <HomeOutlined />, label: "首页", link: "/" },
  {
    key: "allBooks",
    icon: <ReadOutlined />,
    label: "所有书籍",
    link: "/allbooks",
  },
  {
    key: "cart",
    icon: <ShoppingCartOutlined />,
    label: "购物车",
    link: "/cart",
  },
  {
    key: "order",
    icon: <UnorderedListOutlined />,
    label: "订单",
    link: "/order",
  },
  { key: "stats", icon: <BarChartOutlined />, label: "统计", link: "/rank" },
];

const navItems = Items.map((item) => ({
  key: item.key,
  icon: item.icon,
  label: <Link to={item.link}>{item.label}</Link>,
}));

const Navbar = () => {
  return (
    <Header
      style={{
        backgroundColor: "#f5f5f5",
        position: "sticky",
        top: 0,
        zIndex: 999,
        padding: "0",
      }}
    >
      <Row justify={"space-between"}>
        <Menu
          mode="horizontal"
          style={{
            width: "600px",
            backgroundColor: "#f5f5f5",
          }}
          items={navItems}
        ></Menu>
        <Row>
          <Row align="middle">
            <SearchBox />
          </Row>
          <Menu mode="horizontal" style={{ backgroundColor: "#f5f5f5" }}>
            <Menu.Item key="user" icon={<UserOutlined />}>
              <Link to="/user">用户</Link>
            </Menu.Item>
          </Menu>
        </Row>
      </Row>
    </Header>
  );
};

export default Navbar;
