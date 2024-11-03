package com.example.back_end.service;

import com.example.back_end.domain.User;
import com.example.back_end.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LoginService {
    private UserRepository userRepository;
    public LoginService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public boolean login(String email, String password) {
        Optional<User> otpUser=userRepository.findByEmail(email);
        if(otpUser.isPresent()) {
            if(otpUser.get().getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
