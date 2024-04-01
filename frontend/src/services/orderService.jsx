import Data from "../books.json"; // 导入本地的书籍数据
import { BASEURL, get } from "./requestService";

export const getCarts = async () => {
    return Data.cart;
}