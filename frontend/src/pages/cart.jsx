import { BasicLayout } from "../layouts";
import CartTable from "../components/cart_table";
import { checkAuth } from "../services/loginService";
import { useEffect } from "react";

const CartPage = () => {
  useEffect(() => {
    checkAuth();
  }, []);

  return (
    <BasicLayout>
      <CartTable />
    </BasicLayout>
  );
};

export default CartPage;
