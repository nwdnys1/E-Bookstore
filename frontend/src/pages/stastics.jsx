import { useEffect } from "react";
import { BasicLayout, LoginLayout } from "../components/layout";
import { checkLogin } from "../services/loginService";

const StasticsPage = () => {
  return (
    <LoginLayout>
      <div>Stastics Page</div>
    </LoginLayout>
  );
};

export default StasticsPage;
