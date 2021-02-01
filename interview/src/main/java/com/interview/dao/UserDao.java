package com.interview.dao;

import com.interview.model.User;

import java.util.ArrayList;
import java.util.List;

import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;

public interface UserDao {

	int register(User user);

	int post(SkillForm skillForm);

	User validateUser(Login login);

	User displayUser(String mailid);

	User validateEmailID(User user);

	int updatepass(User user, String companyMailId);

	int updateuser(User user, String companyMailId);

	int updatepost(Post post);

	User validatepassword(User user1, String companyMailId);

	List<String> list();

	List<String> skilllist();

	List<Post> postlist(String Userid);

	Post maxpositionid();

	int postskills(List<Skill> skills);

	User Userdetails(String Userid);

	List<Application> viewapplicationlist(String Positionid, String Userid);

	Candidate displayCandidate(String Candidateid);

	List<CandidateSkill> candidateskillslist();

	int shortlistapplication(String Positionid, String Userid, String shortListedCandidateid, String shortlisted);

	int rejectapplication(String Positionid, String Userid, String rejectedCandidateid, String rejected);

	List<CandidateSkill> candidateskills(String candidateid);
	 CandidatePost displayPost(String positionid);
	 List<Skill> positionskills(String positionid);
	 Post validatepost(String positionid);

}
