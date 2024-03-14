import React, { useState } from "react";
import { Button, Segmented } from "antd";
import { Link } from "react-router-dom";
import { AppstoreOutlined, BarsOutlined } from "@ant-design/icons";

const SwitchButton = ({ handleChange }) => {
  return (
    <Segmented
      defaultValue="list"
      onChange={handleChange}
      size="large"
      options={[
        {
          value: "list",
          icon: <BarsOutlined />,
        },
        {
          value: "block",
          icon: <AppstoreOutlined />,
        },
      ]}
    />
  );
};

export default SwitchButton;
