package com.example.back_end.controller;

import com.example.back_end.domain.Bill;
import com.example.back_end.repository.BillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/bills")
public class BillController {

    private final BillRepository billRepository;

    @Autowired
    public BillController(BillRepository billRepository) {
        this.billRepository = billRepository;
    }

    // Hiển thị danh sách các hóa đơn
    @GetMapping
    public String listBills(
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        List<Bill> bills;

        if (keyword != null && !keyword.isEmpty()) {
            switch (searchType) {
                case "maCanHo":
                    bills = billRepository.findByMaCanHo(keyword);
                    break;
                case "trangThai":
                    bills = billRepository.findByTrangThai(keyword);
                    break;
                case "tieuDe":
                    bills = billRepository.findByTieuDe(keyword);
                    break;
                case "kiThanhToan":
                    bills = billRepository.findBykiThanhToan(keyword);
                    break;
                case "idThanhToan":
                    bills = billRepository.findByidThanhToan(Integer.parseInt(keyword));
                    break;
                case "idCacKhoanPhi":
                    bills = billRepository.findByidCacKhoanPhi(Integer.parseInt(keyword));
                    break;
                default:
                    bills = (List<Bill>) billRepository.findAll();
                    break;
            }
        } else {
            bills = (List<Bill>) billRepository.findAll();
        }

        model.addAttribute("bills", bills);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalBills", bills.size());
        return "bill/list";
    }

    // Hiển thị form thêm hóa đơn mới
    @GetMapping("/add")
    public String showAddBillForm(Model model) {
        model.addAttribute("bill", new Bill());
        return "bill/add"; // Chuyển đến form thêm hóa đơn
    }

    // Thêm hóa đơn mới
    @PostMapping("/add")
    public String addBill(@ModelAttribute("bill") Bill bill) {
        billRepository.save(bill); // Lưu hóa đơn mới
        return "redirect:/bills"; // Chuyển hướng về trang danh sách hóa đơn
    }

    // Hiển thị form chỉnh sửa hóa đơn
    @GetMapping("/edit/{id}")
    public String showEditBillForm(@PathVariable("id") Long id, Model model) {
        Optional<Bill> bill = billRepository.findById(id);
        if (bill.isPresent()) {
            model.addAttribute("bill", bill.get());
            return "bill/edit"; // Chuyển đến form chỉnh sửa hóa đơn
        }
        return "redirect:/bills"; // Nếu không tìm thấy hóa đơn, chuyển hướng về trang danh sách
    }

    // Cập nhật hóa đơn
    @PostMapping("/edit")
    public String updateBill(@ModelAttribute("bill") Bill bill) {
        billRepository.save(bill); // Lưu hóa đơn đã chỉnh sửa
        return "redirect:/bills"; // Chuyển hướng về trang danh sách hóa đơn
    }

    // Xóa hóa đơn
    @GetMapping("/delete/{id}")
    public String deleteBill(@PathVariable("id") Long id) {
        billRepository.deleteById(id); // Xóa hóa đơn theo id
        return "redirect:/bills"; // Chuyển hướng về trang danh sách hóa đơn
    }
}
