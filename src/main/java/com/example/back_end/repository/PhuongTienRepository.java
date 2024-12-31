package com.example.back_end.repository;

import com.example.back_end.domain.PhuongTien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhuongTienRepository extends JpaRepository<PhuongTien, Long> {

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.loaiXe AS string) LIKE %:keyword%")
    List<PhuongTien> findByLoaiXe(@Param("keyword") String keyword);

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.tenXe AS string) LIKE %:keyword%")
    List<PhuongTien> findByTenXe(@Param("keyword") String keyword);

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.bienKiemSoat AS string) LIKE %:keyword%")
    List<PhuongTien> findByBienKiemSoat(@Param("keyword") String keyword);

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.tenChuXe AS string) LIKE %:keyword%")
    List<PhuongTien> findByTenChuXe(@Param("keyword") String keyword);

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.maChuXe AS string) LIKE %:keyword%")
    List<PhuongTien> findByMaChuXe(@Param("keyword") String keyword);

    @Query("SELECT r FROM PhuongTien r WHERE CAST(r.room.idRoom AS string) LIKE %:keyword%")
    List<PhuongTien> findByPhongChuXe(@Param("keyword") String keyword);

}
