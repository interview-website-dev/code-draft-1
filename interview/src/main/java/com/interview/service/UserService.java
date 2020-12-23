package com.interview.service;


import com.interview.model.User;

import com.interview.model.Login;

public interface UserService {

  int register(User user);
  User validateUser(Login login);
  User displayUser(String mailid);
  User validateEmailID(User user);
  int updatepass(User user);
}
