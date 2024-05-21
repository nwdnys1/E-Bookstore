import { useEffect, useState } from "react";
import { AdminLayout } from "../components/layout";
import {
  deleteBookById,
  getAllBooks,
  searchBooks,
} from "../services/bookService";
import { Button, Image, Input, Row, Table } from "antd";
import { Column } from "@ant-design/plots";

const BookAdminPage = () => {
  const [books, setBooks] = useState([]);
  useEffect(() => {
    getAllBooks().then((res) => {
      setBooks(res);
    });
  }, []);
  const handleSearch = (value) => {
    searchBooks({ keyword: value, page: 1, pageSize: 10 }).then((res) => {
      setBooks(res.books);
    });
  };
  const handleDelete = (id) => {
    deleteBookById(id)
      .then((res) => {
        setBooks(books.filter((item) => item.id !== id));
        alert("删除成功");
      })
      .catch((e) => alert(e));
  };
  return (
    <AdminLayout>
      <Input.Search
        onSearch={handleSearch}
        placeholder="搜索书籍"
        style={{ width: 200, marginBottom: 20 }}
      />
      <Table
        dataSource={books.map((item) => ({
          ...item,
          key: item.id,
        }))}
      >
        <Column title="书名" dataIndex="title" key="title" />
        <Column title="作者" dataIndex="author" key="author" />
        <Column title="价格" dataIndex="price" key="price" />
        <Column title="库存" dataIndex="stock" key="stock" />
        <Column title="ISBN" dataIndex="isbn" key="isbn" />
        <Column
          title="分类"
          dataIndex="tags"
          key="tags"
          render={(tags) => tags.content?.join(",")}
        />
        <Column
          title="封面"
          dataIndex="cover"
          key="cover"
          render={(cover) => (
            <Image
              src={cover}
              alt="cover"
              style={{ width: 75, height: 100, objectFit: "cover" }}
            />
          )}
        />
        <Column
          title="操作"
          key="action"
          render={(item) => (
            <Button
              onClick={() => {
                handleDelete(item.id);
              }}
            >
              删除
            </Button>
          )}
        />
      </Table>
    </AdminLayout>
  );
};

export default BookAdminPage;
