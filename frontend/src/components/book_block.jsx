import React, { useEffect } from "react";
import { List, Pagination, Row } from "antd";
import BookCard from "./book_card";
import { useSearchParams } from "react-router-dom";

export const BlockLayout = ({ books, length }) => {
  //这个子组件的回调是修改page和pageSize 其他都不变
  const [searchParams, setSearchParams] = useSearchParams();
  const handlePageChange = (page, pageSize) => {
    setSearchParams({
      page: page,
      pageSize: pageSize,
      keyword: searchParams.get("keyword") || "",
      tag: searchParams.get("tag") || "",
      layout: searchParams.get("layout") || "block",
    });
  };

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
      dataSource={books}
      renderItem={(book) => (
        <List.Item>
          <BookCard book={book} />
        </List.Item>
      )}
    >
      <Row justify="center">
        <Pagination
          current={searchParams.get("page") || 1}
          defaultPageSize={12}
          pageSize={searchParams.get("pageSize") || 12}
          onChange={handlePageChange}
          showQuickJumper
          showSizeChanger
          pageSizeOptions={["12", "24", "48"]}
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
