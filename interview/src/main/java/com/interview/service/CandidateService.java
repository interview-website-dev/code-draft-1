package com.interview.service;

import com.interview.model.User;

import java.util.List;

import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.CandidateSkillForm;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;

public interface CandidateService {

	int register(Candidate candidate);

	Candidate validateEmailID(Candidate candidate);

	int candidateupdatepass(Candidate candidate, String MailId);

	Candidate candidatevalidatepassword(Candidate candidate1, String MailId);

	List<CandidatePost> candidatepostlist();

	CandidatePost displayPostCandidate(String positionid);

	Candidate displayCandidate(String Candidateid);

	int updateCandidate(CandidateSkillForm CandidateSkillForm, String CandidateId);

	List<Skill> postskills(String positionid);

	int candidateskills(List<CandidateSkill> Candidateskills);

	int newapplication(Application Application);

	List<CandidateSkill> displaycandidateskills(String candidateid);

	List<Application> appliedposts(String candidateid);
	 int deletecandidateskills(String candidateid);
	 Application existingapplicationcheck(Application Application);

}
