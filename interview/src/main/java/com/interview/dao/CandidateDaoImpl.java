package com.interview.dao;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.CandidateSkillForm;
import com.interview.mapper.ApplicationMapper;
import com.interview.mapper.CandidateMapper;
import com.interview.mapper.CandidateSkillMapper;
import com.interview.mapper.CandidatepostMapper;
import com.interview.mapper.CityMapper;
import com.interview.mapper.PostMapper;
import com.interview.mapper.PostSkillMapper;
import com.interview.mapper.SkillMapper;
import com.interview.mapper.UserMapper;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;
import com.interview.model.User;

public class CandidateDaoImpl implements CandidateDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<String> list() {
		String sql = "SELECT * FROM cities";
		List<String> listCity = jdbcTemplate.query(sql, new CityMapper());
		return listCity;
	}

	public List<String> skilllist() {
		String sql = "SELECT * FROM skills";
		List<String> listSkill = jdbcTemplate.query(sql, new SkillMapper());
		return listSkill;
	}

	public List<CandidatePost> candidatepostlist() {
		String sql = "SELECT users.companyname, post.* from users inner join post on users.userid = post.userid";
		List<CandidatePost> listpost = jdbcTemplate.query(sql, new CandidatepostMapper());
		return listpost;
	}

	public CandidatePost displayPostCandidate(String positionid) {
		String sql = "SELECT users.companyname, post.* from users inner join post on users.userid = post.userid where positionid='"
				+ positionid + "'";
		List<CandidatePost> CandidatePosts = jdbcTemplate.query(sql, new CandidatepostMapper());

		return CandidatePosts.size() > 0 ? CandidatePosts.get(0) : null;
	}

	public List<Skill> postskills(String positionid) {
		String sql = "SELECT * FROM postskills where positionid = '" + positionid + "'";
		List<Skill> listpostskills = jdbcTemplate.query(sql, new PostSkillMapper());
		return listpostskills;
	}

	public List<CandidateSkill> displaycandidateskills(String candidateid) {
		String sql = "SELECT * FROM candidateskills where candidateid = '" + candidateid + "'";
		List<CandidateSkill> listcandidateskills = jdbcTemplate.query(sql, new CandidateSkillMapper());
		return listcandidateskills;
	}

	public int candidateregister(Candidate candidate) {
		String sql = "insert into candidates values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		return jdbcTemplate.update(sql, new Object[] { candidate.getCandidateid(), candidate.getFirstname(),
				candidate.getLastname(), candidate.getEmailid(), candidate.getMobilenumber(), candidate.getPassword(),
				candidate.getCity(), candidate.getSchname(), candidate.getSchcity(), candidate.getSchpassedyear(),
				candidate.getSchmarks(), candidate.getUgname(), candidate.getUgcity(), candidate.getUgspecialization(),
				candidate.getUgpassedyear(), candidate.getUgmarks(), candidate.getPgname(), candidate.getPgcity(),
				candidate.getPgspecialization(), candidate.getPgpassedyear(), candidate.getPgmarks(),
				candidate.getRegisteredtime(), candidate.getLatestupdatedtime() });

	}

	public Candidate validateEmailID(Candidate candidate) {
		String sql = "select * from candidates where emailid='" + candidate.getEmailid() + "'";
		List<Candidate> candidates = jdbcTemplate.query(sql, new CandidateMapper());

		return candidates.size() > 0 ? candidates.get(0) : null;
	}

	public int candidateupdatepass(Candidate candidate, String MailId) {
		String sql = "update candidates set password ='" + candidate.getPassword() + "' where emailid = '" + MailId
				+ "'";

		return jdbcTemplate.update(sql);
	}

	public Candidate candidatevalidatepassword(Candidate candidate1, String MailId) {
		String sql = "select * from candidates where emailid='" + MailId + "' and password='" + candidate1.getPassword()
				+ "'";
		List<Candidate> candidates2 = jdbcTemplate.query(sql, new CandidateMapper());

		return candidates2.size() > 0 ? candidates2.get(0) : null;
	}

	public Candidate displayCandidate(String Candidateid) {
		String sql = "select * from candidates where candidateid='" + Candidateid + "'";
		List<Candidate> candidates = jdbcTemplate.query(sql, new CandidateMapper());

		return candidates.size() > 0 ? candidates.get(0) : null;
	}

	public int updateCandidate(CandidateSkillForm CandidateSkillForm, String CandidateId) {
		String sql = "update candidates set firstname ='" + CandidateSkillForm.getFirstname() + "',lastname ='"
				+ CandidateSkillForm.getLastname() + "',emailid ='" + CandidateSkillForm.getEmailid()
				+ "',mobilenumber ='" + CandidateSkillForm.getMobilenumber() + "',city ='"
				+ CandidateSkillForm.getCity() + "',schname='" + CandidateSkillForm.getSchname() + "',schcity='"
				+ CandidateSkillForm.getSchcity() + "',schpassedyear='" + CandidateSkillForm.getSchpassedyear()
				+ "',schmarks='" + CandidateSkillForm.getSchmarks() + "',ugname='" + CandidateSkillForm.getUgname()
				+ "',ugcity='" + CandidateSkillForm.getUgcity() + "',ugspecialization='"
				+ CandidateSkillForm.getUgspecialization() + "',ugpassedyear='" + CandidateSkillForm.getUgpassedyear()
				+ "',ugmarks='" + CandidateSkillForm.getUgmarks() + "',pgname='" + CandidateSkillForm.getPgname()
				+ "',pgcity='" + CandidateSkillForm.getPgcity() + "',pgspecialization='"
				+ CandidateSkillForm.getPgspecialization() + "',pgpassedyear='" + CandidateSkillForm.getPgpassedyear()
				+ "',pgmarks='" + CandidateSkillForm.getPgmarks() + "' where candidateid ='" + CandidateId + "'";

		return jdbcTemplate.update(sql);
	}

	public int candidateskills(List<CandidateSkill> Candidateskills) {
		for (CandidateSkill skill : Candidateskills) {
			String sql = "insert into candidateskills values(?,?,?,?,?)";

			jdbcTemplate.update(sql, new Object[] { skill.getCandidateid(), skill.getSkillname(),
					skill.getProficiencylevel(), skill.getRegistered_time(), skill.getLatest_updated_time() });
		}
		return 0;
	}

	public int newapplication(Application Application) {
		String sql = "insert into applications values(?,?,?,?,?,?,?)";

		return jdbcTemplate.update(sql,
				new Object[] { Application.getApplicationid(), Application.getCandidateid(),
						Application.getPositionid(), Application.getUserid(), Application.getStatus(),
						Application.getRegistered_time(), Application.getLatest_updated_time() });
	}

	public List<Application> appliedposts(String candidateid) {
		String sql = "select * from applications where candidateid='" + candidateid + "'";
		List<Application> appliedposts = jdbcTemplate.query(sql, new ApplicationMapper());

		return appliedposts;
	}
	public int deletecandidateskills(String candidateid) {
		String sql = "delete from candidateskills where candidateid = '"+ candidateid +"'";
		return jdbcTemplate.update(sql);
	}
	public Application existingapplicationcheck(Application Application) {
		String sql = "select * from applications where positionid='" + Application.getPositionid() + "' and candidateid='" + Application.getCandidateid()
				+ "'";
		List<Application> Application1 = jdbcTemplate.query(sql, new ApplicationMapper());

		return Application1.size() > 0 ? Application1.get(0) : null;
	}
	
}
