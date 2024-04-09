import { BASEURL, get} from "./requestService";
const PREFIX = `${BASEURL}/api/user`;

export async function getUser() {
  const url = `${PREFIX}/get`;
  let result;
  try {
    result = await get(url, {});
    return result;
  } catch (e) {
    console.log(e);
    return e;
  }
}
