package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "room") // Chỉ định tên bảng nếu khác với tên lớp
public class Room {
    @Id

    private Long idRoom;

    @Column(nullable = false)
    private int floor;  // Tầng của phòng

    @Column(nullable = false)
    private double dientich;

    private int soNguoi;

    private Long hostId;

    private String hostName;

    private String phoneNumber;

    public Long getIdRoom() {
        return idRoom;
    }
    public void setIdRoom(Long idRoom) {
        this.idRoom = idRoom;
    }
    public int getFloor() {
        return floor;
    }
    public int getSoNguoi() {return soNguoi;};

    public void setSoNguoi(int soNguoi) {
        this.soNguoi = soNguoi;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }
    public double getDientich() {
        return dientich;
    }
    public void setDientich(double dientich) {
        this.dientich = dientich;
    }
    public Long getHostId() {
        return hostId;
    }
    public void setHostId(Long hostId) {
        this.hostId = hostId;
    }
    public String getHostName() {
        return hostName;
    }
    public void setHostName(String hostName) {
        this.hostName = hostName;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    @Override
    public String toString() {
        return "Room{" +
                "idRoom=" + idRoom + // Đảm bảo idRoom được in ra
                ", floor=" + floor +
                ", dientich=" + dientich +
                ", soNguoi=" + soNguoi +
                ", hostId=" + hostId +
                ", hostName='" + hostName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
