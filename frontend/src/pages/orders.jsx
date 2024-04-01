import { useEffect } from "react";
import { checkAuth } from "../services/loginService";
import { BasicLayout } from "../layouts";
import OrderTable from "../components/order_table";

const OrdersPage = () => {
  useEffect(() => {
    checkAuth();
  }, []);
  return (
    <BasicLayout>
      <OrderTable />
    </BasicLayout>
  );
};

export default OrdersPage;
