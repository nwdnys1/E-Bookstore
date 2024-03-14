import React, { useEffect, useState } from 'react';

const Blur = () => {
  const [opacity, setOpacity] = useState(0); // 初始透明度

  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = window.scrollY;
      const newOpacity = scrollPosition / 100; // 根据滚动位置计算新的透明度

      if (newOpacity <= 1) {
        setOpacity(newOpacity);
      }
    };

    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);

  return (
    <div
      style={{
        position: "fixed",
        top: 0,
        left: 0,
        background: `linear-gradient(to bottom, rgba(255, 255, 255, ${opacity}), rgba(255, 255, 255, 0))`, // 应用从上往下渐变模糊效果
        backdropFilter: "blur(3px)", // 模糊程度
        zIndex: 1,
      }}
    ></div>
  );
};

export default Blur;
