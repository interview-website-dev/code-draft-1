package com.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.interview.dao.UserDao;
import com.interview.model.User;
import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;

public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;

	public int register(User user) {
		return userDao.register(user);
	}

	public int post(SkillForm skillForm) {
		return userDao.post(skillForm);
	}

	public User validateUser(Login login) {
		return userDao.validateUser(login);
	}

	public User displayUser(String mailid) {
		return userDao.displayUser(mailid);
	}

	public User validateEmailID(User user) {
		return userDao.validateEmailID(user);
	}

	public int updatepass(User user, String companyMailId) {
		return userDao.updatepass(user, companyMailId);
	}

	public int updateuser(User user, String companyMailId) {
		return userDao.updateuser(user, companyMailId);
	}

	public int updatepost(Post post) {
		return userDao.updatepost(post);
	}

	public User validatepassword(User user1, String companyMailId) {
		return userDao.validatepassword(user1, companyMailId);
	}

	public List<Post> postlist(String Userid) {
		return userDao.postlist(Userid);
	}

	public Post maxpositionid() {
		return userDao.maxpositionid();
	}

	public int postskills(List<Skill> skills) {
		return userDao.postskills(skills);
	}

	public User Userdetails(String Userid) {
		return userDao.Userdetails(Userid);
	}

	public List<Application> viewapplicationlist(String Positionid, String Userid) {
		return userDao.viewapplicationlist(Positionid, Userid);
	}

	public Candidate displayCandidate(String Candidateid) {
		return userDao.displayCandidate(Candidateid);
	}

	public List<CandidateSkill> candidateskillslist() {
		return userDao.candidateskillslist();
	}

	public int shortlistapplication(String Positionid, String Userid, String shortListedCandidateid,
			String shortlisted) {
		return userDao.shortlistapplication(Positionid, Userid, shortListedCandidateid, shortlisted);
	}

	public int rejectapplication(String Positionid, String Userid, String rejectedCandidateid, String rejected) {
		return userDao.rejectapplication(Positionid, Userid, rejectedCandidateid, rejected);
	}

	public List<CandidateSkill> candidateskills(String candidateid) {
		return userDao.candidateskills(candidateid);
	}
	public CandidatePost displayPost(String positionid) {
		return userDao.displayPost(positionid);
	}
	public List<Skill> positionskills(String positionid){
		return userDao.positionskills(positionid);
	}
	public Post validatepost(String positionid) {
		return userDao.validatepost(positionid);
	}

}
