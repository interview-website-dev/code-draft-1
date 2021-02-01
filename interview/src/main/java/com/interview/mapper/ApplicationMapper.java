package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.Application;

public class ApplicationMapper implements RowMapper<Application> {

	public Application mapRow(ResultSet rs, int arg1) throws SQLException {
		Application application = new Application();

		application.setApplicationid(rs.getString("applicationid"));
		application.setCandidateid(rs.getString("candidateid"));
		application.setPositionid(rs.getString("positionid"));
		application.setUserid(rs.getString("userid"));
		application.setStatus(rs.getString("status"));
		application.setRegistered_time(rs.getString("registered_time"));
		application.setLatest_updated_time(rs.getString("latest_updated_time"));
		return application;
	}
}
