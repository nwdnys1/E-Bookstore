import React, { useEffect, useState } from "react";
import { Form } from "antd";
import { ProfileForm } from "./profile_form";
import ProfileInfo from "./profile_info";
import { getUser, updateUser } from "../services/userService";

export const Profile = () => {
  const [user, setUser] = useState({});
  const [isEditing, setIsEditing] = useState(false);
  useEffect(() => {
    getUser().then((res) => {
      setUser(res);
    });
  }, []);
  const handleEdit = () => {
    setIsEditing(true);
  };
  const handleCancel = () => {
    setIsEditing(false);
  };
  const handleSave = async (user) => {
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

  return isEditing ? (
    <ProfileForm
      handleSave={handleSave}
      handleCancel={handleCancel}
      user={user}
    />
  ) : (
    <ProfileInfo user={user} handleClick={handleEdit} />
  );
};
