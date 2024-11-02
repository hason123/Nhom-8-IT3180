package com.example.back_end.controller;

import com.example.back_end.domain.User;
import com.example.back_end.repository.UserRepository;
import com.example.back_end.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
     private UserService userService;
     private UserRepository userRepository;
     public UserController(UserService userService, UserRepository userRepository)
     {
          this.userService = userService;
          this.userRepository = userRepository;
     }

     @RequestMapping("/register")
     public String registerPage(Model model){
          model.addAttribute("newUser", new User());
          return "admin/dangky";
     }
     @RequestMapping(value = "/user/save", method = RequestMethod.POST)
     public String saveUser(Model model,@ModelAttribute("newUser") User user){
          userRepository.save(user);
          return "admin/dangkythanhcong";
     }

}
