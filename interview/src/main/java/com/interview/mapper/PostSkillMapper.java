package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.interview.model.Post;
import com.interview.model.Skill;

public class PostSkillMapper implements RowMapper<Skill> {

	public Skill mapRow(ResultSet rs, int rowNum) throws SQLException {
		Skill skill = new Skill();
		skill.setSkillname(rs.getString("skillname"));
		skill.setPositionid(rs.getString("positionid"));
		skill.setProficiencylevel(rs.getString("proficiencylevel"));
		skill.setRegistered_time(rs.getString("registered_time"));
		skill.setLatest_updated_time(rs.getString("latest_updated_time"));

		return skill;
	}
}
