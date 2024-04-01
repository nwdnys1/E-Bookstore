import React, { createContext, useState } from "react";

// 创建一个上下文对象
export const AuthContext = createContext();

// 创建一个 AuthProvider 组件来提供登录状态
export const AuthProvider = ({ children }) => {
  const [isLogin, setIsLogin] = useState(false);
  return (
    <AuthContext.Provider value={{ isLogin, setIsLogin }}>
      {children}
    </AuthContext.Provider>
  );
};
