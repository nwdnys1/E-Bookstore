import React from "react";
import { useParams } from "react-router-dom";
import booksData from "../books.json";
import { Layout } from "antd";
import { DetailLayout, CommentLayout } from "../layouts";

const DetailPage = () => {
  let { id } = useParams();

  const book = booksData.books.find((book) => book.id === parseInt(id, 10));

  return (
    <Layout
      style={{
        width: "70vw",
        minWidth: "1000px",
        padding: "10px",
        margin: "auto",
      }}
    >
      <DetailLayout book={book} />
      <CommentLayout comments={book.comments} />
    </Layout>
  );
};

export default DetailPage;
