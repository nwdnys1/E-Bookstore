import React, { useEffect, useState } from "react";
import { getAllBooks, searchBooks } from "../services/bookService";
import BookDisplay from "../components/book_display";
import { BasicLayout } from "../layouts";
import { Flex } from "antd";

const AllBooksPage = () => {
  const [allBooks, setAllBooks] = useState([]);
  const [searchResults, setSearchResults] = useState([]);

  useEffect(() => {
    getAllBooks().then((books) => setAllBooks(books));
  }, []);

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
    <BasicLayout>
      <Flex vertical align="center" style={{ marginTop: 20 }}>
        <BookDisplay
          books={searchResults.length > 0 ? searchResults : allBooks}
          withButton={false}
        />
      </Flex>
    </BasicLayout>
  );
};

export default AllBooksPage;
