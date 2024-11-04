package com.example.back_end.repository;

import com.example.back_end.domain.Room;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface RoomRepository extends CrudRepository<Room, Long> {
    List<Room> findByIdRoom(Long idRoom);
}
