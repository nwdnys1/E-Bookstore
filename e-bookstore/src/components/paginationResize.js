import { useState, useEffect } from "react";

const usePaginationHook = () => {
  const [paginationProps, setPaginationProps] = useState({
    defaultPageSize: 3,
    showQuickJumper: true,
    showSizeChanger: true,
    pageSizeOptions: ["1", "3", "5", "10", "20", "50"],
    showTotal: (total, range) => `${total} 项中的 ${range[0]}-${range[1]} 项 `,
    position: "bottom",
    align: "center",
  });

  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth < 1050) {
        setPaginationProps({
          ...paginationProps,
          showSizeChanger: false,
          showQuickJumper: false,
        });
      } else {
        setPaginationProps({
          ...paginationProps,
          showSizeChanger: true,
          showQuickJumper: true,
        });
      }
    };

    handleResize();
    window.addEventListener("resize", handleResize);

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []); // 只在组件挂载和卸载时执行



  return paginationProps;
};

export default usePaginationHook;
