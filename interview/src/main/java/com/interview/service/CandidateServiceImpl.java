package com.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.interview.dao.CandidateDao;
import com.interview.dao.CandidateDao;
import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.CandidateSkillForm;
import com.interview.model.Login;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;
import com.interview.model.User;

public class CandidateServiceImpl implements CandidateService {

	@Autowired
	public CandidateDao candidateDao;

	public int register(Candidate candidate) {
		return candidateDao.candidateregister(candidate);
	}

	public Candidate validateEmailID(Candidate candidate) {
		return candidateDao.validateEmailID(candidate);
	}

	public int candidateupdatepass(Candidate candidate, String MailId) {
		return candidateDao.candidateupdatepass(candidate, MailId);
	}

	public Candidate candidatevalidatepassword(Candidate candidate1, String MailId) {
		return candidateDao.candidatevalidatepassword(candidate1, MailId);
	}

	public List<CandidatePost> candidatepostlist() {
		return candidateDao.candidatepostlist();
	}

	public CandidatePost displayPostCandidate(String positionid) {
		return candidateDao.displayPostCandidate(positionid);
	}

	public Candidate displayCandidate(String Candidateid) {
		return candidateDao.displayCandidate(Candidateid);
	}

	public int updateCandidate(CandidateSkillForm CandidateSkillForm, String CandidateId) {
		return candidateDao.updateCandidate(CandidateSkillForm, CandidateId);
	}

	public List<Skill> postskills(String positionid) {
		return candidateDao.postskills(positionid);
	}

	public int candidateskills(List<CandidateSkill> Candidateskills) {
		return candidateDao.candidateskills(Candidateskills);
	}

	public int newapplication(Application Application) {
		return candidateDao.newapplication(Application);
	}

	public List<CandidateSkill> displaycandidateskills(String candidateid) {
		return candidateDao.displaycandidateskills(candidateid);
	}

	public List<Application> appliedposts(String candidateid) {
		return candidateDao.appliedposts(candidateid);
	}
	public int deletecandidateskills(String candidateid) {
		return candidateDao.deletecandidateskills(candidateid);
	}
	public Application existingapplicationcheck(Application Application) {
		return candidateDao.existingapplicationcheck(Application);
	}

}
