import React, { useState } from 'react';
import { Input, Button } from 'antd';


const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  
  const handleLogin = () => {
    // 在这里可以添加登录逻辑，比如发送请求给后端进行验证
    console.log('用户名:', username);
    console.log('密码:', password);
  };
  
  return (
    <div style={{ width: '300px', margin: 'auto', marginTop: '100px' }}>
      <h2>登录页面</h2>
      <Input
        placeholder="用户名"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        style={{ marginBottom: '10px' }}
      />
      <Input.Password
        placeholder="密码"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        style={{ marginBottom: '10px' }}
      />
      <Button type="primary" onClick={handleLogin}>登录</Button>
    </div>
  );
};

export default LoginPage;
