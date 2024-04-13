import { Avatar, Collapse } from "antd";

const { Panel } = Collapse;

export const ReplyList = ({ replies }) => {
  return (
    <Collapse ghost size="small">
      <Panel header={`回复 (${replies.length})`} key="1">
        {replies.map((reply, index) => (
          <div key={index} style={{ display: "flex", alignItems: "center" }}>
            <Avatar src={reply.user.avatar} style={{ marginRight: 8 }} />
            <div>
              <p>{reply.user.username}</p>
              <p>{reply.content}</p>
            </div>
          </div>
        ))}
      </Panel>
    </Collapse>
  );
};
