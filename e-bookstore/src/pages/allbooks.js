import React from 'react';

const BookDetailPage = () => {
    const book = {
        title: "React入门指南",
        author: "张三",
        description: "这本书是关于React入门的指南，适合初学者阅读。",
        image: "1.jpg"
    };

    return (
        <div style={{ display: "flex", alignItems: "center" }}>
            {/* 图片 */}
            <img
                src={book.image}
                alt="Book Cover"
                style={{ width: 200, height: 300, objectFit: "cover", marginRight: 20 }}
            />
            {/* 书籍信息 */}
            <div>
                <h1>{book.title}</h1>
                <h3>作者：{book.author}</h3>
                <p>{book.description}</p>
                <button>购买</button>
            </div>
        </div>
    );
};

export default BookDetailPage;
