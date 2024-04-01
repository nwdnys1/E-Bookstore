import { Table } from "antd";

export default function OrderTable() {
  const columns = [
    { title: "收货人", dataIndex: "receiver", key: "receiver" },
    { title: "联系方式", dataIndex: "tel", key: "tel" },
    { title: "收货地址", dataIndex: "address", key: "address" },
    {
      title: "下单时间",
      dataIndex: "createdAt",
      key: "createdAt",
      render: (time) => formatTime(time),
    },
  ];

  return (
    <Table
      columns={columns}
      expandable={{
        expandedRowRender: (order) => (
          <List
            dataSource={order.items}
            renderItem={(item, _) => (
              <List.Item>
                <List.Item.Meta
                  avatar={
                    <Avatar shape="square" size={80} src={item.book.cover} />
                  }
                  title={item.book.title}
                  description={`数量：${item.number}`}
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
  );
}
