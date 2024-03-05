import React, { useEffect, useState } from "react";
import BookList from "../components/booklist";
import { getAllBooks, searchBooks } from "../services/bookService";
import { Input } from "antd";

const { Search } = Input;

const AllBooksPage = () => {
  const [allBooks, setAllBooks] = useState([]);
  const [searchResults, setSearchResults] = useState([]);
  const withButton = false;

  useEffect(() => {
    // 在页面加载时获取所有书籍数据和推荐书籍数据
    fetchAllBooks();
  }, []);

  const fetchAllBooks = async () => {
    try {
      const books = await getAllBooks();
      setAllBooks(books);
    } catch (error) {
      console.error("Error fetching all books:", error);
    }
  };

  const handleSearch = async (keyword) => {
    if (keyword.trim() === "") {
      setSearchResults([]);
    } else {
      try {
        const { items } = await searchBooks(keyword, 0, 10);
        setSearchResults(items);
      } catch (error) {
        console.error("Error searching books:", error);
      }
    }
  };
  return (
    <div style={{ backgroundImage: `url(234.jpg)` }}>
      <div
        style={{
          width: "70vw",
          minWidth: "1000px", // Add this line
          margin: "0 auto",
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <Search
          placeholder="输入书名、作者或关键词搜索书籍"
          onSearch={handleSearch}
          style={{
            width: "80%",
            margin: "20px 0",
          }}
        />
        <BookList
          books={searchResults.length > 0 ? searchResults : allBooks}
          withButton={withButton}
        />
      </div>
    </div>
  );
};

export default AllBooksPage;
