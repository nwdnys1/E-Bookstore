import React, { useState, useEffect } from "react";
import { Carousel, Card, Button, Typography } from "antd";
import { LeftOutlined, RightOutlined } from "@ant-design/icons";
import { getRecommendedBooks } from "../services/bookService"; // 导入书籍相关的服务函数

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
        width: "80vw",
        maxWidth: "1000px",
        aspectRatio: "4/3",
        marginBottom: "20px",
        padding: "0px",
      }}
    >
      <Carousel
        id="carousel"
        effect="fade"
        ref={carouselRef}
        autoplay
        style={{
          width: "100%",
          aspectRatio: "4/3",
          display: "grid",
          alignItems: "center",
          background: "pink",
        }}
      >
        {recommendedBooks.map((book) => (
          <div key={book.id}>
            <Card
              hoverable
              style={{
                position:"relative",
                width: "95%",
                aspectRatio: "4/3",
                margin: "0 auto",
                backgroundColor: "grey",
                textAlign: "center",
              }}
              cover={
                <img
                  src={book.image}
                  alt={book.title}
                  style={{
                    width: "100%",
                    //maxHeight:"100%",
                    //objectFit:"cover",
                  }}
                />
              }
            >
              <div style={{ position: "absolute", bottom: "0%", right: "0%" }}>
                <Button
                  onClick={handlePrev}
                  style={{
                    left: "-5px",
                    width: "4vw",
                    aspectRatio: "1/1",
                    maxWidth: "30px",
                    opacity: "0.3",
                  }}
                  icon={<LeftOutlined />}
                />
                <Button
                  onClick={handleNext}
                  style={{
                    right: "0px",
                    width: "4vw",
                    maxWidth: "30px",
                    opacity: "0.3",
                  }}
                  icon={<RightOutlined />}
                />
              </div>
              {/* <Card.Meta
              style={{display:"none"}}

              // description={
              //   <Paragraph
              //     ellipsis={{rows:0 }}
              //     style={{
              //       margin: "0 0 20px 0px",
              //       fontSize: "14px",
              //       textIndent: "1em",
              //     }}
              //   >
              //     {book.description}
              //   </Paragraph>
              // }
              // style={{
              //   width: "100%",
              //   textAlign: "left",
              //   background: "#f5f5f5",
              //   margin: "0 auto",
              //   padding: "0px",
              // }}
              /> */}
            </Card>
          </div>
        ))}
      </Carousel>
    </div>
  );
};

export default BookCarousel;
