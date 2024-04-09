import React, { useEffect, useState } from "react";
import { getAllBooks, searchBooks } from "../services/bookService";
import BookDisplay from "../components/book_display";
import { BasicLayout } from "../layouts";
import { Flex } from "antd";
import {useSearchParams } from "react-router-dom";

const AllBooksPage = () => {
  const [books, setBooks] = useState([]);
  const [searchParams, setSearchParams] = useSearchParams();
  const keyword = searchParams.get("keyword") || "";

  useEffect(() => {
    if (keyword !== "") {
      searchBooks(keyword).then((books) => setBooks(books));
    } else getAllBooks().then((books) => setBooks(books));
  }, [keyword]);

  return (
    <BasicLayout>
      <Flex vertical align="center" style={{ marginTop: 20 }}>
        <BookDisplay books={books} withButton={false} />
      </Flex>
    </BasicLayout>
  );
};

export default AllBooksPage;
