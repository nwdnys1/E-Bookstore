import { BASEURL, get, post, put } from "./requestService";
const PREFIX = `${BASEURL}/api/user`;

export async function getUser() {
  const url = `${PREFIX}/get`;
  let result;
  result = await get(url);
  return result;
}

export async function getAllUsers() {
  const url = `${PREFIX}/admin/list`;
  let result;
  result = await get(url);
  return result;
}

export async function updateUser(user) {
  const url = `${PREFIX}/update`;
  let result;
  result = await put(url, user);
  return result;
}

export async function getOtherUser(username) {
  const url = `${PREFIX}/get/${username}`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    return e;
  }
}

export async function disableUser(id) {
  const url = `${PREFIX}/admin/disable/${id}`;
  let result;
  result = await put(url);
  return result;
}

export async function enableUser(id) {
  const url = `${PREFIX}/admin/enable/${id}`;
  let result;
  result = await put(url);
  return result;
}