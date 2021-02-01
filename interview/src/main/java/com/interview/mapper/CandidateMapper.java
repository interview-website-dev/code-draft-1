package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.interview.model.Candidate;

public class CandidateMapper implements RowMapper<Candidate> {

	public Candidate mapRow(ResultSet rs, int arg1) throws SQLException {
		Candidate candidate = new Candidate();

		candidate.setCandidateid(rs.getString("candidateid"));
		candidate.setFirstname(rs.getString("firstname"));
		candidate.setLastname(rs.getString("lastname"));
		candidate.setEmailid(rs.getString("emailid"));
		candidate.setMobilenumber(rs.getString("mobilenumber"));
		candidate.setPassword(rs.getString("password"));
		candidate.setCity(rs.getString("city"));
		candidate.setSchname(rs.getString("schname"));
		candidate.setSchcity(rs.getString("schcity"));
		candidate.setSchpassedyear(rs.getString("schpassedyear"));
		candidate.setSchmarks(rs.getString("schmarks"));
		candidate.setUgname(rs.getString("ugname"));
		candidate.setUgcity(rs.getString("ugcity"));
		candidate.setUgspecialization(rs.getString("ugspecialization"));
		candidate.setUgpassedyear(rs.getString("ugpassedyear"));
		candidate.setUgmarks(rs.getString("ugmarks"));
		candidate.setPgname(rs.getString("pgname"));
		candidate.setPgcity(rs.getString("pgcity"));
		candidate.setPgspecialization(rs.getString("pgspecialization"));
		candidate.setPgpassedyear(rs.getString("pgpassedyear"));
		candidate.setPgmarks(rs.getString("pgmarks"));
		candidate.setRegisteredtime(rs.getString("registered_time"));
		candidate.setLatestupdatedtime(rs.getString("latest_updated_time"));

		return candidate;
	}
}
