package com.example.back_end.controller;

import com.example.back_end.domain.User;
import com.example.back_end.dto.ChangePasswordDto;
import com.example.back_end.dto.UserLoginDto;
import com.example.back_end.repository.UserRepository;
import com.example.back_end.service.LoginService;
import com.example.back_end.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
     private UserService userService;
     private UserRepository userRepository;
     private LoginService loginService;

     public UserController(UserService userService, UserRepository userRepository, LoginService loginService) {
          this.userService = userService;
          this.userRepository = userRepository;
          this.loginService = loginService;
     }

     @RequestMapping("/register")
     public String registerPage(Model model) {
          model.addAttribute("newUser", new User());
          return "admin/dangky";
     }

     @RequestMapping(value = "/user/save", method = RequestMethod.POST)
     public String saveUser(RedirectAttributes redirectAttributes, @ModelAttribute("newUser") User user, Model model) {
          // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
          if (userRepository.existsByEmail(user.getEmail())) {
               model.addAttribute("error", "The email has already been taken");
               return "admin/dangky"; // Trở lại trang đăng ký nếu email đã tồn tại
          }

          // Lưu người dùng mới nếu email chưa tồn tại
          userRepository.save(user);
          redirectAttributes.addFlashAttribute("successMessage", "Bạn đã đăng ký thành công!");
          return "redirect:/login"; // Chuyển hướng nếu đăng ký thành công
     }

     @RequestMapping("/login")
     public String login(Model model) {
          model.addAttribute("userdto", new UserLoginDto());
          return "admin/login";
     }

     @RequestMapping(value = "/user/login", method = RequestMethod.POST)
     public String loginPage(Model model, @ModelAttribute("userdto") UserLoginDto userdto) {
          if (loginService.login(userdto.getEmail(), userdto.getPassword())) {
               return "admin/home";
          } else {
               model.addAttribute("error", "Invalid username or password");
               return "admin/login";
          }
     }

     @RequestMapping("/user/list")
     public String listUsers(Model model) {
          // Lấy danh sách tất cả người dùng từ UserRepository
          List<User> users = (List<User>) userRepository.findAll();

          model.addAttribute("users", users);

          return "user/list";
     }

     @RequestMapping(value = "/user/delete/{id}", method = RequestMethod.GET)
     public String deleteUser(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
          // Kiểm tra xem người dùng có tồn tại không
          Optional<User> user = userRepository.findById(id);
          if (user.isPresent()) {
               userRepository.deleteById(id); // Xóa người dùng theo ID
               redirectAttributes.addFlashAttribute("successMessage", "Người dùng đã được xóa thành công!");
          } else {
               redirectAttributes.addFlashAttribute("errorMessage", "Người dùng không tồn tại!");
          }
          return "redirect:/user/list"; // Chuyển hướng về danh sách người dùng
     }

     // Chỉnh sửa thông tin người dùng
     @RequestMapping(value = "/user/edit/{id}", method = RequestMethod.GET)
     public String editProfile(@PathVariable("id") Long id, Model model) {
          // Tìm người dùng theo ID
          Optional<User> user = userRepository.findById(id);
          if (user.isPresent()) {
               model.addAttribute("user", user.get()); // Truyền đối tượng người dùng vào view
               return "user/editProfile"; // Chuyển đến trang chỉnh sửa
          } else {
               model.addAttribute("error", "Không tìm thấy người dùng.");
               return "user/list"; // Nếu không tìm thấy người dùng, quay lại danh sách người dùng
          }
     }

     @RequestMapping(value = "/user/edit/{id}", method = RequestMethod.POST)
     public String saveProfile(@PathVariable("id") Long id, @ModelAttribute("user") User user, Model model,
               RedirectAttributes redirectAttributes) {
          Optional<User> existingUser = userRepository.findById(id);
          if (existingUser.isPresent()) {
               User currentUser = existingUser.get();

               // Cập nhật thông tin người dùng
               currentUser.setFullName(user.getFullName());
               currentUser.setPhone(user.getPhone());
               currentUser.setAddress(user.getAddress());

               // Lưu lại người dùng đã cập nhật
               userRepository.save(currentUser);

               // Thêm thông báo thành công và chuyển hướng về trang chỉnh sửa
               redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công!");
               return "redirect:/user/edit/" + id; // Chuyển hướng lại trang chỉnh sửa để hiển thị thông báo
          } else {
               model.addAttribute("error", "Không tìm thấy người dùng.");
               return "user/list"; // Nếu không tìm thấy người dùng, quay lại danh sách
          }
     }

     @RequestMapping("/user/add")
     public String addUserPage(Model model) {
          model.addAttribute("newUser", new User());
          return "user/addUser"; // View for adding a new user
     }

     @RequestMapping(value = "/user/add", method = RequestMethod.POST)
     public String saveNewUser(@ModelAttribute("newUser") User user, Model model) {
          // Check if the email already exists in the database
          if (userRepository.existsByEmail(user.getEmail())) {
               model.addAttribute("error", "Email này đã được sử dụng!");
               return "user/list"; // Redirect to add user page if email exists
          }

          // Save the new user if email is unique
          userRepository.save(user);
          model.addAttribute("successMessage", "Ngưới dùng đã được thêm thành công!");
          return "redirect:/user/list"; // Redirect to home page after successful addition
     }

     @RequestMapping(value = "/user/change-password", method = RequestMethod.POST)
     public String changePassword(@ModelAttribute("changePasswordForm") ChangePasswordDto changePasswordDto,
                                  @RequestParam("userId") Long userId, Model model) {
          // Lấy thông tin người dùng từ ID
          User currentUser = getCurrentUser(userId); // Thay đổi getCurrentUser để nhận ID

          // Kiểm tra mật khẩu cũ
          if (!currentUser.getPassword().equals(changePasswordDto.getCurrentPassword())) {
               model.addAttribute("error", "Mật khẩu cũ không đúng.");
               return "user/changePassword";
          }

          // Kiểm tra xác nhận mật khẩu
          if (!changePasswordDto.getNewPassword().equals(changePasswordDto.getConfirmPassword())) {
               model.addAttribute("error", "Mật khẩu mới và xác nhận không khớp.");
               return "user/changePassword";
          }

          // Cập nhật mật khẩu mới
          currentUser.setPassword(changePasswordDto.getNewPassword());
          userRepository.save(currentUser);

          model.addAttribute("successMessage", "Đổi mật khẩu thành công!");
          return "user/changePassword"; // Trả về trang đổi mật khẩu với thông báo thành công
     }

     @RequestMapping(value = "/user/changePassword/{id}", method = RequestMethod.GET)
     public String changePasswordPage(@PathVariable("id") Long id, Model model) {
          // Lấy thông tin người dùng từ id
          Optional<User> user = userRepository.findById(id);
          if (user.isPresent()) {
               model.addAttribute("user", user.get());
          } else {
               model.addAttribute("error", "Không tìm thấy người dùng.");
          }
          return "user/changePassword"; // Trả về trang changePassword
     }

     // Hàm lấy thông tin người dùng dựa trên ID
     private User getCurrentUser(Long userId) {
          return userRepository.findById(userId)
                  .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));
     }


     @RequestMapping("/home")
     public String homePage() {
          return "admin/home";
     }

     /*
     @RequestMapping(value = "/user/change-password", method = RequestMethod.POST)
     public String changePassword(@ModelAttribute("changePasswordForm") ChangePasswordDto changePasswordDto,
                                  Model model) {
          User currentUser = getCurrentUser(); // Hàm lấy người dùng hiện tại

          // Kiểm tra mật khẩu cũ
          if (!currentUser.getPassword().equals(changePasswordDto.getCurrentPassword())) {
               model.addAttribute("error", "Mật khẩu cũ không đúng.");
               return "user/changePassword";
          }

          // Kiểm tra xác nhận mật khẩu
          if (!changePasswordDto.getNewPassword().equals(changePasswordDto.getConfirmPassword())) {
               model.addAttribute("error", "Mật khẩu mới và xác nhận không khớp.");
               return "user/changePassword";
          }

          // Cập nhật mật khẩu mới
          currentUser.setPassword(changePasswordDto.getNewPassword());
          userRepository.save(currentUser);

          model.addAttribute("successMessage", "Đổi mật khẩu thành công!");
          return "user/changePassword"; // Trả về trang đổi mật khẩu với thông báo thành công
     }

     @RequestMapping(value = "/user/changePassword/{id}", method = RequestMethod.GET)
     public String changePasswordPage(@PathVariable("id") Long id, Model model) {
          // Lấy thông tin người dùng từ id
          Optional<User> user = userRepository.findById(id);
          if (user.isPresent()) {
               model.addAttribute("user", user.get());
          } else {
               model.addAttribute("error", "Không tìm thấy người dùng.");
          }
          return "user/changePassword"; // Trả về trang changePassword
     }

     // Hàm giả định lấy người dùng hiện tại (bạn cần tự triển khai theo ứng dụng của
     // mình)
     private User getCurrentUser() {
          // Ví dụ: Lấy từ session hoặc context
          return userRepository.findById(1L).orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));
     }

      */

}
