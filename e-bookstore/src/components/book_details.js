import { PayCircleOutlined, ShoppingCartOutlined } from "@ant-design/icons";
import { Button, Card, Col, Divider, Flex, Image, Row, Typography } from "antd";
import BookInfo from "./book_info";
import BookRating from "./book_rating";

export const BookDetails = ({ book }) => {
  const handleAddToCart = () => {
    // 处理加入购物车逻辑
  };

  const handleBuyNow = () => {
    // 处理立即购买逻辑
  };
  return (
    <Flex vertical style={{ width: "75%" }}>
      <BookInfo book={book} />
      <Divider orientation="left" style={{ margin: "10px 0" }} />
      <Row justify={"center"}>
        {book.description}
      </Row>
      <Row justify={"center"}>
        <Button
          type="primary"
          icon={<ShoppingCartOutlined />}
          onClick={handleAddToCart}
          style={{ marginRight: "10px" }}
        >
          加入购物车
        </Button>
        <Button
          type="primary"
          icon={<PayCircleOutlined />}
          onClick={handleBuyNow}
        >
          立即购买
        </Button>
      </Row>
    </Flex>
  );
};
