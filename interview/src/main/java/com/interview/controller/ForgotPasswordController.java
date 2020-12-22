package com.interview.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.interview.model.User;
import com.interview.service.UserService;

@Controller
public class ForgotPasswordController {

  @Autowired
  UserService userService;

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
