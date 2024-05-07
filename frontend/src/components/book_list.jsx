import React from "react";
import { List } from "antd";
import BookListItem from "./book_listitem";

export const ListLayout = ({ books }) => {
  const handlePageChange = (page, pageSize) => {
    navigate(`/allbooks?page=${page}&pageSize=${pageSize}`);
  }
  return (
    <List
      pagination={{
        
        defaultPageSize: 3,
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ["1", "3", "5", "10", "20", "50"],
        showTotal: (total, range) =>
          `${total} 项中的 ${range[0]}-${range[1]} 项 `,
        position: "bottom",
      }}
      dataSource={books}
      renderItem={(book) => <BookListItem book={book} />}
    />
  );
};
