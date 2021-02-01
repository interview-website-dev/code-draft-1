package com.interview.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.interview.dao.UserDao;
import com.interview.model.Post;
import com.interview.model.SkillForm;
import com.interview.model.User;
import com.interview.model.Skill;
import com.interview.service.UserService;

@Controller
public class PostController {
	@Autowired
	public UserService userService;
	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/Skills", method = RequestMethod.GET)
	public ModelAndView showskills(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("Skills");

		mav.addObject("SkillForm", new SkillForm());
		return mav;
	}

	@RequestMapping(value = "/skillProcess", method = RequestMethod.POST)
	public ModelAndView addskill(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("SkillForm") SkillForm SkillForm, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		ModelAndView mav = new ModelAndView("summary");
		List<Skill> skills = SkillForm.getSkills();
		for (Skill skill : skills) {

			System.out.printf(skill.getSkillname() + "\n");
			System.out.printf(skill.getPositionid() + "\n");
			System.out.printf(skill.getProficiencylevel());
		}
		mav.addObject("skills", skills);
		mav.addObject("Positionname", SkillForm.getPositionname());
		mav.addObject("Date", SkillForm.getDate());
		mav.addObject("Location", SkillForm.getLocation());
		mav.addObject("Address", SkillForm.getAddress());
		mav.addObject("Qualification", SkillForm.getQualification());
		mav.addObject("Salary", SkillForm.getSalary());
		mav.addObject("Noofposition", SkillForm.getNoofposition());
		mav.addObject("Userid", SkillForm.getUserid());
		mav.addObject("Positionid", SkillForm.getPositionid());
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		return mav;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView showPost(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("userid") String userid, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		ModelAndView mav = new ModelAndView("postpage");
		mav.addObject("post", new Post());
		Post maxposition = userService.maxpositionid();
		String maxpositionid = maxposition.getPositionid();
		int newpositionid = Integer.parseInt(maxpositionid);
		newpositionid = newpositionid + 1;
		mav.addObject("newpositionid", newpositionid);
		mav.addObject("userid", userid);
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		System.out.println("hello" + userid);
		return mav;
	}

	@RequestMapping(value = "/postProcess", method = RequestMethod.POST)
	public ModelAndView addpost(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("post") Post post, Map<String, Object> model, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) throws JsonProcessingException {
		List<String> listSkills = userDao.skilllist();
		System.out.println("hello" + listSkills);
		ModelAndView mav = new ModelAndView("Skills");

		System.out.println(post.getPositionname());
		mav.addObject("SkillForm", new SkillForm());
		mav.addObject("Skilllist", listSkills);
		mav.addObject("Userid", post.getUserid());
		mav.addObject("Positionid", post.getPositionid());
		mav.addObject("Positionname", post.getPositionname());
		mav.addObject("Date", post.getDate());
		mav.addObject("Location", post.getLocation());
		mav.addObject("Address", post.getAddress());
		mav.addObject("Qualification", post.getQualification());
		mav.addObject("Salary", post.getSalary());
		mav.addObject("Noofposition", post.getNoofposition());
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		mav.addObject("post", post);
		return mav;

	}

	@RequestMapping(value = "/SummaryProcess", method = RequestMethod.POST)
	public ModelAndView forgotpasswordProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("SkillForm") SkillForm SkillForm) {
		List<Skill> skills = SkillForm.getSkills();
		String positionid = SkillForm.getPositionid();
		Post postvalidator = userService.validatepost(positionid);
		if(null==postvalidator) {
		userService.post(SkillForm);
		userService.postskills(skills);
		}
		ModelAndView mav = new ModelAndView("dashboard");
		
		
		for (Skill skill : skills) {

			System.out.printf(skill.getSkillname() + "\n");
			System.out.printf(skill.getPositionid() + "\n");
			System.out.printf(skill.getProficiencylevel());
		}
		mav.addObject("skills", skills);
		mav.addObject("Userid", SkillForm.getUserid());
		System.out.println("hello" + SkillForm.getUserid());
		String Userid = SkillForm.getUserid();
		List<Post> postlist = userService.postlist(Userid);
		User user2 = userService.Userdetails(Userid);
		mav.addObject("postlist", postlist);
		mav.addObject("userid", user2.getUserid());
		mav.addObject("firstname", user2.getFirstname());
		mav.addObject("lastname", user2.getLastname());
		mav.addObject("companyemailid", user2.getCompanyemailid());
		mav.addObject("mobilenumber", user2.getMobilenumber());
		mav.addObject("companyname", user2.getCompanyname());
		mav.addObject("city", user2.getCity());
		mav.addObject("message", "Post created successfully");
		return mav;
	}

