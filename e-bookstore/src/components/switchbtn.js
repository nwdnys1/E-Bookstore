import React, { useState } from 'react';
import { Button } from 'antd';

const SwitchButton = () => {
  const [layout, setLayout] = useState('list');

  const toggleLayout = (newLayout) => {
    setLayout(newLayout);
  };

  return (
    <div style={{ display: 'flex', alignItems: 'center' }}>
      <Button onClick={() => toggleLayout('list')} style={{ opacity: layout === 'list' ? 1 : 0.5 }}>
        List
      </Button>
      <Button onClick={() => toggleLayout('block')} style={{ opacity: layout === 'block' ? 1 : 0.5 }}>
        Block
      </Button>
    </div>
  );
};

export default SwitchButton;
