package com.example.back_end.controller;

import com.example.back_end.domain.NhanKhau;
import com.example.back_end.domain.PhuongTien;
import com.example.back_end.domain.Room;
import com.example.back_end.repository.NhanKhauRepository;
import com.example.back_end.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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
    public String listNhanKhau(
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        List<NhanKhau> nhanKhaus;

        if (keyword != null && !keyword.trim().isEmpty() && !keyword.isEmpty()) {
            switch (searchType) {
                case "hoTen":
                    nhanKhaus = nhanKhauRepository.findByHoTen(keyword.trim());
                    break;
                case "noiSinh":
                    nhanKhaus = nhanKhauRepository.findByNoiSinh(keyword.trim());
                    break;
                case "idRoom":
                    nhanKhaus = nhanKhauRepository.findByidRoom(keyword.trim());
                    break;
                case "trangThai":
                    nhanKhaus = nhanKhauRepository.findByTrangThai(keyword.trim());
                    break;
                case "ngheNghiep":
                    nhanKhaus = nhanKhauRepository.findByDiaChiThuongTru(keyword.trim());
                    break;
                default:
                    nhanKhaus = (List<NhanKhau>) nhanKhauRepository.findAll();
                    break;
            }
        } else {
            nhanKhaus = (List<NhanKhau>) nhanKhauRepository.findAll();
        }

        model.addAttribute("nhanKhaus", nhanKhaus);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalNhanKhaus", nhanKhaus.size());

        return "nhankhau/list"; // Trả về view danh sách nhân khẩu
    }

    @GetMapping("/add")
    public String showAddNhanKhauForm(Model model) {
        // Lấy danh sách các phòng
        model.addAttribute("nhanKhau", new NhanKhau());
        List<Room> rooms = (List<Room>) roomRepository.findAll();
        model.addAttribute("rooms", rooms);

        return "nhankhau/add";
    }

    @PostMapping("/add")
    public String addNhanKhau(@ModelAttribute("nhanKhau") NhanKhau nhanKhau, Model model) {
        // Save the Nhan Khau if validation
        if (nhanKhauRepository.existsById(nhanKhau.getId())) {
            model.addAttribute("error", "ID này đã tồn tại. Vui lòng nhập ID khác.");
            List<Room> rooms = (List<Room>) roomRepository.findAll();
            model.addAttribute("rooms", rooms); // Để hiển thị lại danh sách phòng trong form
            return "nhankhau/add"; // Trả về lại form thêm
        }
        nhanKhauRepository.save(nhanKhau);
        updateSoNguoiInRoom((long) nhanKhau.getIdRoom());
        return "redirect:/nhankhau";
    }

    @GetMapping("/edit/{id}")
    public String showEditNhanKhauForm(@PathVariable("id") Long id, Model model) {
        Optional<NhanKhau> nhanKhau = nhanKhauRepository.findById(id);
        List<Room> rooms = (List<Room>) roomRepository.findAll();
        model.addAttribute("rooms", rooms);
        if (nhanKhau.isPresent()) {
            model.addAttribute("nhanKhau", nhanKhau.get());
            return "nhankhau/edit";
        }
        return "nhankhau/error";
    }

    @PostMapping("/edit")
    public String updateNhanKhau(@ModelAttribute("nhanKhau") NhanKhau nhanKhau, Model model) {
        Optional<NhanKhau> existingNhanKhau = nhanKhauRepository.findById(nhanKhau.getId());
        if (existingNhanKhau.isPresent()) {
            Long oldRoomId = (long) existingNhanKhau.get().getIdRoom(); // Lấy ID phòng cũ
//test
            Optional<Room> newRoom = roomRepository.findById((long) nhanKhau.getIdRoom());
            if (!newRoom.isPresent()) {
                // Nếu phòng không tồn tại, hiển thị thông báo lỗi
                model.addAttribute("error", "Phòng không tồn tại. Vui lòng chọn phòng hợp lệ.");
                List<Room> rooms = (List<Room>) roomRepository.findAll();
                model.addAttribute("rooms", rooms); // Để hiển thị lại danh sách phòng trong form
                model.addAttribute("nhanKhau", nhanKhau);
                return "nhankhau/edit"; // Trả về lại form sửa nhân khẩu
            }
//test
            // Cập nhật thông tin nhân khẩu
            nhanKhauRepository.save(nhanKhau);
            // Cập nhật số lượng nhân khẩu cho phòng cũ
            updateSoNguoiInRoom(oldRoomId);
            // Cập nhật số lượng nhân khẩu cho phòng mới
            updateSoNguoiInRoom((long) nhanKhau.getIdRoom());

            return "redirect:/nhankhau";
        }
        return "nhankhau/error";
    }

    @GetMapping("/delete/{id}")
    public String deleteNhanKhau(@PathVariable("id") Long id, Model model) {
        Optional<NhanKhau> nhanKhau = nhanKhauRepository.findById(id);
        if (nhanKhauRepository.existsById(id)) {
            Long roomId = (long) nhanKhau.get().getIdRoom(); // Lấy ID phòng trước khi xóa
            nhanKhauRepository.deleteById(id); // Xóa nhân khẩu
            updateSoNguoiInRoom(roomId); // Cập nhật số người trong phòn
            return "redirect:/nhankhau";
        } else {
            model.addAttribute("error", "Nhan Khau with ID " + id + " not found.");
            return "nhankhau/error";
        }

    }
    private void updateSoNguoiInRoom(Long roomId) {
        Optional<Room> roomOptional = roomRepository.findById(roomId);
        if (roomOptional.isPresent()) {
            Room room = roomOptional.get();
            int soNguoi = nhanKhauRepository.countByRoomId(roomId); // Đếm số nhân khẩu trong phòng
            room.setSoNguoi(soNguoi); // Cập nhật số lượng người
            roomRepository.save(room); // Lưu lại thông tin phòng
        }
    }
}
