package com.example.back_end.controller;

import com.example.back_end.domain.Room;
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

    @Autowired
    public RoomController(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }
    @GetMapping
    public String listRooms(Model model) {
        List<Room> rooms = (List<Room>) roomRepository.findAll();
        model.addAttribute("rooms", rooms);
        return "room/list";
    }
    @GetMapping("/add")
    public String showAddRoomForm(Model model) {
        model.addAttribute("room", new Room());
        return "room/add";
    }
    @PostMapping("/add")
    public String addRoom(@ModelAttribute("room") Room room) {
        roomRepository.save(room);
        return "redirect:/rooms";
    }
    @GetMapping("/edit/{id}")
    public String showEditRoomForm(@PathVariable("id") Long id, Model model) {
        Optional<Room> room = roomRepository.findById(id);
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
