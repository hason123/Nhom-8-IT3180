package com.example.back_end.controller;

import com.example.back_end.domain.PaymentMethod;
import com.example.back_end.repository.PaymentMethodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/payment-methods")
public class PaymentMethodController {

    private final PaymentMethodRepository paymentMethodRepository;

    @Autowired
    public PaymentMethodController(PaymentMethodRepository paymentMethodRepository) {
        this.paymentMethodRepository = paymentMethodRepository;
    }

    // Hiển thị danh sách các hình thức thanh toán
    @GetMapping
    public String listPaymentMethods(Model model) {
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodRepository.findAll();
        model.addAttribute("paymentMethods", paymentMethods);
        return "payment-method/list"; // Tên của view hiển thị danh sách
    }

    // Hiển thị form thêm mới hình thức thanh toán
    @GetMapping("/add")
    public String showAddPaymentMethodForm(Model model) {
        model.addAttribute("paymentMethod", new PaymentMethod());
        return "payment-method/add"; // Tên của view hiển thị form thêm mới
    }

    // Xử lý thêm mới hình thức thanh toán
    @PostMapping("/add")
    public String addPaymentMethod(@ModelAttribute("paymentMethod") PaymentMethod paymentMethod) {
        paymentMethodRepository.save(paymentMethod);
        return "redirect:/payment-methods"; // Quay lại danh sách sau khi lưu thành công
    }

    // Hiển thị form chỉnh sửa hình thức thanh toán
    @GetMapping("/edit/{id}")
    public String showEditPaymentMethodForm(@PathVariable("id") Integer id, Model model) {
        Optional<PaymentMethod> paymentMethod = paymentMethodRepository.findById(id);
        if (paymentMethod.isPresent()) {
            model.addAttribute("paymentMethod", paymentMethod.get());
            return "payment-method/edit"; // Tên của view hiển thị form chỉnh sửa
        }
        return "redirect:/payment-methods"; // Quay lại danh sách nếu không tìm thấy
    }

    // Xử lý chỉnh sửa hình thức thanh toán
    @PostMapping("/edit")
    public String updatePaymentMethod(@ModelAttribute("paymentMethod") PaymentMethod paymentMethod) {
        paymentMethodRepository.save(paymentMethod);
        return "redirect:/payment-methods"; // Quay lại danh sách sau khi cập nhật
    }

    // Xử lý xóa hình thức thanh toán
    @GetMapping("/delete/{id}")
    public String deletePaymentMethod(@PathVariable("id") Integer id) {
        paymentMethodRepository.deleteById(id);
        return "redirect:/payment-methods"; // Quay lại danh sách sau khi xóa
    }
}
