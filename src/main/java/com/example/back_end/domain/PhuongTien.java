package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "PhuongTien") // Chỉ định tên bảng là "vehicle"
public class PhuongTien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idXe; // ID (Mã xe)


    private String tenXe; // Tên xe

    @Column(nullable = false)
    private String loaiXe; // Loại xe

    @Column(nullable = false, unique = true)
    private String bienKiemSoat; // Biển kiểm soát

    private String tenChuXe; // Tên chủ xe
    private String maChuXe; // Mã chủ xe

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    // Getters and Setters
    public Long getIdXe() {
        return idXe;
    }

    public void setIdXe(Long idXe) {
        this.idXe = idXe;
    }

    public String getTenXe() {
        return tenXe;
    }

    public void setTenXe(String tenXe) {
        this.tenXe = tenXe;
    }

    public String getLoaiXe() {
        return loaiXe;
    }

    public void setLoaiXe(String loaiXe) {
        this.loaiXe = loaiXe;
    }

    public String getBienKiemSoat() {
        return bienKiemSoat;
    }

    public void setBienKiemSoat(String bienKiemSoat) {
        this.bienKiemSoat = bienKiemSoat;
    }

    public String getTenChuXe() {
        return tenChuXe;
    }

    public void setTenChuXe(String tenChuXe) {
        this.tenChuXe = tenChuXe;
    }

    public String getMaChuXe() {
        return maChuXe;
    }

    public void setMaChuXe(String maChuXe) {
        this.maChuXe = maChuXe;
    }
    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }


    @Override
    public String toString() {
        return "Vehicle{" +
                "idXe=" + idXe +
                ", tenXe='" + tenXe + '\'' +
                ", loaiXe='" + loaiXe + '\'' +
                ", bienKiemSoat='" + bienKiemSoat + '\'' +
                ", tenChuXe='" + tenChuXe + '\'' +
                ", maChuXe='" + maChuXe + '\'' +
                '}';
    }
}
