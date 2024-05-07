import React, { useEffect } from "react";
import { Empty, List, Pagination, Row } from "antd";
import BookListItem from "./book_listitem";
import { useSearchParams } from "react-router-dom";

export const ListLayout = ({ books, length }) => {
  const [searchParams, setSearchParams] = useSearchParams();
  const handlePageChange = (page, pageSize) => {
    setSearchParams({
      page: page,
      pageSize: pageSize,
      keyword: searchParams.get("keyword"),
    });
  };
  useEffect(() => {
    if (searchParams.get("pageSize"))
      setSearchParams({ pageSize: 4, keyword: searchParams.get("keyword") });
  }, []);
  return (
    <List
      dataSource={books}
      renderItem={(book) => <BookListItem book={book} />}
    >
      <Row justify="center">
        <Pagination
          current={searchParams.get("page") || 1}
          defaultPageSize={3}
          pageSize={searchParams.get("pageSize") || 3}
          onChange={handlePageChange}
          showQuickJumper
          showSizeChanger
          pageSizeOptions={["4", "6", "12", "24", "48"]}
          total={length}
          showTotal={(total, range) =>
            `${total} 项中的 ${range[0]}-${range[1]} 项 `
          }
          position="bottom"
        />
      </Row>
    </List>
  );
};
