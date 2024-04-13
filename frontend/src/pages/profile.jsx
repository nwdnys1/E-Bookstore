import { useEffect, useState } from "react";
import { checkAuth } from "../services/loginService";
import { getUser } from "../services/userService";
import { Flex } from "antd";
import { Profile } from "../components/user_profile";
import { BasicLayout } from "../layouts";

export const ProfilePage = () => {
  useEffect(() => {
    checkAuth();
  }, []);
  return (
    <BasicLayout>
      <Profile />
    </BasicLayout>
  );
};
