import React from "react";
import { Input } from "antd";
import { useNavigate } from "react-router-dom";
const { Search } = Input;
const SearchBox = () => {
  const navigate = useNavigate();
  const handleSearch = (value) => {
    navigate('/search?keyword=' + value);
  };
  return (
    <Search
      placeholder="输入书名、作者或关键词搜索书籍"
      onSearch={handleSearch}
      style={{
        width: "300px",
      }}
    />
  );
};

export default SearchBox;
