package com.example.back_end.repository;

import com.example.back_end.domain.Room;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomRepository extends CrudRepository<Room, Long> {

    // Tìm kiếm theo idRoom
    @Query("SELECT r FROM Room r WHERE CAST(r.idRoom AS string) LIKE %:keyword%")
    List<Room> findByIdRoom(@Param("keyword") String keyword);

    // Tìm kiếm theo floor
    @Query("SELECT r FROM Room r WHERE CAST(r.floor AS string) LIKE %:keyword%")
    List<Room> findByFloor(@Param("keyword") String keyword);

    // Tìm kiếm theo hostId
    @Query("SELECT r FROM Room r WHERE CAST(r.hostId AS string) LIKE %:keyword%")
    List<Room> findByHostId(@Param("keyword") String keyword);

    // Tìm kiếm theo hostName
    @Query("SELECT r FROM Room r WHERE LOWER(r.hostName) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Room> findByHostName(@Param("keyword") String keyword);

    // Tìm kiếm theo phoneNumber
    @Query("SELECT r FROM Room r WHERE r.phoneNumber LIKE %:keyword%")
    List<Room> findByPhoneNumber(@Param("keyword") String keyword);
}
