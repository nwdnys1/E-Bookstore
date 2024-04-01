import Data from "../books.json";
import { BASEURL, get } from "./requestService";
const PREFIX = `${BASEURL}/api/book`;

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
  const url = `${PREFIX}/recommend/4`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
};

// 在 services/bookService.js 文件中

export async function getAllBooks() {
  const url = `${PREFIX}/list`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}

export async function getBookById(bookId) {
  const url = `${PREFIX}/get/${bookId}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}

export const getBookComments = async (bookId) => {
  // 模拟从本地 JSON 文件获取书籍评论数据
  return Data.comments.filter((comment) => comment.bookId === parseInt(bookId));
};
