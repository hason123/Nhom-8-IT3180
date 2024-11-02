package com.example.back_end.repository;

import com.example.back_end.domain.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository  extends CrudRepository<User, Long> {
    User save(User user);
}
