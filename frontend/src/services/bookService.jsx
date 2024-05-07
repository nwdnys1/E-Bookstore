import { BASEURL, get } from "./requestService";
const PREFIX = `${BASEURL}/api/book`;

export const searchBooks = async ({ keyword, page, pageSize }) => {
  const url = `${PREFIX}/search?keyword=${keyword}&page=${page}&pageSize=${pageSize}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
};

export const categoryBooks = async ({ tag, page, pageSize }) => {
  const url = `${PREFIX}/category?tag=${tag}&page=${page}&pageSize=${pageSize}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
};

export const getRecommendedBooks = async () => {
  const url = `${PREFIX}/recommend/4`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
  }
};

// 在 services/bookService.js 文件中

export async function getBookById(bookId) {
  const url = `${PREFIX}/get/${bookId}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
  }
}
