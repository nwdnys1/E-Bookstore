import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./pages/home";
import LoginPage from "./pages/login";
import AllBooksPage from "./pages/allbooks";
import DetailsPage from "./pages/details";
import CartPage from "./pages/cart";
import OrderPage from "./pages/order";
import RankPage from "./pages/rank";
import Navbar from "./components/navbar";
import Footer from "./components/footer";
import "./css/global.css";



const App = () => {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={ <HomePage/>} />
        <Route path="/allbooks/" element={<AllBooksPage />} />
        <Route path="/details/:id" element={<DetailsPage />} />
        <Route path="/cart" element={<CartPage />} />
        <Route path="/order" element={<OrderPage />} />
        <Route path="/rank" element={<RankPage />} />
      </Routes>
      <Footer />
    </Router>
  );
};

export default App;
