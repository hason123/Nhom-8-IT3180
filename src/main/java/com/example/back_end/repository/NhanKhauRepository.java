package com.example.back_end.repository;

import com.example.back_end.domain.NhanKhau;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanKhauRepository extends JpaRepository<NhanKhau, Long> {
    List<NhanKhau> findByHoTen(String hoTen);
    List<NhanKhau> findByRoom(int room);
    List<NhanKhau> findByNoiSinh(String noiSinh); // Hoặc kiểu ngày tùy vào yêu cầu
    List<NhanKhau> findByTrangThai(String trangThai);
    List<NhanKhau> findByDiaChiThuongTru(String diaChiThuongTru);
    // Thêm các phương thức tìm kiếm khác nếu cần
}


