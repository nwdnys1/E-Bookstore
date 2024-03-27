import { BASEURL, get, post, postUrlencoded } from "./requestService";
const URL = `${BASEURL}/api/user`;
export async function getUserName() {
  const url = `${URL}/name`;
  let result;
  try {
    result = await get(url, {});
    console.log(result);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
}
