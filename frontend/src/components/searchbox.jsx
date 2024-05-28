import React from "react";
import { Input } from "antd";
import { useNavigate, useSearchParams } from "react-router-dom";
const { Search } = Input;
const SearchBox = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const handleSearch = (value) => {
    searchParams.set("keyword", value);
    searchParams.set("page", 1);
    setSearchParams(searchParams);
  };

  return (
    <Search
      defaultValue={searchParams.get("keyword") || ""}
      placeholder="输入书名、作者或关键词搜索书籍"
      onSearch={handleSearch}
      style={{
        width: "300px",
      }}
    />
  );
};

export default SearchBox;
