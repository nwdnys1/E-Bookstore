import React from "react";
import Navbar from "./components/navbar";
import Sidebar from "./components/sidebar";

const DefaultLayout = ({ children }) => {
  return (
    <div className="container">
      <Navbar />
      <div className="content">
        <Sidebar />
        <div className="main-content">{children}</div>
      </div>
    </div>
  );
};

export default DefaultLayout;
