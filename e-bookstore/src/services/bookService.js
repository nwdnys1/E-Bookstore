// bookService.js

import booksData from "../books.json"; // 导入本地的书籍数据

export const searchBooks = async (keyword, pageIndex, pageSize) => {
  // 模拟从本地 JSON 文件获取书籍数据
  const start = pageIndex * pageSize;
  const end = start + pageSize;
  const filteredBooks = booksData.books.filter((book) =>
    book.title.toLowerCase().includes(keyword.toLowerCase())
  );
  const pagedBooks = filteredBooks.slice(start, end);
  return { items: pagedBooks, total: filteredBooks.length };
};

export const getRecommendedBooks = async () => {
  // 模拟从本地 JSON 文件获取推荐书籍数据
  return booksData.books.slice(0, 10); // 假设前三本书为推荐书籍
};

// 在 services/bookService.js 文件中

export const getAllBooks = () => {
    return booksData.books; // 假设 allBooks.json 中的顶层属性名称为 books
  };