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
  public User validateEmailID(User user) {
	    return userDao.validateEmailID(user);
	  }
  public int updatepass(User user) {
	    return userDao.updatepass(user);
	  }

}