	@RequestMapping(value = "/EditProcess", method = RequestMethod.POST)
	public ModelAndView EditProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("SkillForm") SkillForm SkillForm, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		System.out.println("post.getPositionname()" + SkillForm.getPositionname());
		ModelAndView mav = new ModelAndView("editpost");
		List<Skill> skills = SkillForm.getSkills();
		for (Skill skill : skills) {

			System.out.printf(skill.getSkillname() + "\n");
			System.out.printf(skill.getPositionid() + "\n");
			System.out.printf(skill.getProficiencylevel());
		}
		mav.addObject("skills", skills);
		mav.addObject("SkillForm", SkillForm);
		mav.addObject("Positionname", SkillForm.getPositionname());
		/* System.out.println(SkillForm.getPositionname()); */
		mav.addObject("Date", SkillForm.getDate());
		mav.addObject("Location", SkillForm.getLocation());
		mav.addObject("Address", SkillForm.getAddress());
		mav.addObject("Qualification", SkillForm.getQualification());
		mav.addObject("Salary", SkillForm.getSalary());
		mav.addObject("Noofposition", SkillForm.getNoofposition());
		mav.addObject("Userid", SkillForm.getUserid());
		mav.addObject("Positionid", SkillForm.getPositionid());
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		return mav;

	}

	@RequestMapping(value = "/editpost", method = RequestMethod.POST)
	public ModelAndView Editpost(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("SkillForm") SkillForm SkillForm, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		System.out.println("post.getPositionname()" + SkillForm.getPositionname());

		ModelAndView mav = new ModelAndView("editskills");
		List<Skill> skills = SkillForm.getSkills();
		for (Skill skill : skills) {

			System.out.printf(skill.getSkillname() + "\n");
			System.out.printf(skill.getPositionid() + "\n");
			System.out.printf(skill.getProficiencylevel());
		}
		List<String> listSkills = userDao.skilllist();
		System.out.println("hello" + listSkills);
		mav.addObject("listSkills", listSkills);
		mav.addObject("skills", skills);
		mav.addObject("Positionname", SkillForm.getPositionname());
		mav.addObject("Date", SkillForm.getDate());
		mav.addObject("Location", SkillForm.getLocation());
		mav.addObject("Address", SkillForm.getAddress());
		mav.addObject("Qualification", SkillForm.getQualification());
		mav.addObject("Salary", SkillForm.getSalary());
		mav.addObject("Noofposition", SkillForm.getNoofposition());
		mav.addObject("Userid", SkillForm.getUserid());
		mav.addObject("Positionid", SkillForm.getPositionid());
		mav.addObject("firstname", firstname);
		mav.addObject("companyemailid", companyMailId);
		return mav;

	}

	@RequestMapping(value = "/editskills", method = RequestMethod.POST)
	public ModelAndView Editskill(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("SkillForm") SkillForm SkillForm, @RequestParam("firstname") String firstname,
			@RequestParam("companyMailId") String companyMailId) {
		ModelAndView mav = null;
		
		List<Skill> skills = SkillForm.getSkills();
		for (Skill skill : skills) {
			if(skill.getSkillname() == "select a skill" || skill.getProficiencylevel() == "select a level") {
				skills.remove(skill);
			};
		};
		
			mav = new ModelAndView("summary");
			mav.addObject("skills", skills);
			mav.addObject("Positionname", SkillForm.getPositionname());
			mav.addObject("Date", SkillForm.getDate());
			mav.addObject("Location", SkillForm.getLocation());
			mav.addObject("Address", SkillForm.getAddress());
			mav.addObject("Qualification", SkillForm.getQualification());
			mav.addObject("Salary", SkillForm.getSalary());
			mav.addObject("Noofposition", SkillForm.getNoofposition());
			mav.addObject("Userid", SkillForm.getUserid());
			mav.addObject("Positionid", SkillForm.getPositionid());
			mav.addObject("firstname", firstname);
			mav.addObject("companyemailid", companyMailId);
		
		return mav;
		
	}
}
