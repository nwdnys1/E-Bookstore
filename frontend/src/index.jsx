import React from "react";
import ReactDOM from "react-dom/client";
import { ConfigProvider } from "antd";
import zhCN from "antd/lib/locale/zh_CN";
import HomePage from "./pages/home";
import AllBooksPage from "./pages/allbooks";
import DetailsPage from "./pages/details";
import { RouterProvider, createBrowserRouter } from "react-router-dom";
import ErrorPage from "./pages/error";

const router = createBrowserRouter([
  {
    path: "/",
    element: <HomePage />,
    errorElement: <ErrorPage />,
  },
  {
    path: "/allbooks",
    element: <AllBooksPage />,
    errorElement: <ErrorPage />,
  },
  {
    path: "/details/:id",
    element: <DetailsPage />,
    errorElement: <ErrorPage />,
  },
  {
    path: "*",
    element: <ErrorPage />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <ConfigProvider locale={zhCN}>
    <RouterProvider router={router} />
  </ConfigProvider>
);
