package com.example.back_end.repository;

import com.example.back_end.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository  extends CrudRepository<User, Long> {
    User save(User user);

    Optional<User> findByEmail(String email);
}
