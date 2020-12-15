package com.interview.dao;


import com.interview.model.User;

import com.interview.model.Login;

public interface UserDao {

  int register(User user);
  User validateUser(Login login);

}
