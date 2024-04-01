import { BASEURL, get, post, postUrlencoded } from "./requestService";
const PREFIX = `${BASEURL}/api/user`;

export async function getUserName() {
  const url = `${PREFIX}/name`;
  let result;
  try {
    result = await get(url, {});
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}
