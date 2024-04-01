import { BASEURL, get, post, postUrlencoded } from "./requestService";

export async function login({ username, password }) {
  const url = `${BASEURL}/api/user/login`;
  let result;
  try {
    result = await postUrlencoded(url, { username, password });
    alert("登录成功！");
    location.reload();
  } catch (e) {
    console.log(e);
    alert(e);
  }
}

export async function logout() {
  const url = `${BASEURL}/api/user/logout`;
  let result;
  try {
    result = await get(url);
    alert("登出成功！");
    location.href="/";
  } catch (e) {
    console.log(e);
    alert(e);
  }
}

export async function checkAuth() {
  const url = `${BASEURL}/api/user/check`;
  let result;
  try {
    result = await get(url);
    return result;
  } catch (e) {
    console.log(e);
    location.href = "/";
    alert(e);
  }
}

export async function checkLogin() {
  const url = `${BASEURL}/api/user/check`;
  try {
    await get(url);
    return true;
  } catch (e) {
    return false;
  }
}
