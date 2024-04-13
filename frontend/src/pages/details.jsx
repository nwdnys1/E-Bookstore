import React, { useEffect } from "react";
import { useParams } from "react-router-dom";
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

  return (
    <BasicLayout>
      <Flex vertical align="center">
        <BookDetails book={book} />
        <BookComments />
      </Flex>
    </BasicLayout>
  );
};

export default DetailsPage;
