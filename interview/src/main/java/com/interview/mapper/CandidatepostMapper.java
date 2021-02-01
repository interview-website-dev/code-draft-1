package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.interview.model.CandidatePost;
import com.interview.model.Post;

public class CandidatepostMapper implements RowMapper<CandidatePost> {

	public CandidatePost mapRow(ResultSet rs, int arg1) throws SQLException {
		CandidatePost candidatepost = new CandidatePost();

		candidatepost.setPositionname(rs.getString("positionname"));
		candidatepost.setPositionid(rs.getString("positionid"));
		candidatepost.setCompanyname(rs.getString("companyname"));
		candidatepost.setDate(rs.getString("date"));
		candidatepost.setLocation(rs.getString("location"));
		candidatepost.setAddress(rs.getString("address"));
		candidatepost.setQualification(rs.getString("qualification"));
		candidatepost.setSalary(rs.getString("salary"));
		candidatepost.setNoofposition(rs.getString("noofposition"));
		candidatepost.setRegisteredtime(rs.getString("registered_time"));
		candidatepost.setLatestupdatedtime(rs.getString("latest_updated_time"));
		candidatepost.setUserid(rs.getString("userid"));
		return candidatepost;
	}

}
