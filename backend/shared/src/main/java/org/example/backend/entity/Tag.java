package org.example.backend.entity;

import java.util.HashSet;
import java.util.Set;

import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Node
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tag {
	@Id
	@GeneratedValue
	private Long id;
	private String name;
	@Relationship(type = "RELATE_TO")
	private Set<Tag> relatedTags = new HashSet<>();

	public void relateTo(Tag tag) { // 用于建立标签之间的关系
		this.relatedTags.add(tag);
		tag.relatedTags.add(this);
	}

}
