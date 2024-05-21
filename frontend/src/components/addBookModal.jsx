import { Button, Form, Input, Modal } from "antd";
import TextArea from "antd/es/input/TextArea";

const AddBookModal = ({ showModal, handleCancel, handleSubmit }) => {
  return (
    <Modal
      open={showModal}
      title="添加书籍"
      onCancel={handleCancel}
      footer={null}
    >
      <Form onFinish={handleSubmit}>
        <Form.Item
          label="书名"
          name="title"
          rules={[{ required: true, message: "请输入书名" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="作者"
          name="author"
          rules={[{ required: true, message: "请输入作者" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="价格"
          name="price"
          rules={[{ required: true, message: "请输入价格" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="库存"
          name="stock"
          rules={[{ required: true, message: "请输入库存" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="ISBN"
          name="isbn"
          rules={[{ required: true, message: "请输入ISBN" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="简介"
          name="description"
          rules={[{ required: true, message: "请输入简介" }]}
        >
          <TextArea rows={4} />
        </Form.Item>
        <Form.Item>
          <Button type="primary" htmlType="submit">
            添加书籍
          </Button>
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default AddBookModal;
