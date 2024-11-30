package com.example.back_end.repository;

import com.example.back_end.domain.Fee;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface FeeRepository extends CrudRepository<Fee, Long> {
    List<Fee> findByIdPhi(int idPhi);

}
