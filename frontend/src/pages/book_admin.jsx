import { AdminLayout } from "../components/layout";

const BookAdminPage = () => {
  return (
    <AdminLayout>
      <h1>图书管理</h1>
      <p>这是一个需要管理员权限的页面</p>
    </AdminLayout>
  );
};

export default BookAdminPage;
