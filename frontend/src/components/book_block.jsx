import React from "react";
import { List } from "antd";
import BookCard from "./book_card";

export const BlockLayout = ({ books }) => {
  return (
    <List
      grid={{
        xxl: 6,
        xl: 4,
        lg: 4,
        md: 4,
        sm: 4,
        xs: 4,
        gutter: 20,
      }}
      pagination={{
        position: "bottom",
        pageSize: 24,
        showTotal: (total, range) =>
          `${total} 本中的 ${range[0]}-${range[1]} 本 `,
      }}
      dataSource={books}
      renderItem={(book) => (
        <List.Item>
          <BookCard book={book} />
        </List.Item>
      )}
    />
  );
};
