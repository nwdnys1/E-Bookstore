import { BASEURL, get, post } from "./requestService";
const PREFIX = `${BASEURL}/api/order`;
export const getOrders = async () => {
  const url = `${PREFIX}/list`;
  let result;
  result = await get(url);
  return result;
};

export const searchOrders = async (keyword) => {
  const url = `${PREFIX}/search?keyword=${keyword}`;
  let result;
  result = await get(url);
  return result;
};

export const placeOrder = async (orderRequest) => {
  const url = `${PREFIX}/add`;
  let result;
  try {
    result = await post(url, orderRequest);
    return result;
  } catch (e) {
    console.log(e);
    alert(e);
  }
};
