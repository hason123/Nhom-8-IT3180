package com.example.back_end.controller;

import com.example.back_end.domain.NhanKhau;
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
@RequestMapping("/rooms")
public class RoomController {

    private final RoomRepository roomRepository;
    private final NhanKhauRepository nhanKhauRepository;

    @Autowired
    public RoomController(RoomRepository roomRepository, NhanKhauRepository nhanKhauRepository) {
        this.roomRepository = roomRepository;
        this.nhanKhauRepository = nhanKhauRepository;
    }

    @GetMapping
    public String listRooms(
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        List<Room> rooms;

        if (keyword != null && !keyword.trim().isEmpty()&& !keyword.isEmpty()) {
            switch (searchType) {
                case "idRoom":
                    rooms = roomRepository.findByIdRoom(keyword.trim());
                    break;
                case "floor":
                    rooms = roomRepository.findByFloor(keyword.trim());
                    break;
                case "hostId":
                    rooms = roomRepository.findByHostId(keyword.trim());
                    break;
                case "hostName":
                    rooms = roomRepository.findByHostName(keyword.trim());
                    break;
                case "phoneNumber":
                    rooms = roomRepository.findByPhoneNumber(keyword.trim());
                    break;
                default:
                    rooms = (List<Room>) roomRepository.findAll();
                    break;
            }
        } else {
            rooms = (List<Room>) roomRepository.findAll();
        }

        model.addAttribute("rooms", rooms);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalRooms", rooms.size());
        return "room/list";
    }

    @GetMapping("/add")
    public String showAddRoomForm(Model model) {
        model.addAttribute("room", new Room());
        List<NhanKhau> nhanKhaus = nhanKhauRepository.findAll(); // Lấy danh sách nhân khẩu
        model.addAttribute("nhanKhaus", nhanKhaus);
        return "room/add";
    }

    @PostMapping("/add")
    public String addRoom(@ModelAttribute("room") Room room, Model model) {
        if (roomRepository.existsById(room.getIdRoom())) {
            model.addAttribute("error", "Mã phòng đã tồn tại. Vui lòng nhập mã khác.");
            List<NhanKhau> nhanKhaus = nhanKhauRepository.findAll(); // Lấy danh sách nhân khẩu
            model.addAttribute("nhanKhaus", nhanKhaus);
            return "room/add"; // Trả về lại form thêm
        }
        roomRepository.save(room);
        return "redirect:/rooms";
    }
    @GetMapping("/edit/{id}")
    public String showEditRoomForm(@PathVariable("id") Long id, Model model) {
        Optional<Room> room = roomRepository.findById(id);
        List<NhanKhau> nhanKhaus = nhanKhauRepository.findAll(); // Lấy danh sách nhân khẩu
        model.addAttribute("nhanKhaus", nhanKhaus);
        if (room.isPresent()) {
            model.addAttribute("room", room.get());
            return "room/edit"; // Tên của view hiển thị form cập nhật phòng
        }

        return "redirect:/rooms";
    }

    @PostMapping("/edit")
    public String updateRoom(@ModelAttribute("room") Room room) {
        roomRepository.save(room);
        return "redirect:/rooms";
    }
    @GetMapping("/delete/{id}")
    public String deleteRoom(@PathVariable("id") Long id) {
        roomRepository.deleteById(id);
        return "redirect:/rooms";
    }
}
