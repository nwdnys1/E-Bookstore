import { useEffect, useState } from "react";

import { BasicLayout } from "../layouts";
import ProfileInfo from "../components/profile_info";
import { getOtherUser } from "../services/userService";
import { useParams } from "react-router-dom";

export const UserPage = () => {
  const [user, setUser] = useState({});
  const { username } = useParams();
  useEffect(() => {
    getOtherUser(username).then((res) => {
      setUser(res);
    });
  }, []);
  return (
    <BasicLayout>
      <ProfileInfo user={user} />
    </BasicLayout>
  );
};
