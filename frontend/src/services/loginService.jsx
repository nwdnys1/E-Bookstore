import { BASEURL, get, postUrlencoded } from "./requestService";
const PREFIX = `${BASEURL}/api/user`;

export async function login({ username, password }) {
  const url = `${PREFIX}/login`;
  let result;
  result = await postUrlencoded(url, { username, password });
  return result;
}

export async function logout() {
  const url = `${PREFIX}/logout`;
  let result;
  result = await get(url);
  return result;
}

export async function checkAuth() {
  const url = `${PREFIX}/check`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    location.href = "/";
    alert(e);
  }
}

export async function checkLogin() {
  const url = `${PREFIX}/check`;
  try {
    await get(url);
    return true;
  } catch (e) {
    return false;
  }
}
