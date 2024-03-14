import React from "react";
import { List } from "antd";
import BookCard from "./book_card";

export const BlockLayout = ({ books }) => {
  return (
    <List
      grid={{
        column: 6,
        gutter: 30,
      }}
      pagination={{
        position: "bottom",
        pageSize: 18,
        showTotal: (total, range) =>
          `${total} 项中的 ${range[0]}-${range[1]} 项 `,
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
