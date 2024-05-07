import { Row, Tag } from "antd";
import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import { getTags } from "../services/tagService";

const CategoryBar = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const [tags, setTags] = useState([]);
  useEffect(() => {
    getTags().then((res) => {
      setTags(res);
    });
    setSelected([searchParams.get("tag") || ""]);
  }, [searchParams]);
  const [selected, setSelected] = useState([]);
  const handleChange = (tag, checked) => {
    setSelected(checked ? [tag] : [""]);
    setSearchParams({ tag: checked ? tag : "" });
  };
  return (
    tags && (
      <Row align={"middle"} style={{ marginBottom: 20 }}>
        {tags.map((tag) => (
          <Tag.CheckableTag
            key={tag.id}
            checked={selected.includes(tag.id.toString())}
            onChange={(checked) => handleChange(tag.id.toString(), checked)}
          >
            {tag.content}
          </Tag.CheckableTag>
        ))}
      </Row>
    )
  );
};

export default CategoryBar;
