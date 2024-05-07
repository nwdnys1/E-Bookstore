import React, { useEffect, useState } from "react";
import { getAllBooks, searchBooks } from "../services/bookService";
import BookDisplay from "../components/book_display";
import { BasicLayout } from "../components/layout";
import { Flex } from "antd";
import {useSearchParams } from "react-router-dom";

const AllBooksPage = () => {
  const [books, setBooks] = useState([]);
  const [searchParams, setSearchParams] = useSearchParams();
  const keyword = searchParams.get("keyword") || "";
  const page = searchParams.get("page") || 1;
  const pageSize = searchParams.get("pageSize") || 10;//url: /allbooks?keyword=xxx&page=1&pageSize=10

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
