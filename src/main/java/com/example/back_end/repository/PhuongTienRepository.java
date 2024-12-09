package com.example.back_end.repository;

import com.example.back_end.domain.PhuongTien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhuongTienRepository extends JpaRepository<PhuongTien, Long> {
    List<PhuongTien> findByLoaiXe(String loaiXe);

    List<PhuongTien> findByTenXe(String tenXe);

    List<PhuongTien> findByBienKiemSoat(String bienKiemSoat);

    List<PhuongTien> findByTenChuXe(String tenChuXe);

    List<PhuongTien> findByMaChuXe(String maChuXe);

}
