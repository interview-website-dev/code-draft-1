package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.city;

public class CityMapper implements RowMapper<String> {

	public String mapRow(ResultSet rs, int rowNum) throws SQLException {
		city acity = new city();
		acity.setCityname(rs.getString("city"));
		String abcity = acity.cityname;
		return abcity;
	}
}
