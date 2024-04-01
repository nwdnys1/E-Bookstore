import React, { useEffect, useState } from "react";
import { getAllBooks, searchBooks } from "../services/bookService";
import BookDisplay from "../components/book_display";
import { BasicLayout } from "../layouts";
import { Flex } from "antd";

const AllBooksPage = () => {
  const [allBooks, setAllBooks] = useState([]);

  useEffect(() => {
    getAllBooks().then((books) => setAllBooks(books));
  }, []);

  return (
    <BasicLayout>
      <Flex vertical align="center" style={{ marginTop: 20 }}>
        <BookDisplay books={allBooks} withButton={false} />
      </Flex>
    </BasicLayout>
  );
};

export default AllBooksPage;
