package com.example.back_end.controller;

import com.example.back_end.domain.User;
import com.example.back_end.dto.UserLoginDto;
import com.example.back_end.repository.UserRepository;
import com.example.back_end.service.LoginService;
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
     private LoginService loginService;
     public UserController(UserService userService, UserRepository userRepository, LoginService loginService)
     {
          this.userService = userService;
          this.userRepository = userRepository;
          this.loginService = loginService;
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

     @RequestMapping("/login")
     public String login(Model model){
          model.addAttribute("userdto", new UserLoginDto());
          return "admin/login";
     }
     @RequestMapping(value = "/user/login",method = RequestMethod.POST)
     public String loginPage(Model model,@ModelAttribute("userdto") UserLoginDto userdto){
         if(loginService.login(userdto.getEmail(),userdto.getPassword())) {
               return "admin/home";
          }
         else{
              model.addAttribute("error", "Invalid username or password");
              return "admin/login";
         }
     }

}
