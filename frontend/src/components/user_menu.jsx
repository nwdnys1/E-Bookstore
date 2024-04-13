import React, { useContext, useEffect, useState } from "react";
import {
  UserOutlined,
  ShoppingCartOutlined,
  OrderedListOutlined,
  LogoutOutlined,
} from "@ant-design/icons";
import { Dropdown, Menu, Modal } from "antd";
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
];

const UserMenu = () => {
  const [showModal, setShowModal] = useState(false);
  const { isLogin, setIsLogin } = useContext(AuthContext);
  const [username, setUsername] = useState("登录");

  useEffect(() => {
    checkLogin()
      .then((res) => {
        setIsLogin(res);
        return res;
      })
      .then((res) => {
        if (res) {
          getUser().then((res) => {
            setUsername(res.username);
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
        <Dropdown menu={{ items }}>
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
                label: username,
                onClick: showLogin,
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
              label: username,
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
