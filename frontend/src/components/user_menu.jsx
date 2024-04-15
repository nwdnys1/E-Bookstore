import React, { useContext, useEffect, useState } from "react";
import {
  UserOutlined,
  ShoppingCartOutlined,
  OrderedListOutlined,
  LogoutOutlined,
  TeamOutlined,
  ReadOutlined,
  BookOutlined,
  EditOutlined,
  DatabaseOutlined,
} from "@ant-design/icons";
import { Avatar, Dropdown, Menu, Modal } from "antd";
import { checkLogin, logout } from "../services/loginService";
import { Link } from "react-router-dom";
import LoginModal from "./login";
import { AuthContext } from "../context/authContext";
import { getUser } from "../services/userService";

const items = [
  {
    key: "userPage",
    label: <Link to="/profile">个人中心</Link>,
    icon: <UserOutlined />,
  },
  {
    key: "logout",
    label: <div onClick={logout}>退出登录</div>,
    icon: <LogoutOutlined />,
  },
  {
    key: "cart",
    label: <Link to="/cart">购物车</Link>,
    icon: <ShoppingCartOutlined />,
  },
  {
    key: "orders",
    label: <Link to="/orders">订单</Link>,
    icon: <OrderedListOutlined />,
  },
  {
    key: "userAdmin",
    label: <Link to="/admin/users">用户管理</Link>,
    icon: <TeamOutlined />,
  },
  {
    key: "bookAdmin",
    label: <Link to="/admin/books">书籍管理</Link>,
    icon: <DatabaseOutlined />,
  },
];

const UserMenu = () => {
  const [showModal, setShowModal] = useState(false);
  const { isLogin, setIsLogin } = useContext(AuthContext);
  const [user, setUser] = useState({});
  useEffect(() => {
    checkLogin()
      .then((res) => {
        setIsLogin(res);
        return res;
      })
      .then((res) => {
        if (res) {
          getUser().then((res) => {
            setUser(res);
          });
        }
      });
  }, []);

  const showLogin = () => {
    if (!isLogin) setShowModal(true);
  };
  const closeModal = () => {
    setShowModal(false);
  };
  return (
    <>
      {isLogin ? (
        <Dropdown
          menu={{
            items: user.role === "admin" ? items : items.slice(0, 4),
          }}
        >
          <Menu
            mode="horizontal"
            style={{
              backgroundColor: "#f5f5f5",
              minWidth: "100px",
            }}
            items={[
              {
                key: "user",
                icon: <Avatar src={user.avatar} shape="round" />,
                label: isLogin ? user.username : "登录",
                onClick: showLogin,
                style: { display: "flex", alignItems: "center" },
              },
            ]}
          />
        </Dropdown>
      ) : (
        <Menu
          mode="horizontal"
          style={{
            backgroundColor: "#f5f5f5",
            minWidth: "100px",
            justifyContent: "center",
          }}
          items={[
            {
              key: "user",
              icon: <UserOutlined />,
              label: isLogin ? user.username : "登录",
              onClick: showLogin,
            },
          ]}
        />
      )}
      <Modal
        open={showModal}
        onCancel={closeModal}
        footer={null}
        centered
        keyboard
        width={"auto"}
      >
        <LoginModal />
      </Modal>
    </>
  );
};

export default UserMenu;
