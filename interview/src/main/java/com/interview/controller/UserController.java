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
import com.interview.model.User;
import com.interview.service.UserService;
import com.interview.util.EmailSender;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.interview.dao.UserDao;

@Controller
public class UserController {
	@Autowired
	public UserService userService;
	@Autowired
	private UserDao UserDao;
	@Autowired
	private EmailSender emailSender;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response)
			throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("registerpage");
		List<String> listCity = UserDao.list();
		mav.addObject("user", new User());
		mav.addObject("listCity", listCity);
		return mav;
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) throws JsonProcessingException {
		ModelAndView mav = null;
		User user1 = userService.validateEmailID(user);
		if (null != user1) {
			mav = new ModelAndView("registerpage");
			List<String> listCity = UserDao.list();
			mav.addObject("user", new User());
			mav.addObject("listCity", listCity);
			mav.addObject("hello", "Your already registered!!");
			/* return new ModelAndView("regsu", "firstname", user.getFirstname()); */
		} else {
			mav = new ModelAndView("regsu");
			userService.register(user);
			mav.addObject("firstname", user.getFirstname());
			if (!(user.getCompanyemailid()).isEmpty()) {
				emailSender.sendWelcomeEmail(user);
			}
		}
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("user", new User());

		return mav;
	}

	@RequestMapping(value = "/default", method = RequestMethod.GET)
	public ModelAndView showDefault(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("default");

		return mav;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		ModelAndView mav = null;
		User user1 = userService.validateEmailID(user);
		if (null != user1) {
			String companyMailId = user1.getCompanyemailid();
			User user2 = userService.validatepassword(user, companyMailId);
			if (null != user2) {
				String Userid = user2.getUserid();
				List<Post> postlist = userService.postlist(Userid);
				mav = new ModelAndView("dashboard");
				mav.addObject("postlist", postlist);
				mav.addObject("userid", user2.getUserid());
				mav.addObject("firstname", user2.getFirstname());
				mav.addObject("lastname", user2.getLastname());
				mav.addObject("companyemailid", user2.getCompanyemailid());
				mav.addObject("mobilenumber", user2.getMobilenumber());
				mav.addObject("companyname", user2.getCompanyname());
				mav.addObject("city", user2.getCity());
			} else {
				mav = new ModelAndView("login");
				mav.addObject("user", new User());
				mav.addObject("message2", "Password is wrong!!");
			}
		} else {
			mav = new ModelAndView("login");
			mav.addObject("user", new User());
			mav.addObject("message1", "Username is wrong!!");
		}

		return mav;
	}
	@RequestMapping(value = "/userviewpostdetails", method = RequestMethod.GET)
	public ModelAndView profile(@ModelAttribute("candidatepost") CandidatePost candidatepost,
			@RequestParam("positionid") String positionid,@RequestParam("companyMailId") String companyMailId,
			@RequestParam("firstname") String firstname) {
		ModelAndView mav = null;
		mav = new ModelAndView("postdetails");
		CandidatePost candidatepost1 = UserDao.displayPost(positionid);
		List<Skill> postskills = UserDao.positionskills(positionid);
		mav.addObject("positionid", positionid);
		mav.addObject("candidatepost", candidatepost1);
		mav.addObject("postskills", postskills);
		mav.addObject("firstname", firstname);
		mav.addObject("Application", new Application());
		mav.addObject("companyemailid",companyMailId);
		return mav;
	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(@ModelAttribute("user") User user,
			@RequestParam("companyMailId") String companyMailId) {
		ModelAndView mav = null;
		User user1 = userService.displayUser(companyMailId);
		mav = new ModelAndView("profile");
		mav.addObject("user", new User());
		mav.addObject("firstname", user1.getFirstname());
		mav.addObject("lastname", user1.getLastname());
		mav.addObject("companyemailid", user1.getCompanyemailid());
		mav.addObject("mobilenumber", user1.getMobilenumber());
		mav.addObject("companyname", user1.getCompanyname());
		mav.addObject("city", user1.getCity());
		mav.addObject("userid",user1.getUserid());
		return mav;
	}

	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public ModelAndView updateProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user, @RequestParam("companyMailId") String companyMailId,@RequestParam("Userid") String Userid) {
		ModelAndView mav = null;
		mav = new ModelAndView("dashboard");
		System.out.println("USERID"+Userid);
		List<Post> postlist = userService.postlist(Userid);
		mav.addObject("postlist", postlist);
		mav.addObject("firstname", user.getFirstname());
		mav.addObject("lastname", user.getLastname());
		mav.addObject("companyemailid", user.getCompanyemailid());
		mav.addObject("mobilenumber", user.getMobilenumber());
		mav.addObject("companyname", user.getCompanyname());
		mav.addObject("message", "You Have Updated Your Profile Successfully");
		mav.addObject("city", user.getCity());
		mav.addObject("userid", Userid);
		userService.updateuser(user, companyMailId);
		return mav;
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView showForgotPassword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("forgotpassword");
		mav.addObject("user", new User());

		return mav;
	}

	@RequestMapping(value = "/fpProcess", method = RequestMethod.POST)
	public ModelAndView forgotpasswordProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		ModelAndView mav = null;

		System.out.println("hi" + user.getCompanyemailid());
		User user1 = userService.validateEmailID(user);

		if (null != user1) {
			

			mav = new ModelAndView("passchange");
			mav.addObject("companyemailid", user1.getCompanyemailid());
			

		} else {
			mav = new ModelAndView("forgotpassword");
			
			mav.addObject("message", "Username is wrong!!");
			mav.addObject("user", new User());
		}

		return mav;
	}

	@RequestMapping(value = "/passchangeProcess", method = RequestMethod.POST)
	public ModelAndView passchangeProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user, @RequestParam("companyMailId") String companyMailId) {
		System.out.println("FIrtsname"+user.getFirstname());
		userService.updatepass(user, companyMailId);
		User user1 = userService.displayUser(companyMailId);
			emailSender.sendPasswordReset(user1);

		return new ModelAndView("passchangesuccess");

	}

	@RequestMapping(value = "/Logoutsuccess", method = RequestMethod.GET)
	public ModelAndView showLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("Logoutsuccess");
		return mav;
	}

	@RequestMapping(value = "/viewapplication", method = RequestMethod.GET)
	public ModelAndView viewapplication(@ModelAttribute("Application") Application Application,
			@RequestParam("Positionid") String Positionid, @RequestParam("Userid") String Userid,
			@RequestParam("firstname") String firstname, @RequestParam("companyMailId") String companyMailId) {
		int receivedCount = 0;
		int shortlistedCount = 0;
		int rejectedCount = 0;
		int pendingCount = 0;
		String shortlisted = "Shortlisted";
		String rejected = "Rejected";
		String pending = "Pending";
		ModelAndView mav = null;
		mav = new ModelAndView("viewapplication");
		List<Application> Applicationlist = userService.viewapplicationlist(Positionid, Userid);
		for (Application application : Applicationlist) {
			receivedCount = receivedCount + 1;
			String status = application.getStatus();

			if (status.equals(shortlisted)) {
				shortlistedCount = shortlistedCount + 1;
			}
			;
			if (status.equals(rejected)) {
				rejectedCount = rejectedCount + 1;
			}
			;
			if (status.equals(pending)) {
				pendingCount = pendingCount + 1;
			}
			;
		}
		;

		List<Candidate> pendingapplications = new ArrayList<Candidate>();
		for (Application application : Applicationlist) {
			String status = application.getStatus();
			if (status.equals(pending)) {
				String Candidateid = application.getCandidateid();
				Candidate candidate = userService.displayCandidate(Candidateid);

				pendingapplications.add(candidate);
			}
		}
		List<CandidateSkill> candidateskills = userService.candidateskillslist();
		mav.addObject("receivedCount", receivedCount);
		mav.addObject("shortlistedCount", shortlistedCount);
		mav.addObject("rejectedCount", rejectedCount);
		mav.addObject("pendingCount", pendingCount);
		mav.addObject("ApplicationList", Applicationlist);
		mav.addObject("pendingapplications", pendingapplications);
		mav.addObject("candidateskills", candidateskills);
		mav.addObject("Positionid", Positionid);
		mav.addObject("Userid", Userid);
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		return mav;
	}

	@RequestMapping(value = "/shortlist", method = RequestMethod.GET)
	public ModelAndView shortlist(@ModelAttribute("Application") Application Application,
			@RequestParam("Positionid") String Positionid, @RequestParam("Userid") String Userid,
			@RequestParam("shortlistedcandidateid") String shortListedCandidateid,
			@RequestParam("firstname") String firstname, @RequestParam("companyMailId") String companyMailId) {
		int receivedCount = 0;
		int shortlistedCount = 0;
		int rejectedCount = 0;
		int pendingCount = 0;
		String shortlisted = "Shortlisted";
		String rejected = "Rejected";
		String pending = "Pending";
		ModelAndView mav = null;
		userService.shortlistapplication(Positionid, Userid, shortListedCandidateid, shortlisted);
		mav = new ModelAndView("viewapplication");
		List<Application> Applicationlist = userService.viewapplicationlist(Positionid, Userid);
		for (Application application : Applicationlist) {
			receivedCount = receivedCount + 1;
			String status = application.getStatus();

			if (status.equals(shortlisted)) {
				shortlistedCount = shortlistedCount + 1;
			}
			;
			if (status.equals(rejected)) {
				rejectedCount = rejectedCount + 1;
			}
			;
			if (status.equals(pending)) {
				pendingCount = pendingCount + 1;
			}
			;
		}
		;

		List<Candidate> pendingapplications = new ArrayList<Candidate>();
		for (Application application : Applicationlist) {
			String status = application.getStatus();
			if (status.equals(pending)) {
				String Candidateid = application.getCandidateid();
				Candidate candidate = userService.displayCandidate(Candidateid);

				pendingapplications.add(candidate);
			}
		}
		List<CandidateSkill> candidateskills = userService.candidateskillslist();
		mav.addObject("receivedCount", receivedCount);
		mav.addObject("shortlistedCount", shortlistedCount);
		mav.addObject("rejectedCount", rejectedCount);
		mav.addObject("pendingCount", pendingCount);
		mav.addObject("ApplicationList", Applicationlist);
		mav.addObject("pendingapplications", pendingapplications);
		mav.addObject("candidateskills", candidateskills);
		mav.addObject("Positionid", Positionid);
		mav.addObject("Userid", Userid);
		mav.addObject("message", "Application Shortlisted");
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		return mav;
	}

	@RequestMapping(value = "/reject", method = RequestMethod.GET)
	public ModelAndView reject(@ModelAttribute("Application") Application Application,
			@RequestParam("Positionid") String Positionid, @RequestParam("Userid") String Userid,
			@RequestParam("rejectedcandidateid") String rejectedcandidateid,
			@RequestParam("firstname") String firstname, @RequestParam("companyMailId") String companyMailId) {
		int receivedCount = 0;
		int shortlistedCount = 0;
		int rejectedCount = 0;
		int pendingCount = 0;

		String shortlisted = "Shortlisted";
		String rejected = "Rejected";
		String pending = "Pending";
		ModelAndView mav = null;
		userService.rejectapplication(Positionid, Userid, rejectedcandidateid, rejected);
		mav = new ModelAndView("viewapplication");
		List<Application> Applicationlist = userService.viewapplicationlist(Positionid, Userid);
		for (Application application : Applicationlist) {
			receivedCount = receivedCount + 1;
			String status = application.getStatus();

			if (status.equals(shortlisted)) {
				shortlistedCount = shortlistedCount + 1;
			}
			;
			if (status.equals(rejected)) {
				rejectedCount = rejectedCount + 1;
			}
			;
			if (status.equals(pending)) {
				pendingCount = pendingCount + 1;
			}
			;
		}
		;

		List<Candidate> pendingapplications = new ArrayList<Candidate>();
		for (Application application : Applicationlist) {
			String status = application.getStatus();
			if (status.equals(pending)) {
				String Candidateid = application.getCandidateid();
				Candidate candidate = userService.displayCandidate(Candidateid);

				pendingapplications.add(candidate);
			}
		}
		List<CandidateSkill> candidateskills = userService.candidateskillslist();
		mav.addObject("receivedCount", receivedCount);
		mav.addObject("shortlistedCount", shortlistedCount);
		mav.addObject("rejectedCount", rejectedCount);
		mav.addObject("pendingCount", pendingCount);
		mav.addObject("ApplicationList", Applicationlist);
		mav.addObject("pendingapplications", pendingapplications);
		mav.addObject("candidateskills", candidateskills);
		mav.addObject("Positionid", Positionid);
		mav.addObject("Userid", Userid);
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		mav.addObject("message", "Application Rejected");
		return mav;
	}

	@RequestMapping(value = "/viewapplicationdetails", method = RequestMethod.GET)
	public ModelAndView viewapplication(@ModelAttribute("CandidateSkillForm") CandidateSkillForm CandidateSkillForm,
			@RequestParam("Positionid") String Positionid, @RequestParam("Userid") String Userid,
			@RequestParam("Candidateid") String Candidateid, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		ModelAndView mav = null;
		Candidate candidate1 = userService.displayCandidate(Candidateid);
		List<CandidateSkill> candidateskills = userService.candidateskills(Candidateid);
		mav = new ModelAndView("viewapplicationdetails");
		mav.addObject("CandidateSkillForm", new CandidateSkillForm());
		mav.addObject("candidatefirstname", candidate1.getFirstname());
		mav.addObject("lastname", candidate1.getLastname());
		mav.addObject("emailid", candidate1.getEmailid());
		mav.addObject("mobilenumber", candidate1.getMobilenumber());
		mav.addObject("city", candidate1.getCity());
		mav.addObject("candidate", candidate1);
		mav.addObject("Candidateid", candidate1.getCandidateid());
		mav.addObject("Positionid", Positionid);
		mav.addObject("Userid", Userid);
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		mav.addObject("candidateskills", candidateskills);

		return mav;
	}
}
