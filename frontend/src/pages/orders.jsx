import { useEffect } from "react";
import { checkLogin } from "../services/loginService";

const OrdersPage = () => {
  useEffect(() => {
    checkLogin();
  }, []);
  return (
    <div>
      <h1>Orders Page</h1>
    </div>
  );
};

export default OrdersPage;
