package com.example.back_end.controller;

import com.example.back_end.domain.PhuongTien;
import com.example.back_end.repository.PhuongTienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/phuong-tien")
public class PhuongTienController {

    private final PhuongTienRepository phuongTienRepository;

    @Autowired
    public PhuongTienController(PhuongTienRepository phuongTienRepository) {
        this.phuongTienRepository = phuongTienRepository;
    }

    // Hiển thị danh sách phương tiện
    @GetMapping
    public String listPhuongTien(Model model) {
        List<PhuongTien> phuongTiens = (List<PhuongTien>) phuongTienRepository.findAll();
        model.addAttribute("phuongTiens", phuongTiens);
        return "phuongtien/list"; // Trả về view hiển thị danh sách phương tiện
    }

    // Hiển thị form thêm phương tiện
    @GetMapping("/add")
    public String showAddPhuongTienForm(Model model) {
        model.addAttribute("phuongTien", new PhuongTien());
        return "phuongtien/add"; // Tên của view hiển thị form thêm
    }

    // Xử lý thêm phương tiện mới
    @PostMapping("/add")
    public String addPhuongTien(@ModelAttribute("phuongTien") PhuongTien phuongTien) {
        phuongTienRepository.save(phuongTien);
        return "redirect:/phuong-tien";
    }

    // Hiển thị form chỉnh sửa phương tiện
    @GetMapping("/edit/{id}")
    public String showEditPhuongTienForm(@PathVariable("id") Long id, Model model) {
        Optional<PhuongTien> phuongTien = phuongTienRepository.findById(id);
        if (phuongTien.isPresent()) {
            model.addAttribute("phuongTien", phuongTien.get());
            return "phuongtien/edit"; // Tên của view hiển thị form cập nhật
        }
        return "redirect:/phuong-tien";
    }

    // Xử lý cập nhật phương tiện
    @PostMapping("/edit")
    public String updatePhuongTien(@ModelAttribute("phuongTien") PhuongTien phuongTien) {
        phuongTienRepository.save(phuongTien);
        return "redirect:/phuong-tien";
    }

    // Xóa phương tiện
    @GetMapping("/delete/{id}")
    public String deletePhuongTien(@PathVariable("id") Long id) {
        phuongTienRepository.deleteById(id);
        return "redirect:/phuong-tien";
    }
}
