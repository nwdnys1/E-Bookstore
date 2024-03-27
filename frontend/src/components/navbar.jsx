import React, { useEffect, useState } from "react";
import { Menu, Layout, Row, Button, Modal } from "antd";
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
import LoginModal from "./login";
import { getUserName } from "../services/userService";
import { logout } from "../services/loginService";
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
    key: "orders",
    icon: <UnorderedListOutlined />,
    label: "订单",
    link: "/orders",
  },
  {
    key: "stastics",
    icon: <BarChartOutlined />,
    label: "统计",
    link: "/stastics",
  },
];

const navItems = Items.map((item) => ({
  key: item.key,
  icon: item.icon,
  label: <Link to={item.link}>{item.label}</Link>,
}));

const Navbar = () => {
  const [showModal, setShowModal] = useState(false);


  const showLogin = () => {
    setShowModal(true);
  };
  const handleCancel = () => {
    setShowModal(false);
  };

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
          <Menu
            mode="horizontal"
            style={{ backgroundColor: "#f5f5f5" }}
            items={[
              {
                key: "user",
                icon: <UserOutlined />,
                label: "登录",
                onClick: showLogin,
              },
              // {
              //   key: "register",
              //   label: <Link to="/register">注册</Link>,
              // },
              {
                key: "logout",
                label: "登出",
                onClick:logout,
              }
            ]}
          />

          <Modal
            open={showModal}
            onCancel={handleCancel}
            footer={null}
            centered
            keyboard
            width={"auto"}
          >
            <LoginModal />
          </Modal>
        </Row>
      </Row>
    </Header>
  );
};

export default Navbar;
