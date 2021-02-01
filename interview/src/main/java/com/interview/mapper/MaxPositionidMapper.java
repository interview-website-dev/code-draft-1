package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.Post;

public class MaxPositionidMapper implements RowMapper<Post> {

	public Post mapRow(ResultSet rs, int arg1) throws SQLException {
		Post post = new Post();

		post.setPositionid(rs.getString("positionid"));
		return post;
	}

}
