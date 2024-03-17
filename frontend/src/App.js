import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./pages/home";
import LoginPage from "./pages/login";
import AllBooksPage from "./pages/allbooks";
import DetailsPage from "./pages/details";
import CartPage from "./pages/cart";
import OrderPage from "./pages/order";
import RankPage from "./pages/rank";
import "./css/global.css";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={<HomePage />} />
        <Route path="/allbooks/" element={<AllBooksPage />} />
        <Route path="/details/:id" element={<DetailsPage />} />
        <Route path="/cart" element={<CartPage />} />
        <Route path="/order" element={<OrderPage />} />
        <Route path="/rank" element={<RankPage />} />
      </Routes>
    </Router>
  );
};

export default App;