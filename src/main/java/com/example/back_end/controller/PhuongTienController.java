package com.example.back_end.controller;

import com.example.back_end.domain.PhuongTien;
import com.example.back_end.domain.Room;
import com.example.back_end.repository.PhuongTienRepository;
import com.example.back_end.repository.RoomRepository;
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
    private final RoomRepository roomRepository;

    @Autowired
    public PhuongTienController(PhuongTienRepository phuongTienRepository, RoomRepository roomRepository) {
        this.phuongTienRepository = phuongTienRepository;
        this.roomRepository = roomRepository;
    }

    // Hiển thị danh sách phương tiện
    @GetMapping
    public String listPhuongTien(
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        List<PhuongTien> phuongTiens;

        if (keyword != null && !keyword.isEmpty()) {
            switch (searchType) {
                case "loaiXe":
                    phuongTiens = phuongTienRepository.findByLoaiXe(keyword);
                    break;
                case "tenXe":
                    phuongTiens = phuongTienRepository.findByTenXe(keyword);
                    break;
                case "bienKiemSoat":
                    phuongTiens = phuongTienRepository.findByBienKiemSoat(keyword);
                    break;
                case "tenChuXe":
                    phuongTiens = phuongTienRepository.findByTenChuXe(keyword);
                    break;
                case "maChuXe":
                    phuongTiens = phuongTienRepository.findByMaChuXe(keyword);
                    break;
                default:
                    phuongTiens = (List<PhuongTien>) phuongTienRepository.findAll();
                    break;
            }
        } else {
            phuongTiens = (List<PhuongTien>) phuongTienRepository.findAll();
        }

        model.addAttribute("phuongTiens", phuongTiens);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalPhuongTiens", phuongTiens.size());
        return "phuongtien/list"; // Trả về view hiển thị danh sách phương tiện
    }


    // Hiển thị form thêm phương tiện
    @GetMapping("/add")
    public String showAddPhuongTienForm(Model model) {
        model.addAttribute("phuongTien", new PhuongTien());
        List<Room> rooms = (List<Room>) roomRepository.findAll(); // Lấy danh sách phòng từ cơ sở dữ liệu
        model.addAttribute("rooms", rooms);
        return "phuongtien/add"; // Tên của view hiển thị form thêm
    }

    // Xử lý thêm phương tiện mới
    @PostMapping("/add")
    public String addPhuongTien(@ModelAttribute("phuongTien") PhuongTien phuongTien) {
        phuongTienRepository.save(phuongTien);
        Room room= phuongTien.getRoom();
        room.getPhuongTien().add(phuongTien);
        //roomRepository.save(room);
        return "redirect:/phuong-tien";
    }

    // Hiển thị form chỉnh sửa phương tiện
    @GetMapping("/edit/{id}")
    public String showEditPhuongTienForm(@PathVariable("id") Long id, Model model) {
        Optional<PhuongTien> phuongTien = phuongTienRepository.findById(id);
        List<Room> rooms = (List<Room>) roomRepository.findAll(); // Lấy danh sách phòng từ cơ sở dữ liệu
        model.addAttribute("rooms", rooms);
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
