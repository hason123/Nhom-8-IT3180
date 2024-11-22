package com.example.back_end.repository;

import com.example.back_end.domain.Bill;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface BillRepository extends CrudRepository<Bill, Long> {
    // Tìm kiếm Payment theo mã căn hộ (maCanHo)
    List<Bill> findByMaCanHo(String maCanHo);

    // Tìm kiếm Payment theo trạng thái (trangThai)
    List<Bill> findByTrangThai(String trangThai);

    // Tìm kiếm Payment theo tiêu đề (tieuDe)
    List<Bill> findByTieuDe(String tieuDe);
}
