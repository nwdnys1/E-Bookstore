import { Link } from "react-router-dom";
import { Button } from "antd";

const Navbar = ({children}) => {
  return (
    <nav className="navbar">
      <h1>navigation</h1>
      
      {children}
    </nav>
  );
};

export default Navbar;
