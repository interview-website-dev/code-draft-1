package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.Post;

public class PostMapper implements RowMapper<Post> {

	public Post mapRow(ResultSet rs, int arg1) throws SQLException {
		Post post = new Post();

		post.setPositionname(rs.getString("positionname"));

		post.setDate(rs.getString("date"));
		post.setLocation(rs.getString("location"));
		post.setAddress(rs.getString("address"));
		post.setQualification(rs.getString("qualification"));
		post.setSalary(rs.getString("salary"));
		post.setNoofposition(rs.getString("noofposition"));
		post.setRegisteredtime(rs.getString("registered_time"));
		post.setLatestupdatedtime(rs.getString("latest_updated_time"));
		post.setUserid(rs.getString("userid"));
		post.setPositionid(rs.getString("positionid"));
		return post;
	}

}
