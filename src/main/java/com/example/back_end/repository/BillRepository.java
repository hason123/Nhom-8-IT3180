package com.example.back_end.repository;

import com.example.back_end.domain.Bill;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BillRepository extends CrudRepository<Bill, Long> {
    // Tìm kiếm Payment theo mã căn hộ (maCanHo)
    @Query("SELECT r FROM Bill r WHERE CAST(r.maCanHo AS string) LIKE %:keyword%")
    List<Bill> findByMaCanHo(@Param("keyword") String keyword);

    // Tìm kiếm Payment theo trạng thái (trangThai)
    @Query("SELECT r FROM Bill r WHERE CAST(r.trangThai AS string) LIKE %:keyword%")
    List<Bill> findByTrangThai(@Param("keyword") String keyword);

    // Tìm kiếm Payment theo tiêu đề (tieuDe)
    @Query("SELECT r FROM Bill r WHERE CAST(r.tieuDe AS string) LIKE %:keyword%")
    List<Bill> findByTieuDe(@Param("keyword") String keyword);

    @Query("SELECT r FROM Bill r WHERE CAST(r.trangThai AS string) LIKE %:keyword%")
    List<Bill> findBykiThanhToan (@Param("keyword") String keyword);

    @Query("SELECT r FROM Bill r WHERE CAST(r.loaiThanhToan AS string) LIKE %:keyword%")
    List<Bill> findByLoaiThanhToan(@Param("keyword") String keyword);

    @Query("SELECT r FROM Bill r WHERE CAST(r.idCacKhoanPhi AS string) LIKE %:keyword%")
    List<Bill> findByidCacKhoanPhi (@Param("keyword") String keyword);

}
