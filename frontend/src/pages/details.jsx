import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { BookDetails } from "../components/book_details";
import { BookComments } from "../components/book_comments";
import { BasicLayout } from "../components/layout";
import { getBookById } from "../services/bookService";

const DetailsPage = () => {
  let { id } = useParams();
  const [book, setBook] = useState({});
  useEffect(() => {
    getBookById(id).then((book) => setBook(book));
  }, []);

  return (
    <BasicLayout>
      <BookDetails book={book} />
      <BookComments />
    </BasicLayout>
  );
};

export default DetailsPage;
