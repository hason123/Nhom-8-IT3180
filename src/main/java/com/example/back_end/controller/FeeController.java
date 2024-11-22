package com.example.back_end.controller;

import com.example.back_end.domain.Fee;
import com.example.back_end.repository.FeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/fees")
public class FeeController {

    private final FeeRepository feeRepository;

    @Autowired
    public FeeController(FeeRepository feeRepository) {
        this.feeRepository = feeRepository;
    }

    // Hiển thị danh sách các phí
    @GetMapping
    public String listFees(Model model) {
        List<Fee> fees = (List<Fee>) feeRepository.findAll();
        model.addAttribute("fees", fees);
        return "fee/list";
    }

    // Hiển thị form để thêm phí mới
    @GetMapping("/add")
    public String showAddFeeForm(Model model) {
        model.addAttribute("fee", new Fee());
        return "fee/add";
    }

    // Xử lý việc thêm phí mới
    @PostMapping("/add")
    public String addFee(@ModelAttribute("fee") Fee fee) {
        feeRepository.save(fee);
        return "redirect:/fees";
    }

    // Hiển thị form để chỉnh sửa phí
    @GetMapping("/edit/{id}")
    public String showEditFeeForm(@PathVariable("id") Long id, Model model) {
        Optional<Fee> fee = feeRepository.findById(id);
        if (fee.isPresent()) {
            model.addAttribute("fee", fee.get());
            return "fee/edit";
        }
        return "redirect:/fees";
    }

    // Xử lý việc cập nhật phí
    @PostMapping("/edit")
    public String updateFee(@ModelAttribute("fee") Fee fee) {
        feeRepository.save(fee);
        return "redirect:/fees";
    }

    // Xử lý việc xóa phí
    @GetMapping("/delete/{id}")
    public String deleteFee(@PathVariable("id") Long id) {
        feeRepository.deleteById(id);
        return "redirect:/fees";
    }
}
