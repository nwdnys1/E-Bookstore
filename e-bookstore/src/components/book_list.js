import React from "react";
import { List } from "antd";
import BookListItem from "./book_listitem";
import usePaginationHook from "./paginationResize";

export const ListLayout = ({ books }) => {
  const paginationProps = usePaginationHook();
  return (
    <List
      pagination={paginationProps}
      dataSource={books}
      renderItem={(book) => (
        <List.Item>
          <BookListItem book={book} />
        </List.Item>
      )}
    />
  );
};
