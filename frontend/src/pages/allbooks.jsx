import React, { useEffect, useState } from "react";
import { categoryBooks, searchBooks } from "../services/bookService";
import BookDisplay from "../components/book_display";
import { BasicLayout } from "../components/layout";
import { Flex } from "antd";
import { useSearchParams } from "react-router-dom";
import CategoryBar from "../components/category";

const AllBooksPage = () => {
  const [books, setBooks] = useState([]);
  const [length, setLength] = useState(0); // 用于分页
  const [searchParams, setSearchParams] = useSearchParams();
  const keyword = searchParams.get("keyword") || "";
  const page = searchParams.get("page") || 1;
  const pageSize = searchParams.get("pageSize") || 12; //url: /allbooks?keyword=xxx&page=1&pageSize=10
  const tag = searchParams.get("tag") || "";
  useEffect(() => {
    setSearchParams({
      keyword: keyword,
      page: page,
      pageSize: pageSize,
      tag: tag,
    });
    if (keyword)
      searchBooks({
        keyword: keyword,
        page: page,
        pageSize: pageSize,
      }).then((res) => {
        setBooks(res.books);
        setLength(res.total);
      });
    else if (tag !== "")
      categoryBooks({
        tag: tag,
        page: page,
        pageSize: pageSize,
      }).then((res) => {
        setBooks(res.books);
        setLength(res.total);
      });
    else
      searchBooks({
        keyword: "",
        page: page,
        pageSize: pageSize,
      }).then((res) => {
        setBooks(res.books);
        setLength(res.total);
      });
  }, [keyword, page, pageSize]);

  return (
    <BasicLayout>
      <Flex vertical align="center" style={{ marginTop: 20 }}>
        <CategoryBar />
        <BookDisplay books={books} withButton={false} length={length} />
      </Flex>
    </BasicLayout>
  );
};

export default AllBooksPage;
