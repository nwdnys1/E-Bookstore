import { AdminLayout } from "../components/layout";

const UserAdminPage = () => {
  return (
    <AdminLayout>
      <h1>用户管理</h1>
      <p>这是一个需要管理员权限的页面</p>
    </AdminLayout>
  );
};

export default UserAdminPage;
