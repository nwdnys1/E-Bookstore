import { Avatar, Flex, Image, Input, List, Table } from "antd";
import { getOrders, searchOrders } from "../services/orderService";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

export default function OrderTable() {
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    getOrders().then((res) => {
      setOrders(res);
    });
  }, []);

  const computeTotalPrice = (order) => {
    return `${order.orderItems
      .map((item) => item.book.price * item.quantity)
      .reduce((prev, cur) => prev + cur)
      .toFixed(2)}元`;
  };
  const handleSearch = (value) => {
    searchOrders(value).then((res) => {
      setOrders(res);
    });
  }

  const columns = [
    { title: "收货人", dataIndex: "receiver", key: "receiver" },
    { title: "联系方式", dataIndex: "tel", key: "tel" },
    { title: "收货地址", dataIndex: "address", key: "address" },
    {
      title: "总价",
      key: "totalPrice",
      render: (_, order) => computeTotalPrice(order),
    },
    {
      title: "下单时间",
      dataIndex: "createTime",
      key: "createTime",
      render: (time) => new Date(time).toDateString(),
    },
  ];

  return (
    <Flex
      style={{ width: "65%", minWidth: 800, margin: "0 auto" }}
      vertical
      justify="center"
    >
      <Input.Search
        onSearch={handleSearch}
        placeholder="搜索订单"
        style={{ width: 200, marginBottom: 20,alignSelf:"flex-end" }}  
      />
      <Table
        columns={columns}
        expandable={{
          expandedRowRender: (order) => (
            <List
              dataSource={order.orderItems}
              renderItem={(item, _) => (
                <List.Item>
                  <List.Item.Meta
                    avatar={
                      <Image
                        src={item.book.cover}
                        width={75}
                        height={100}
                        style={{ objectFit: "cover" }}
                      />
                    }
                    title={
                      <Link to={`/details/${item.book.id}`}>
                        {item.book.title}
                      </Link>
                    }
                    description={`数量：${item.quantity} 价格：${item.book.price}元`}
                  />
                </List.Item>
              )}
            />
          ),
        }}
        dataSource={orders.map((order) => ({
          ...order,
          key: order.id,
        }))}
      />
    </Flex>
  );
}
