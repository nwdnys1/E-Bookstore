import React, { useState, useEffect, useRef } from "react";
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
        position: "relative",
        width: "60%",
        height: "45vh",
        minHeight: "400px",
        margin: "0 auto",
        marginBottom: "20px",
        padding: "0px",
        backgroundColor: "#f5f5f5",
      }}
    >
      <Carousel ref={carouselRef} autoplay style={{ height: "100%" }}>
        {recommendedBooks.map((book) => (
          <div key={book.id}>
            <Card
              title={book.title}
              style={{ backgroundColor: "#f5f5f5", textAlign: "center" ,margin:"0 auto"}}
              cover={
                <img
                  src={book.image}
                  alt={book.title}
                  style={{ width: "40%", margin: "0 auto", marginTop: "20px" }}
                />
              }
            >
              <Card.Meta
                //title={book.title}
                description={
                  <Paragraph
                    ellipsis={{ rows: 3 }}
                    style={{
                      margin: "0 0 10px 0px",
                      fontSize: "14px",
                      textIndent: "1em",
                      height: "",
                    }}
                  >
                    {book.description}
                  </Paragraph>
                }
                style={{
                  width: "80%",
                  textAlign: "left",
                  background: "#f5f5f5",
                  margin: "0 auto",
                }}
              />
            </Card>
          </div>
        ))}
      </Carousel>
      <div style={{ position: "absolute", bottom: "5%", right: "3%" }}>
        <Button
          onClick={handlePrev}
          style={{ left: "-5px", width: "4vw", maxWidth: "30px" }}
          icon={<LeftOutlined />}
        />
        <Button
          onClick={handleNext}
          style={{ right: "0px", width: "4vw", maxWidth: "30px" }}
          icon={<RightOutlined />}
        />
      </div>
    </div>
  );
};

export default BookCarousel;
