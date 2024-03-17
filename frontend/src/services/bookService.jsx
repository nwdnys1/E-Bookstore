// bookService.js

import Data from "../books.json"; // 导入本地的书籍数据

export const searchBooks = async (keyword, pageIndex, pageSize) => {
  // 模拟从本地 JSON 文件获取书籍数据
  const start = pageIndex * pageSize;
  const end = start + pageSize;
  const filteredBooks = Data.books.filter((book) =>
    book.title.toLowerCase().includes(keyword.toLowerCase())
  );
  const pagedBooks = filteredBooks.slice(start, end);
  return { items: pagedBooks, total: filteredBooks.length };
};

export const getRecommendedBooks = async () => {
  // 模拟从本地 JSON 文件获取推荐书籍数据
  return Data.books.slice(0, 12); // 假设前三本书为推荐书籍
};

// 在 services/bookService.js 文件中

export const getAllBooks = async () => {
  return Data.books; // 假设 allBooks.json 中的顶层属性名称为 books
};

export const getBookComments = async (bookId) => {
  // 模拟从本地 JSON 文件获取书籍评论数据
  return Data.comments.filter((comment) => comment.bookId === parseInt(bookId));
};
