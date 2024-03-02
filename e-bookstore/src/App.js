import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./pages/home";
import LoginPage from "./pages/login";
import DefaultLayout from "./default_layout";
import Navbar from "./components/navbar";
import Footer from "./components/footer";



const App = () => {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={ <HomePage/>} />
      </Routes>
      <Footer />
    </Router>
  );
};

export default App;
