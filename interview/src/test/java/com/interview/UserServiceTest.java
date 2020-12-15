package com.interview;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.interview.model.User;
import com.interview.service.UserService;

import com.interview.model.Login;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:jbr/config/user-beans.xml" })
public class UserServiceTest {

  @Autowired
  private UserService userService;

  @Test
  public void testRegister() {
    User user = new User();
    user.setFirstname("ranjith");
    user.setLastname("sekar");
    user.setCompanyemailid("Ranjith");
    user.setMobilenumber("Sekar");
    user.setCompanyname("chennai, t.nagar");
    user.setCity("ranjith@gmail.com");
    int result = userService.register(user);
    Assert.assertEquals(1, result);
  }
  @Test
  public void testValidateUser() {
    Login login = new Login();
    login.setCompanyemailid("ranjith");
    login.setPassword("sekar");

    User user = userService.validateUser(login);
    Assert.assertEquals("Ranjith", user.getFirstname());
  }

}


  


