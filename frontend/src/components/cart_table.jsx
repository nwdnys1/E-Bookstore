import { Button, Col, Flex, Image, InputNumber, Modal, Row, Table } from "antd";
import { useEffect, useState } from "react";
import {
  deleteCartItem,
  getCartItems,
  updateCartItemNumber,
} from "../services/cartService";
import { Link } from "react-router-dom";
import { DeleteOutlined } from "@ant-design/icons";
import OrderModal from "./order_modal";

const CartTable = () => {
  const [items, setItems] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [selectedItems, setSelectedItems] = useState([]);
  const handleDeleteItem = async (id) => {
    await deleteCartItem(id);
    setItems(items.filter((item) => item.id !== id));
    setSelectedItems(selectedItems.filter((item) => item.id !== id));
  };

  useEffect(() => {
    getCartItems().then((res) => {
      setItems(res);
    });
  }, []);

  const openModal = () => {
    setShowModal(true);
  };

  const closeModal = () => {
    setShowModal(false);
  };

  const computeTotalPrice = () => {
    const prices = selectedItems.map((item) => item.book.price * item.quantity);
    return prices.length > 0
      ? prices.reduce((prev, cur) => prev + cur).toFixed(2)
      : 0;
  };

  const handleNumberChange = async (id, number) => {
    await updateCartItemNumber(id, number);
    items.filter((item) => item.id === id)[0].quantity = number;
    let selected = selectedItems.find((item) => item.id === id);
    if (selected) {
      selected.quantity = number;
      setSelectedItems([...selectedItems]);
    }
    setItems([...items]);
  };

  const columns = [
    {
      title: "书名",
      dataIndex: "book",
      key: "book_title",
      render: (book, item) => (
        <Link to={`/details/${item.book.id}`}>{book.title}</Link>
      ),
    },
    {
      title: "数量",
      dataIndex: "number",
      key: "number",
      render: (number, item) => (
        <InputNumber
          min={1}
          defaultValue={number}
          value={item.quantity}
          onChange={(newNumber) => {
            handleNumberChange(item.id, newNumber);
          }}
        />
      ),
    },
    {
      title: "价格",
      dataIndex: "book",
      key: "book_price",
      render: (book) => book.price + "元",
    },
    {
      title: "操作",
      dataIndex: "",
      key: "action",
      render: (item) => (
        <DeleteOutlined
          type="primary"
          onClick={() => {
            handleDeleteItem(item.id);
          }}
        />
      ),
    },
  ];

  return (
    <Flex
      style={{ width: "65%", minWidth: 800, margin: "0 auto" }}
      vertical
      justify="center"
    >
      {showModal && (
        <Modal
          open={showModal}
          onCancel={closeModal}
          footer={null}
          centered
          keyboard
          width={"auto"}
        >
          <OrderModal selectedItems={selectedItems} />
        </Modal>
      )}
      <Table
        columns={columns}
        rowSelection={{
          onChange: (_, selectedItems) => {
            setSelectedItems(selectedItems);
          },
        }}
        expandable={{
          expandedRowRender: (item) => (
            <Row justify={"space-between"} gutter={8}>
              <Col span={4}>
                <Image src={item.book.cover} style={{ objectFit: "cover" }} />
              </Col>
              <Col span={20}>
                <p>{item.book.title}</p>
              </Col>
            </Row>
          ),
        }}
        dataSource={items.map((item) => ({
          ...item,
          key: item.id,
        }))}
      />
      <p>总价：{computeTotalPrice()}元</p>
      <Button
        type="primary"
        disabled={selectedItems.length === 0}
        onClick={openModal}
      >
        立刻下单
      </Button>
    </Flex>
  );
};

export default CartTable;
