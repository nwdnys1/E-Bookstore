import { Col, Divider, Flex, Image, Row, Tag, Typography } from "antd";
import BookRating from "./book_rating";
import TagBar from "./tagbar";
const { Title, Paragraph } = Typography;
const DividerStyle = {
  margin: "5px 0",
};
const ParagraphStyle = {
  margin: "0",
};

const BookInfo = ({ book }) => {
  return (
    <Row justify={"space-between"} align={"middle"}>
      <Row justify={"start"} align={"middle"} style={{ flex: 1 }}>
        <Image
          height={200}
          width={150}
          alt="Book Cover"
          src={"/" + book.image}
          style={{
            objectFit: "cover",
            borderRadius: "10px",
          }}
        />
        <Flex
          vertical
          justify={"space-between"}
          flex={"1"}
          style={{ minHeight: "200px", maxWidth: 600, marginLeft: "20px" }}
        >
          <Title level={3} style={{ margin: "5px 0" }}>
            {book.title}
          </Title>
          <Paragraph style={ParagraphStyle}>{"作者：" + book.author}</Paragraph>
          <Divider orientation="left" style={DividerStyle}></Divider>
          <Paragraph style={ParagraphStyle}>
            狀態：連載 　地區：日本 　語言：繁體 　最後出版：2023
            　更新：2023-03 版本：東立 　掃者：aaa874160 　維護者：Kagura 　 　
            訂閱：529 　收藏：1389 　讀過：23 　熱度：9221
          </Paragraph>
          <Divider style={DividerStyle} />
          <TagBar tags={book.tags} />
        </Flex>
      </Row>
      <BookRating />
    </Row>
  );
};

export default BookInfo;
