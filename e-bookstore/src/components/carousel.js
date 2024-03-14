import React, { useState, useEffect } from "react";
import { Carousel, Card, Button, Typography, Row } from "antd";
import { LeftOutlined, RightOutlined } from "@ant-design/icons";
import { getRecommendedBooks } from "../services/bookService"; // 导入书籍相关的服务函数
import CarouselButton from "./carousel_btn";
import CarouselCard from "./carousel_card";
import { Link } from "react-router-dom";

const { Paragraph } = Typography;

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

  const handlePrev = () => {
    carouselRef.current.prev();
  };

  const handleNext = () => {
    carouselRef.current.next();
  };

  return (
    <div
      style={{
        maxWidth: "600px",
        width: "40%",
        position: "relative",
      }}
    >
      <Carousel effect="fade" ref={carouselRef} autoplay>
        {recommendedBooks.map((book) => (
          <CarouselCard book={book} />
        ))}
      </Carousel>
      <CarouselButton handlePrev={handlePrev} handleNext={handleNext} />
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
