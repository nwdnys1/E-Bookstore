import React from 'react';
import { Card, Typography,List,  Space, } from 'antd';
import { ShoppingCartOutlined, LikeOutlined, MessageOutlined } from '@ant-design/icons';
import Link from "antd/es/typography/Link";

const { Title, Paragraph } = Typography;

const IconText = ({ icon, text }) => (
    <Space>
      {React.createElement(icon)}
      {text}
    </Space>
  );

const BookListItem = ({ book }) => {
  return (
    <List.Item>
      <Card
        hoverable
        bodyStyle={{ padding: '10px 15px' }}
        actions={[
          <IconText icon={ShoppingCartOutlined} text="156" key="list-vertical-star-o" />,
          <IconText icon={LikeOutlined} text="156" key="list-vertical-like-o" />,
          <IconText icon={MessageOutlined} text="2" key="list-vertical-message" />,
        ]}
      >
        <Link href={`/details/${book.id}`} style={{ display: 'flex', justifyContent: 'space-between' }}>
          <div className="book-info" style={{ display: 'flex', flexDirection: 'column', marginRight: '10px' }}>
            <Title level={4} style={{ margin: '0 0 3px 0px' }} ellipsis={{ rows: 2 }} title={book.title}>
              {book.title}
            </Title>
            <Title type="secondary" style={{ margin: '0 0 3px 0px', fontSize: '14px' }}>
              {book.author}
            </Title>
            <Paragraph
              ellipsis={{ rows: 6, expandable: true, symbol: '展开' }}
              style={{ margin: '0 0 10px 0px', fontSize: '16px', textIndent: '1em' }}
            >
              {book.description}
            </Paragraph>
          </div>
          <img
            src={'/' + book.image}
            alt="Book Cover"
            style={{
              alignSelf: 'center',
              width: '12%',
              minWidth: 120,
              aspectRatio: '0.75/1',
              borderRadius: '10px',
              objectFit: 'cover',
              flex: 'none',
            }}
          />
        </Link>
      </Card>
    </List.Item>
  );
};

export default BookListItem;
