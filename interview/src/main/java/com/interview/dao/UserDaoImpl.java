package com.interview.dao;

import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import com.interview.model.User;
import com.interview.mapper.ApplicationMapper;
import com.interview.mapper.CandidateMapper;
import com.interview.mapper.CandidateSkillMapper;
import com.interview.mapper.CandidatepostMapper;
import com.interview.mapper.CityMapper;
import com.interview.mapper.MaxPositionidMapper;
import com.interview.mapper.PostMapper;
import com.interview.mapper.PostSkillMapper;
import com.interview.mapper.SkillMapper;
import com.interview.mapper.UserMapper;
import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;

public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<String> list() {
		String sql = "SELECT * FROM cities";
		List<String> listCity = jdbcTemplate.query(sql, new CityMapper());
		return listCity;
	}

	public List<Post> postlist(String Userid) {
		String sql = "SELECT * FROM post where Userid = '" + Userid + "'";
		List<Post> listpost = jdbcTemplate.query(sql, new PostMapper());
		return listpost;
	}

	public List<String> skilllist() {
		String sql = "SELECT * FROM skills";
		List<String> listSkill = jdbcTemplate.query(sql, new SkillMapper());

		return listSkill;
	}

	public Post maxpositionid() {
		String sql = "SELECT max(positionid) as positionid FROM post";
		List<Post> maxpositionid = jdbcTemplate.query(sql, new MaxPositionidMapper());
		return maxpositionid.size() > 0 ? maxpositionid.get(0) : null;
	}

	public int register(User user) {
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?)";

		return jdbcTemplate.update(sql,
				new Object[] { user.getUserid(), user.getFirstname(), user.getLastname(), user.getPassword(),
						user.getCompanyemailid(), user.getMobilenumber(), user.getCompanyname(), user.getCity(),
						user.getRegisteredtime(), user.getLatestupdatedtime() });
	}

	public int updatepass(User user, String companyMailId) {
		String sql = "update users set password ='" + user.getPassword() + "' where Companyemailid = '" + companyMailId
				+ "'";

		return jdbcTemplate.update(sql);
	}

	public int updateuser(User user, String companyMailId) {
		String sql = "update users set firstname ='" + user.getFirstname() + "',lastname ='" + user.getLastname()
				+ "',companyemailid ='" + user.getCompanyemailid() + "',mobilenumber ='" + user.getMobilenumber()
				+ "',companyname ='" + user.getCompanyname() + "',city ='" + user.getCity()
				+ "' where Companyemailid ='" + companyMailId + "'";

		return jdbcTemplate.update(sql);
	}

	public int updatepost(Post post) {
		String sql = "update post set positionname ='" + post.getPositionname() + "',date ='" + post.getDate()
				+ "',location ='" + post.getLocation() + "',address ='" + post.getAddress() + "',qualification ='"
				+ post.getQualification() + "',salary ='" + post.getSalary() + "',noofposition='"
				+ post.getNoofposition() + "'";

		return jdbcTemplate.update(sql);
	}

	public User validateUser(Login login) {
		String sql = "select * from users where companyemailid='" + login.getCompanyemailid() + "' and password='"
				+ login.getPassword() + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public User Userdetails(String Userid) {
		String sql = "select * from users where userid='" + Userid + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public User validateEmailID(User user) {
		String sql = "select * from users where companyemailid='" + user.getCompanyemailid() + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public User validatepassword(User user1, String companyMailId) {
		String sql = "select * from users where companyemailid='" + companyMailId + "' and password='"
				+ user1.getPassword() + "'";
		List<User> users2 = jdbcTemplate.query(sql, new UserMapper());

		return users2.size() > 0 ? users2.get(0) : null;
	}

	public User displayUser(String mailid) {
		String sql = "select * from users where companyemailid='" + mailid + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public int post(SkillForm skillForm) {
		String sql = "insert into post values(?,?,?,?,?,?,?,?,?,?,?)";

		return jdbcTemplate.update(sql,
				new Object[] { skillForm.getPositionid(), skillForm.getUserid(), skillForm.getPositionname(),
						skillForm.getDate(), skillForm.getLocation(), skillForm.getAddress(),
						skillForm.getQualification(), skillForm.getSalary(), skillForm.getNoofposition(),
						skillForm.getRegisteredtime(), skillForm.getLatestupdatedtime() });
	}

	public int postskills(List<Skill> skills) {
		for (Skill skill : skills) {
			String sql = "insert into postskills values(?,?,?,?,?)";

			jdbcTemplate.update(sql, new Object[] { skill.getPositionid(), skill.getSkillname(),
					skill.getProficiencylevel(), skill.getRegistered_time(), skill.getLatest_updated_time() });
		}
		return 0;
	}

	public List<Application> viewapplicationlist(String Positionid, String Userid) {
		String sql = "SELECT * from applications where positionid = '" + Positionid + "' and userid = '" + Userid + "'";
		List<Application> listapplication = jdbcTemplate.query(sql, new ApplicationMapper());
		return listapplication;
	}

	public Candidate displayCandidate(String Candidateid) {
		String sql = "select * from candidates where candidateid='" + Candidateid + "'";
		List<Candidate> candidates = jdbcTemplate.query(sql, new CandidateMapper());

		return candidates.size() > 0 ? candidates.get(0) : null;
	}

	public List<CandidateSkill> candidateskillslist() {
		String sql = "SELECT * FROM candidateskills";
		List<CandidateSkill> listcandidateskills = jdbcTemplate.query(sql, new CandidateSkillMapper());
		return listcandidateskills;
	}

	public int shortlistapplication(String Positionid, String Userid, String shortListedCandidateid,
			String shortlisted) {
		String sql = "update applications set status ='" + shortlisted + "'where positionid = '" + Positionid
				+ "'and userid = '" + Userid + "'and candidateid = '" + shortListedCandidateid + "'";
		return jdbcTemplate.update(sql);

	}

	public int rejectapplication(String Positionid, String Userid, String rejectedCandidateid, String rejected) {
		String sql = "update applications set status ='" + rejected + "'where positionid = '" + Positionid
				+ "'and userid = '" + Userid + "'and candidateid = '" + rejectedCandidateid + "'";
		return jdbcTemplate.update(sql);

	}

	public List<CandidateSkill> candidateskills(String candidateid) {
		String sql = "SELECT * FROM candidateskills where candidateid = '" + candidateid + "'";
		List<CandidateSkill> listcandidateskills = jdbcTemplate.query(sql, new CandidateSkillMapper());
		return listcandidateskills;
	}
	public CandidatePost displayPost(String positionid) {
		String sql = "SELECT users.companyname, post.* from users inner join post on users.userid = post.userid where positionid='"
				+ positionid + "'";
		List<CandidatePost> Posts = jdbcTemplate.query(sql, new CandidatepostMapper());

		return Posts.size() > 0 ? Posts.get(0) : null;
	}
	public List<Skill> positionskills(String positionid) {
		String sql = "SELECT * FROM postskills where positionid = '" + positionid + "'";
		List<Skill> listpostskills = jdbcTemplate.query(sql, new PostSkillMapper());
		return listpostskills;
	}
	public Post validatepost(String positionid) {
		String sql = "select * from post where positionid='" + positionid + "'";
		List<Post> post = jdbcTemplate.query(sql, new PostMapper());

		return post.size() > 0 ? post.get(0) : null;
	}
}
