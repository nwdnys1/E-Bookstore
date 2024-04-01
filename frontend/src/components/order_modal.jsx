import { Button, Form, Input, Modal } from "antd";
import React from "react";


const { TextArea } = Input;
export default function OrderModal() {
  return (
    <Form
      layout="vertical"
      preserve={false}
    >
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
