import React from 'react';
import { Card, Button } from 'antd';
import { ShoppingCartOutlined } from '@ant-design/icons';
import Link from "antd/es/typography/Link";
import { Typography } from 'antd';

const { Title } = Typography;

const BookInfoCard = ({ book }) => {
  return (
    <div
      style={{
        width: '90%',
        minWidth: 100,
        aspectRatio: '0.6',
        margin: '0 auto',
        paddingBottom: '5px',
        marginTop: '15px',
        borderRadius: '10px',
        backgroundColor: '#f5f5f5',
      }}
    >
      <Link href={`/details/${book.id}`}>
        <Card
          hoverable
          key={book.id}
          style={{ width: '100%', aspectRatio: '0.75/1' }}
          bodyStyle={{ display: 'none' }}
          cover={
            <>
              <img
                alt="Book Cover"
                src={book.image}
                style={{
                  width: '100%',
                  aspectRatio: '3/4',
                  objectFit: 'cover',
                  borderRadius: '7px',
                }}
              />
              <div
                style={{
                  fontSize: '20px',
                  width: '40px',
                  position: 'absolute',
                  bottom: 3,
                  right: 5,
                  color: 'yellow',
                  textAlign: 'right',
                }}
              >
                {book.rating.toFixed(1)}
              </div>
            </>
          }
        ></Card>
      </Link>
      <div style={{ height: '70px' }}>
        <Link href={`/details/${book.id}`}>
          <Title
            style={{
              color: 'blue',
              paddingBottom: '3px',
              margin: '3px 0px 0px 5px',
              fontSize: '14px',
            }}
            ellipsis={{ rows: 3 }}
          >
            {book.title}
          </Title>
        </Link>
        <Title
          style={{
            margin: '0 0 0px 5px',
            fontSize: '12px',
            paddingBottom: '3px',
          }}
          ellipsis={{ rows: 1 }}
        >
          {book.author}
        </Title>
      </div>
      <div
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
        }}
      >
        <span
          style={{
            fontSize: '15px',
            fontWeight: 'bold',
            marginLeft: '5px',
          }}
        >
          {book.price.toFixed(2) + '¥'}
        </span>
        <Button
          icon={<ShoppingCartOutlined />}
          style={{
            backgroundColor: '#f0f0f0',
            borderRadius: '5px',
            marginRight: '5px',
          }}
        />
      </div>
    </div>
  );
};

export default BookInfoCard;
