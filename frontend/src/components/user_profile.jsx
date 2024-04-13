import React, { useEffect, useState } from "react";
import { Card, Avatar, Form, Input, Button, Select, Typography } from "antd";
import { ProfileForm } from "./profile_form";
import ProfileInfo from "./profile_info";
import { getUser, updateUser } from "../services/userService";

export const Profile = () => {
  const [user, setUser] = useState({});
  const [isEditing, setIsEditing] = useState(false);
  const [form] = Form.useForm();
  form.setFieldsValue(user);
  useEffect(() => {
    getUser().then((res) => {
      setUser(res);
    });
  }, []);
  const handleEdit = () => {
    setIsEditing(true);
  };
  const handleSave = async (user) => {
    console.log(user);
    try {
      await updateUser(user).then((res) => {
        setUser(res);
        alert("修改成功！");
      });
    } catch (e) {
      alert(e);
    }
    setIsEditing(false);
  };
  const handleCancel = () => {
    setIsEditing(false);
  };

  return isEditing ? (
    <ProfileForm
      form={form}
      handleSave={handleSave}
      handleCancel={handleCancel}
      user={user}
    />
  ) : (
    <ProfileInfo user={user} handleClick={handleEdit} />
  );
};
