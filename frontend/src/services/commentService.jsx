import { compareVersions } from "@ant-design/pro-components";
import { BASEURL, get, post, postText } from "./requestService";
const PREFIX = `${BASEURL}/api/comment`;

export const getCommentsByBookId = async (bookId) => {
  const url = `${PREFIX}/list/${bookId}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
};
export const addComment = async ({bid,content}) => {
  const url = `${PREFIX}/add/${bid}`;
  let result;
  try {
    result = await postText(url, content);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}
export const deleteComment = async (id) => {
  const url = `${PREFIX}/delete/${id}`;
  let result;
  try {
    result = await post(url);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}
