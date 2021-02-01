package com.interview.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.interview.model.Skill;

public class SkillMapper implements RowMapper<String> {

	public String mapRow(ResultSet rs, int rowNum) throws SQLException {
		Skill askill = new Skill();
		askill.setSkillname(rs.getString("skillname"));
		String abskill = askill.Skillname;
		return abskill;
	}
}
