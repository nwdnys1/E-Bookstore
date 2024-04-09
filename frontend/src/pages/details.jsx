import React, { useEffect } from "react";
import { useParams } from "react-router-dom";
import booksData from "../books.json";
import { Flex } from "antd";
import { BookDetails } from "../components/book_details";
import { BookComments } from "../components/book_comments";
import { BasicLayout } from "../layouts";
import { getBookById } from "../services/bookService";

const DetailsPage = () => {
  let { id } = useParams();
  const [book, setBook] = React.useState({});
  useEffect(() => {
    getBookById(id).then((book) => setBook(book));
  }, []);

  const comments = booksData.comments.filter(
    (comment) => comment.bookId === parseInt(id, 10)
  );
  return (
    <BasicLayout>
      <Flex vertical align="center">
        <BookDetails book={book} />
        <BookComments comments={comments} />
      </Flex>
    </BasicLayout>
  );
};

export default DetailsPage;