import { Card } from "antd";
import { Link } from "react-router-dom";

const CarouselCard = ({ book }) => {
  return (
    <Link to={`/details/${book.id}`}>
      <Card
        cover={
          <img
            src={book.image}
            alt={book.title}
            style={{
              aspectRatio: "4/3",
              objectFit: "cover",
              borderRadius: "5px",
            }}
          />
        }
        bodyStyle={{
          display: "none",
        }}
      />
    </Link>
  );
};

export default CarouselCard;
