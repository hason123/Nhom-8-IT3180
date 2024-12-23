package com.example.back_end.repository;

import com.example.back_end.domain.NhanKhau;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanKhauRepository extends JpaRepository<NhanKhau, Long> {

    @Query("SELECT r FROM NhanKhau r WHERE CAST(r.hoTen AS string) LIKE %:keyword%")
    List<NhanKhau> findByHoTen(@Param("keyword") String keyword);

    @Query("SELECT r FROM NhanKhau r WHERE CAST(r.idRoom AS string) LIKE %:keyword%")
    List<NhanKhau> findByidRoom(@Param("keyword") String keyword);

    @Query("SELECT r FROM NhanKhau r WHERE CAST(r.noiSinh AS string) LIKE %:keyword%")
    List<NhanKhau> findByNoiSinh(@Param("keyword") String keyword); // Hoặc kiểu ngày tùy vào yêu cầu

    @Query("SELECT r FROM NhanKhau r WHERE CAST(r.trangThai AS string) LIKE %:keyword%")
    List<NhanKhau> findByTrangThai(@Param("keyword") String keyword);

    @Query("SELECT r FROM NhanKhau r WHERE CAST(r.diaChiThuongTru AS string) LIKE %:keyword%")
    List<NhanKhau> findByDiaChiThuongTru(@Param("keyword") String keyword);

}


