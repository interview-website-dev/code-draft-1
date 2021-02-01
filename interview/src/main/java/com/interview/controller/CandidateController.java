package com.interview.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.interview.model.Application;
import com.interview.model.Candidate;
import com.interview.model.CandidatePost;
import com.interview.model.CandidateSkill;
import com.interview.model.CandidateSkillForm;
import com.interview.model.Post;
import com.interview.model.Skill;
import com.interview.model.SkillForm;
import com.interview.model.User;
import com.interview.model.Candidate;
import com.interview.model.Candidate;
import com.interview.model.Candidate;
import com.interview.service.CandidateService;
import com.interview.util.EmailSender;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.interview.dao.CandidateDao;
import com.interview.dao.CandidateDao;

@Controller
public class CandidateController {
	@Autowired
	public CandidateService candidateService;
	@Autowired
	private CandidateDao CandidateDao;
	@Autowired
	private EmailSender emailSender;

	@RequestMapping(value = "/candidatelogin", method = RequestMethod.GET)
	public ModelAndView showCandidateLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("candidatelogin");
		mav.addObject("candidate", new Candidate());

		return mav;
	}

	@RequestMapping(value = "/candidateloginProcess", method = RequestMethod.POST)
	public ModelAndView candidateloginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("candidate") Candidate candidate) {
		ModelAndView mav = null;
		Candidate candidate1 = candidateService.validateEmailID(candidate);
		if (null != candidate1) {
			String MailId = candidate1.getEmailid();
			Candidate candidate2 = candidateService.candidatevalidatepassword(candidate, MailId);
			if (null != candidate2) {
				List<CandidatePost> postlist = candidateService.candidatepostlist();
				List<Application> appliedposts = candidateService
						.appliedposts(String.valueOf(candidate2.getCandidateid()));

				mav = new ModelAndView("candidatedashboard");
				mav.addObject("postlist", postlist);
				mav.addObject("candidateid", candidate2.getCandidateid());
				mav.addObject("firstname", candidate2.getFirstname());
				mav.addObject("lastname", candidate2.getLastname());
				mav.addObject("emailid", candidate2.getEmailid());
				mav.addObject("mobilenumber", candidate2.getMobilenumber());
				mav.addObject("city", candidate2.getCity());
				mav.addObject("appliedposts", appliedposts);
				List<String> appliedpostids = new ArrayList<String>();
				for (Application app : appliedposts) {
					String postid = app.getPositionid();
					appliedpostids.add(postid);
				}
				mav.addObject("appliedpostids", appliedpostids);
			} else {
				mav = new ModelAndView("candidatelogin");
				mav.addObject("candidate", new Candidate());
				mav.addObject("message2", "Password is wrong!!");
			}
		} else {
			mav = new ModelAndView("candidatelogin");
			mav.addObject("candidate", new Candidate());
			mav.addObject("message1", "Candidatename is wrong!!");
		}

		return mav;
	}

	@RequestMapping(value = "/candidateregisterProcess", method = RequestMethod.POST)
	public ModelAndView addCandidate(HttpServletRequest request, HttpServletResponse response,

			@ModelAttribute("candidate") Candidate candidate) throws JsonProcessingException {
		ModelAndView mav = null;
		Candidate candidate1 = candidateService.validateEmailID(candidate);
		if (null != candidate1) {
			mav = new ModelAndView("candidateregisterpage");
			List<String> listCity = CandidateDao.list();
			mav.addObject("candidate", new Candidate());
			mav.addObject("listCity", listCity);
			mav.addObject("hello", "Your already registered!!");
		} else {
			mav = new ModelAndView("candidateregsu");
			candidateService.register(candidate);
			mav.addObject("firstname", candidate.getFirstname());
			if (!(candidate.getEmailid()).isEmpty()) {
				emailSender.sendWelcomeEmail(candidate);
			}
		}
		return mav;
	}

	@RequestMapping(value = "/candidateregister", method = RequestMethod.GET)
	public ModelAndView showCandidateRegister(HttpServletRequest request, HttpServletResponse response)
			throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("candidateregisterpage");
		List<String> listCity = CandidateDao.list();
		mav.addObject("candidate", new Candidate());
		mav.addObject("listCity", listCity);
		return mav;
	}

	@RequestMapping(value = "/candidateforgotpassword", method = RequestMethod.GET)
	public ModelAndView showCandidateForgotPassword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mavp = new ModelAndView("candidateforgotpassword");
		mavp.addObject("candidate", new Candidate());

		return mavp;
	}

	@RequestMapping(value = "/candidatefpProcess", method = RequestMethod.POST)
	public ModelAndView candidateforgotpasswordProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("candidate") Candidate candidate) {
		ModelAndView mav = null;

		System.out.println("hi" + candidate.getEmailid());
		Candidate candidate1 = candidateService.validateEmailID(candidate);

		if (null != candidate1) {
			mav = new ModelAndView("candidatepasschange");
			mav.addObject("emailid", candidate1.getEmailid());
			mav.addObject("candidateid",candidate1.getCandidateid());
		} else {
			mav = new ModelAndView("candidateforgotpassword");
			mav.addObject("message", "Candidatename is wrong!!");
		}

		return mav;
	}

	@RequestMapping(value = "/candidatepasschangeProcess", method = RequestMethod.POST)
	public ModelAndView passchangeProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("candidate") Candidate candidate, @RequestParam("MailId") String MailId, @RequestParam("candidateid") String candidateid) {

		candidateService.candidateupdatepass(candidate, MailId);
		Candidate candidate1 = candidateService.displayCandidate(candidateid);
		emailSender.sendPasswordReset(candidate1);
		return new ModelAndView("candidatepasschangesuccess");

	}

	@RequestMapping(value = "/postdetails", method = RequestMethod.GET)
	public ModelAndView profile(@ModelAttribute("candidatepost") CandidatePost candidatepost,
			@RequestParam("positionid") String positionid, @RequestParam("candidateid") String candidateid,
			@RequestParam("firstname") String firstname) {
		ModelAndView mav = null;
		mav = new ModelAndView("candidatepostdetails");
		CandidatePost candidatepost1 = CandidateDao.displayPostCandidate(positionid);
		List<Application> appliedposts = candidateService.appliedposts(candidateid);
		List<Skill> postskills = CandidateDao.postskills(positionid);
		List<String> appliedpostids = new ArrayList<String>();
		for (Application app : appliedposts) {
			String postid = app.getPositionid();
			appliedpostids.add(postid);
		}
		mav.addObject("positionid", positionid);
		mav.addObject("appliedpostids", appliedpostids);
		mav.addObject("candidatepost", candidatepost1);
		mav.addObject("postskills", postskills);
		mav.addObject("candidateid", candidateid);
		mav.addObject("firstname", firstname);
		mav.addObject("Application", new Application());
		return mav;
	}

	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public ModelAndView candidateupdateProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("Application") Application Application) {
		ModelAndView mav = null;
		List<CandidatePost> postlist = candidateService.candidatepostlist();
		mav = new ModelAndView("candidatedashboard");
		mav.addObject("postlist", postlist);
		String candidateid = Application.getCandidateid();
		mav.addObject("candidateid", candidateid);
		Application existingapplicationcheck = candidateService.existingapplicationcheck(Application);
		if(null == existingapplicationcheck) {
		candidateService.newapplication(Application);
		};
		Candidate candidate = candidateService.displayCandidate(candidateid);
		List<Application> appliedposts = candidateService.appliedposts(candidateid);
		mav.addObject("appliedposts", appliedposts);
		List<String> appliedpostids = new ArrayList<String>();
		for (Application app : appliedposts) {
			String postid = app.getPositionid();
			appliedpostids.add(postid);
		}
		mav.addObject("appliedpostids", appliedpostids);
		mav.addObject("firstname", candidate.getFirstname());
		mav.addObject("lastname", candidate.getLastname());
		mav.addObject("emailid", candidate.getEmailid());
		mav.addObject("mobilenumber", candidate.getMobilenumber());
		mav.addObject("city", candidate.getCity());

		mav.addObject("message", "You Have Applied Successfully");

		return mav;
	}

	@RequestMapping(value = "/candidateLogoutsuccess", method = RequestMethod.GET)
	public ModelAndView showcandidateLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("candidateLogoutsuccess");
		return mav;
	}

	@RequestMapping(value = "/candidateprofile", method = RequestMethod.GET)
	public ModelAndView candidateProfile(@ModelAttribute("CandidateSkillForm") CandidateSkillForm CandidateSkillForm,
			@RequestParam("CandidateId") String CandidateId) {

		ModelAndView mav = null;
		Candidate candidate1 = candidateService.displayCandidate(CandidateId);
		mav = new ModelAndView("candidateprofile");
		List<String> listSkills = CandidateDao.skilllist();
		/* mav.addObject("CandidateSkillForm", new CandidateSkillForm()); */
		mav.addObject("firstname", candidate1.getFirstname());
		mav.addObject("lastname", candidate1.getLastname());
		mav.addObject("emailid", candidate1.getEmailid());
		mav.addObject("mobilenumber", candidate1.getMobilenumber());
		mav.addObject("city", candidate1.getCity());
		mav.addObject("candidate", candidate1);
		List<CandidateSkill> candidateSkills = candidateService.displaycandidateskills(CandidateId);
		List<String> proficiencyleveldata = new ArrayList<String>();
		proficiencyleveldata.add("Beginner");
		proficiencyleveldata.add("Intermediate");
		proficiencyleveldata.add("Expert");
		mav.addObject("proficiencyleveldata", proficiencyleveldata);
		if(candidateSkills.size() == 0) {
			mav.addObject("validator","true");
		}else {
			mav.addObject("candidateSkills", candidateSkills);
		}
		
		mav.addObject("candidateid", CandidateId);
		mav.addObject("Skilllist", listSkills);
		return mav;
	}

	@RequestMapping(value = "/candidateProfileProcess", method = RequestMethod.POST)
	public ModelAndView candidateupdateProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("CandidateSkillForm") CandidateSkillForm CandidateSkillForm,
			@RequestParam("CandidateId") String CandidateId) {
		ModelAndView mav = null;
		candidateService.deletecandidateskills(CandidateId);
		List<CandidatePost> postlist = candidateService.candidatepostlist();
		mav = new ModelAndView("candidatedashboard");
		List<Application> appliedposts = candidateService.appliedposts(CandidateId);
		mav.addObject("appliedposts", appliedposts);
		List<String> appliedpostids = new ArrayList<String>();
		for (Application app : appliedposts) {
			String postid = app.getPositionid();
			appliedpostids.add(postid);
		}
		mav.addObject("appliedpostids", appliedpostids);
		mav.addObject("postlist", postlist);
		mav.addObject("candidateid", CandidateSkillForm.getCandidateid());
		mav.addObject("firstname", CandidateSkillForm.getFirstname());
		mav.addObject("lastname", CandidateSkillForm.getLastname());
		mav.addObject("emailid", CandidateSkillForm.getEmailid());
		mav.addObject("mobilenumber", CandidateSkillForm.getMobilenumber());
		mav.addObject("city", CandidateSkillForm.getCity());
		mav.addObject("candidateid", CandidateId);
		mav.addObject("message", "Profile Updated Successfully");
		candidateService.updateCandidate(CandidateSkillForm, CandidateId);
		
		List<CandidateSkill> candidateskills = CandidateSkillForm.getCandidateskills();
		for (CandidateSkill skill : candidateskills) {

			System.out.printf(skill.getSkillname() + "\n");
			System.out.printf(skill.getCandidateid() + "\n");
			System.out.printf(skill.getProficiencylevel());
		}
		candidateService.candidateskills(candidateskills);
		return mav;
	}

	@RequestMapping(value = "/candidateskillProcess", method = RequestMethod.POST)
	public ModelAndView addskill(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("CandidateSkillForm") CandidateSkillForm candidateSkillForm) {
		ModelAndView mav = new ModelAndView("candidatesummary");
		List<CandidateSkill> skills = candidateSkillForm.getCandidateskills();
		System.out.println("hellos" + candidateSkillForm.getFirstname());

		mav.addObject("skills", skills);
		mav.addObject("CandidateSkillForm", candidateSkillForm);
		// mav.addObject("CandidateSkillForm",new CandidateSkillForm());
		return mav;
	}
}
