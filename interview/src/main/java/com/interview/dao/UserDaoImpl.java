package com.interview.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.interview.model.User;

import com.interview.dao.UserMapper;
import com.interview.model.Login;

public class UserDaoImpl implements UserDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;

  public int register(User user) {
    String sql = "insert into users values(?,?,?,?,?,?,?,?)";

    return jdbcTemplate.update(sql, new Object[] {user.getUserid(),user.getFirstname(), user.getLastname(),user.getPassword(), user.getCompanyemailid(),
        user.getMobilenumber(), user.getCompanyname(), user.getCity()});
  }
  public User validateUser(Login login) {
	    String sql = "select * from users where companyemailid='" + login.getCompanyemailid() + "' and password='" + login.getPassword()
	        + "'";
	    List<User> users = jdbcTemplate.query(sql, new UserMapper());

	    return users.size() > 0 ? users.get(0) : null;
	  }
}

class UserMapper implements RowMapper<User> {

  public User mapRow(ResultSet rs, int arg1) throws SQLException {
    User user = new User();

    user.setFirstname(rs.getString("firstname"));
    user.setLastname(rs.getString("lastname"));
    user.setPassword(rs.getString("password"));
    user.setCompanyemailid(rs.getString("companyemailid"));
    user.setMobilenumber(rs.getString("mobilenumber"));
    user.setCompanyname(rs.getString("companyname"));
    user.setCity(rs.getString("city"));
    return user;
  }
}