import React, { useEffect, useState } from "react";
import BookCarousel from "../components/carousel";
import BookList from "../components/booklist";
import {
  getAllBooks,
  getRecommendedBooks,
  searchBooks,
} from "../services/bookService";
import { Input } from "antd";

const { Search } = Input;

const Home = () => {
  const [allBooks, setAllBooks] = useState([]);
  const [recommendedBooks, setRecommendedBooks] = useState([]);
  const [searchResults, setSearchResults] = useState([]);

  useEffect(() => {
    // 在页面加载时获取所有书籍数据和推荐书籍数据
    fetchAllBooks();
    fetchRecommendedBooks();
  }, []);

  const fetchAllBooks = async () => {
    try {
      const books = await getAllBooks();
      setAllBooks(books);
    } catch (error) {
      console.error("Error fetching all books:", error);
    }
  };

  const fetchRecommendedBooks = async () => {
    try {
      const books = await getRecommendedBooks();
      setRecommendedBooks(books);
    } catch (error) {
      console.error("Error fetching recommended books:", error);
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
    <div
      style={{
        width: "70vw",
        minWidth: "530px",
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
          margin: "20px 0",
        }}
      />
      <BookCarousel books={recommendedBooks} />
      <BookList books={allBooks.slice(0,5)} />
    </div>
  );
};

export default Home;
