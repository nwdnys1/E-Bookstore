import React from "react";
import ReactDOM from "react-dom/client"; // Import createRoot from "react-dom/client" instead of "react-dom"
import { ConfigProvider } from "antd";
import zhCN from "antd/lib/locale/zh_CN";
import HomePage from "./pages/home";
import AllBooksPage from "./pages/allbooks";
import DetailsPage from "./pages/details";
import ErrorPage from "./pages/error";
import OrdersPage from "./pages/orders";
import StasticsPage from "./pages/stastics";
import CartPage from "./pages/cart";
import { AuthProvider } from "./context/authContext";
import ScrollToTop from "./components/scrollToTop";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

const App = () => (
  <ConfigProvider locale={zhCN}>
    <AuthProvider>
      <Router>
        <ScrollToTop />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/allbooks" element={<AllBooksPage />} />
          <Route path="/allbooks/keyword=:keyword" element={<AllBooksPage />} />
          <Route path="/details/:id" element={<DetailsPage />} />
          <Route path="/cart" element={<CartPage />} />
          <Route path="/orders" element={<OrdersPage />} />
          <Route path="/stastics" element={<StasticsPage />} />
          <Route path="*" element={<ErrorPage />} />
        </Routes>
      </Router>
    </AuthProvider>
  </ConfigProvider>
);

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
