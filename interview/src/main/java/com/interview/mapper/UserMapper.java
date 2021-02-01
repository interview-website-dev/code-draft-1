package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.User;

public class UserMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();

		user.setFirstname(rs.getString("firstname"));
		user.setLastname(rs.getString("lastname"));
		user.setPassword(rs.getString("password"));
		user.setCompanyemailid(rs.getString("companyemailid"));
		user.setMobilenumber(rs.getString("mobilenumber"));
		user.setCompanyname(rs.getString("companyname"));
		user.setCity(rs.getString("city"));
		user.setRegisteredtime(rs.getString("registered_time"));
		user.setLatestupdatedtime(rs.getString("latest_updated_time"));
		user.setUserid(rs.getString("userid"));
		return user;
	}
}
