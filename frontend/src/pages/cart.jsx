import { useEffect } from "react";
import { checkLogin } from "../services/loginService";

const CartPage = () => {
  useEffect(() => {
    checkLogin();
  }, []);

  return (
    <div>
      <h1>Cart Page</h1>
    </div>
  );
};

export default CartPage;
