package com.example.back_end.repository;

import com.example.back_end.domain.NhanKhau;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NhanKhauRepository extends JpaRepository<NhanKhau, Long> {
}
