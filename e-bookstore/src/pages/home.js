import React, { useEffect, useState } from "react";
import BookCarousel from "../components/carousel";
import BookDisplay from "../components/book_display";
import { getRecommendedBooks } from "../services/bookService";
import { BasicLayout } from "../layouts";
import { Flex, Row } from "antd";

const Home = () => {
  const [recommendedBooks, setRecommendedBooks] = useState([]);

  useEffect(() => {
    getRecommendedBooks().then((books) => setRecommendedBooks(books));
  }, []);

  return (
    <BasicLayout>
      <Flex vertical align="center" style={{ marginTop: 20 }}>
        <BookCarousel books={recommendedBooks} />
        <BookDisplay books={recommendedBooks} withButton />
      </Flex>
    </BasicLayout>
  );
};

export default Home;
