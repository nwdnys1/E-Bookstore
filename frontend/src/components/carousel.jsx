import React, { useState, useEffect } from "react";
import { Carousel } from "antd";
import { getRecommendedBooks } from "../services/bookService"; // 导入书籍相关的服务函数
import CarouselButton from "./carousel_btn";
import CarouselCard from "./carousel_card";

const BookCarousel = () => {
  const [recommendedBooks, setRecommendedBooks] = useState([]);
  const carouselRef = React.createRef();

  useEffect(() => {
    const fetchRecommendedBooks = async () => {
      const recommended = await getRecommendedBooks();
      setRecommendedBooks(recommended);
    };
    fetchRecommendedBooks();
  }, []);

  return (
    <div
      style={{
        maxWidth: "600px",
        width: "40%",
        position: "relative",
      }}
    >
      <Carousel effect="fade" ref={carouselRef} autoplay  >
        {recommendedBooks.map((book) => (
          <CarouselCard key={book.id} book={book} />
        ))}
      </Carousel>
      <CarouselButton
        handlePrev={() => {
          carouselRef.current.prev();
        }}
        handleNext={() => {
          carouselRef.current.next();
        }}
      />
      <div
        style={{
          position: "absolute",
          bottom: 0,
          width: "100%",
          height: "40px",
          background: `rgba(255, 255, 255, 0)`,
          backdropFilter: "blur(2px)",
          zIndex: 1,
        }}
      ></div>
    </div>
  );
};

export default BookCarousel;
