import { Button, Form, Input, Modal } from "antd";
import React from "react";
import { placeOrder } from "../services/orderService";

const { TextArea } = Input;
export default function OrderModal({ selectedItems }) {
  const handleSubmit = async ({ address, receiver, tel }) => {
    if (!address || !receiver || !tel) {
      alert("请填写完整信息！");
      return;
    }
    let orderInfo = {
      address,
      receiver,
      tel,
      cids: selectedItems.map((item) => item.id),
    };
    await placeOrder(orderInfo);
    alert("下单成功！");
    window.location.reload();
  };
  return (
    <Form layout="vertical" preserve={false} onFinish={handleSubmit}>
      <Form.Item name="receiver" label="收货人" required>
        <Input />
      </Form.Item>
      <Form.Item name="tel" label="联系电话" required>
        <Input />
      </Form.Item>
      <Form.Item name="address" label="收货地址" required>
        <TextArea rows={2} maxLength={817} />
      </Form.Item>
      <Form.Item>
        <Button type="primary" htmlType="submit">
          提交
        </Button>
      </Form.Item>
    </Form>
  );
}
