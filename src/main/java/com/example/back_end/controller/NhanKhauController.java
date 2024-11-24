package com.example.back_end.controller;

import com.example.back_end.domain.NhanKhau;
import com.example.back_end.repository.NhanKhauRepository;
import com.example.back_end.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/nhankhau")
public class NhanKhauController {

    private final NhanKhauRepository nhanKhauRepository;
    private final RoomRepository roomRepository;

    @Autowired
    public NhanKhauController(NhanKhauRepository nhanKhauRepository, RoomRepository roomRepository) {
        this.nhanKhauRepository = nhanKhauRepository;
        this.roomRepository = roomRepository;
    }

    @GetMapping
    public String listNhanKhau(Model model) {
        List<NhanKhau> nhanKhaus = nhanKhauRepository.findAll();
        model.addAttribute("nhanKhaus", nhanKhaus);
        return "nhankhau/list";
    }

    @GetMapping("/add")
    public String showAddNhanKhauForm(Model model) {
        model.addAttribute("nhanKhau", new NhanKhau());
        model.addAttribute("rooms", roomRepository.findAll());
        return "nhankhau/add";
    }

    @PostMapping("/add")
    public String addNhanKhau(@ModelAttribute("nhanKhau") NhanKhau nhanKhau) {
        nhanKhauRepository.save(nhanKhau);
        return "redirect:/nhankhau";
    }

    @GetMapping("/edit/{id}")
    public String showEditNhanKhauForm(@PathVariable("id") Long id, Model model) {
        NhanKhau nhanKhau = nhanKhauRepository.findById(id).orElse(null);
        if (nhanKhau != null) {
            model.addAttribute("nhanKhau", nhanKhau);
            model.addAttribute("rooms", roomRepository.findAll());
            return "nhankhau/edit";
        }
        return "redirect:/nhankhau";
    }

    @PostMapping("/edit")
    public String updateNhanKhau(@ModelAttribute("nhanKhau") NhanKhau nhanKhau) {
        nhanKhauRepository.save(nhanKhau);
        return "redirect:/nhankhau";
    }

    @GetMapping("/delete/{id}")
    public String deleteNhanKhau(@PathVariable("id") Long id) {
        nhanKhauRepository.deleteById(id);
        return "redirect:/nhankhau";
    }
}
