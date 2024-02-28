// src/Bookstore.js
import React from 'react';
import { Card, Row, Col } from 'antd';

const { Meta } = Card;

const HomePage = () => {
  const books = [
    { title: "Book 1", description: "Description of Book 1", cover: "book1.jpg" },
    { title: "Book 2", description: "Description of Book 2", cover: "book2.jpg" },
    // Add more books as needed
  ];

  return (
    <div>
      <h1>Welcome to Our Bookstore</h1>
      <Row gutter={16}>
        {books.map((book, index) => (
          <Col span={8} key={index}>
            <Card
              hoverable
              style={{ width: 240, marginBottom: 20 }}
              cover={<img alt={book.title} src={book.cover} />}
            >
              <Meta title={book.title} description={book.description} />
            </Card>
          </Col>
        ))}
      </Row>
    </div>
  );
};

export default HomePage;
