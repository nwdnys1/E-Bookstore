import {
  Button,
  Card,
  Col,
  Divider,
  Flex,
  Image,
  Row,
  Tag,
  Typography,
} from "antd";
import BookRating from "./book_rating";
const { Title, Paragraph } = Typography;

const BookInfo = ({ book }) => {
  return (
    <Row justify={"space-evenly"} align={"middle"}>
      <Image
        height={200}
        width={150}
        alt="Book Cover"
        src={"/" + book.image}
        style={{
          objectFit: "cover",
        }}
      />
      <Flex vertical justify="space-around" flex={"1"} style={{ padding: 15 }}>
        <Title level={3} style={{ margin: 0 }}>
          {book.title}
        </Title>
        <Paragraph style={{ margin: 0 }}>{"作者：" + book.author}</Paragraph>
        <Divider orientation="left" style={{ margin: "0px" }}></Divider>
        <Paragraph>
          狀態：連載 　地區：日本 　語言：繁體 　最後出版：2023 　更新：2023-03
          版本：東立 　掃者：aaa874160 　維護者：Kagura 　 　 訂閱：529
          　收藏：1389 　讀過：23 　熱度：9221
        </Paragraph>
        <Divider style={{ margin: "0" }} />
        <Row>
          <Tag color="blue">百合</Tag>
          <Tag color="blue">轻松</Tag>
          <Tag color="blue">日常</Tag>
          <Tag color="blue">萌系</Tag>
        </Row>
      </Flex>
      <BookRating />
    </Row>
  );
};

export default BookInfo;
