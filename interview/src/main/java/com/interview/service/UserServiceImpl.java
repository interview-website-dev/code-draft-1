package com.interview.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.interview.dao.UserDao;

import com.interview.model.User;

import com.interview.model.Login;

public class UserServiceImpl implements UserService {

  @Autowired
  public UserDao userDao;

  public int register(User user) {
    return userDao.register(user);
  }
  public User validateUser(Login login) {
	    return userDao.validateUser(login);
	  }
  

}
