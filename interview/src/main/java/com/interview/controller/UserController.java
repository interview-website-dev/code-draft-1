package com.interview.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.interview.model.Login;
import com.interview.model.User;
import com.interview.service.UserService;

@Controller
public class UserController {
  @Autowired
  public UserService userService;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView mav = new ModelAndView("registerpage");
    mav.addObject("user", new User());

    return mav;
  }

  @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
  public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute("user") User user) {

    userService.register(user);

    return new ModelAndView("regsu", "firstname", user.getFirstname());
    
  }
  
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView mav = new ModelAndView("login");
    mav.addObject("login", new Login());

    return mav;
  }

  @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute("login") Login login) {
    ModelAndView mav = null;

    User user = userService.validateUser(login);

    if (null != user) {
      mav = new ModelAndView("dashboard");
      mav.addObject("firstname",user.getFirstname());
      mav.addObject("lastname", user.getLastname());
      mav.addObject("companyemailid", user.getCompanyemailid());
      mav.addObject("mobilenumber", user.getMobilenumber());
      mav.addObject("companyname", user.getCompanyname());
      mav.addObject("city", user.getCity());
     
    } else {
      mav = new ModelAndView("login");
      mav.addObject("message", "Username or Password is wrong!!");
    }

    return mav;
  }

	/*
	 * @RequestMapping(value = "/profile", method = RequestMethod.GET) public String
	 * profilepage() { return "redirect:/profilepage"; }
	 */
	/*
	 * @RequestMapping(value = "profile", method=RequestMethod.GET) public
	 * ModelAndView goPage(@RequestParam("idParam1") String
	 * idParam1, @RequestParam("idParam2") String
	 * idParam2, @RequestParam("idParam3")String
	 * idParam3, @RequestParam("idParam4")String
	 * idParam4, @RequestParam("idParam5")String idParam5, Model model) {
	 * ModelAndView mav = new ModelAndView("profile"); mav.addObject("current",
	 * "profile"); mav.addObject("firstname", idParam1);
	 * mav.addObject("companyemailid", idParam2); mav.addObject("mobilenumber",
	 * idParam3); mav.addObject("companyname", idParam4); mav.addObject("city",
	 * idParam5);
	 * 
	 * return mav; }
	 */
 @RequestMapping(value = "/profile", method = RequestMethod.GET)
  public ModelAndView profile(@ModelAttribute("user") User user,@RequestParam("companyMailId") String companyMailId) {
    ModelAndView mav = null;
    System.out.println("user hello"+companyMailId);
    User user1 = userService.displayUser(companyMailId);
   
    if (null != user1) {
    	
      mav = new ModelAndView("profile");
      mav.addObject("user", new User());
      mav.addObject("firstname",user1.getFirstname());
      mav.addObject("lastname", user1.getLastname());
      mav.addObject("companyemailid", user1.getCompanyemailid());
      mav.addObject("mobilenumber", user1.getMobilenumber());
      mav.addObject("companyname", user1.getCompanyname());
      mav.addObject("city", user1.getCity());
     
    } else {
      mav = new ModelAndView("login");
      mav.addObject("message", "Username or Password is wrong!!");
    }
  
  return mav;
  }
 
 @RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
 public ModelAndView updateProcess(HttpServletRequest request, HttpServletResponse response,
     @ModelAttribute("user") User user,@RequestParam("companyMailId") String companyMailId) {
   ModelAndView mavp = null; 
System.out.println("hi"+user.getCompanyemailid());
     userService.updateuser(user,companyMailId);
     companyMailId=user.getCompanyemailid();
     mavp = new ModelAndView("profile");

   return mavp;
 }
 @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
 public ModelAndView showForgotPassword(HttpServletRequest request, HttpServletResponse response) {
   ModelAndView mavp = new ModelAndView("forgotpassword");
   mavp.addObject("user", new User());

   return mavp;
 }

 @RequestMapping(value = "/forgotpasswordProcess", method = RequestMethod.POST)
 public ModelAndView forgotpasswordProcess(HttpServletRequest request, HttpServletResponse response,
     @ModelAttribute("user") User user) {
   ModelAndView mavp = null;
   
  
   
System.out.println("hi"+user.getCompanyemailid());
   User user1 = userService.validateEmailID(user);

   if (null != user1) {
     mavp = new ModelAndView("Passchangesuccess");
     userService.updatepass(user);
   } 
   else {
     mavp = new ModelAndView("forgotpassword");
     mavp.addObject("message", "Username is wrong!!");
   }

   return mavp;
 }
}
