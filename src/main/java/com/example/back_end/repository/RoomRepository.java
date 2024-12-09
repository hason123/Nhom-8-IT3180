package com.example.back_end.repository;

import com.example.back_end.domain.Room;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomRepository extends CrudRepository<Room, Long> {

    // Tìm kiếm theo idRoom
    List<Room> findByIdRoom(Long idRoom);

    // Tìm kiếm theo floor
    List<Room> findByFloor(int floor);

    // Tìm kiếm theo hostId
    List<Room> findByHostId(Long hostId);

    // Tìm kiếm theo hostName
    List<Room> findByHostName(String hostName);

    // Tìm kiếm theo phoneNumber
    List<Room> findByPhoneNumber(String phoneNumber);

}
