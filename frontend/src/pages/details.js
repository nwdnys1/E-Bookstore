import React from "react";
import { useParams } from "react-router-dom";
import booksData from "../books.json";
import { Flex } from "antd";
import { BookDetails } from "../components/book_details";
import { BookComments } from "../components/book_comments";
import { BasicLayout } from "../layouts";

const DetailPage = () => {
  let { id } = useParams();

  const book = booksData.books.find((book) => book.id === parseInt(id, 10)); //同步方法
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

export default DetailPage;
