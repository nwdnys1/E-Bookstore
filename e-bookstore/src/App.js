import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./pages/home";
import LoginPage from "./pages/login";
import DefaultLayout from "./default_layout";



const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={ <DefaultLayout><HomePage/></DefaultLayout>} />
      </Routes>
    </Router>
  );
};

export default App;
