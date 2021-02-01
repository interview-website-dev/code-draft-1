package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.interview.model.CandidateSkill;
import com.interview.model.Post;
import com.interview.model.Skill;

public class CandidateSkillMapper implements RowMapper<CandidateSkill> {

	public CandidateSkill mapRow(ResultSet rs, int rowNum) throws SQLException {
		CandidateSkill skill = new CandidateSkill();
		skill.setSkillname(rs.getString("skillname"));
		skill.setCandidateid(rs.getString("candidateid"));
		skill.setProficiencylevel(rs.getString("proficiencylevel"));
		skill.setRegistered_time(rs.getString("registered_time"));
		skill.setLatest_updated_time(rs.getString("latest_updated_time"));

		return skill;
	}
}
