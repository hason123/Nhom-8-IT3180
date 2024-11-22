package com.example.back_end.repository;

import com.example.back_end.domain.PaymentMethod;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface PaymentMethodRepository extends CrudRepository<PaymentMethod, Integer> {
    // Tìm kiếm PaymentMethod theo tên (ten)
    List<PaymentMethod> findByTen(String ten);


}
