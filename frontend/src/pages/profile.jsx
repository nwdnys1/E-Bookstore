import { useEffect } from "react";
import { checkAuth } from "../services/loginService";
import { Profile } from "../components/user_profile";
import { BasicLayout } from "../components/layout";

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
