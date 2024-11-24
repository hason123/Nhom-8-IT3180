package com.example.back_end.domain;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "nhankhau")
public class NhanKhau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private Long cccd; // Số căn cước công dân

    @Temporal(TemporalType.DATE)
    private Date ngaySinh;

    @Column(nullable = false)
    private String noiSinh;

    @Column(nullable = false)
    private String danToc;

    @Column(nullable = false)
    private String ngheNghiep;

    @ManyToOne
    @JoinColumn(name = "id_room", referencedColumnName = "idRoom")
    private Room room; // Liên kết với bảng phòng

    @Column(nullable = false)
    private String trangThai; // Ví dụ: "Đang sống", "Đã chuyển đi", v.v.

    @Column(nullable = false)
    private String diaChiThuongTru;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCccd() {
        return cccd;
    }

    public void setCccd(Long cccd) {
        this.cccd = cccd;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getNoiSinh() {
        return noiSinh;
    }

    public void setNoiSinh(String noiSinh) {
        this.noiSinh = noiSinh;
    }

    public String getDanToc() {
        return danToc;
    }

    public void setDanToc(String danToc) {
        this.danToc = danToc;
    }

    public String getNgheNghiep() {
        return ngheNghiep;
    }

    public void setNgheNghiep(String ngheNghiep) {
        this.ngheNghiep = ngheNghiep;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getDiaChiThuongTru() {
        return diaChiThuongTru;
    }

    public void setDiaChiThuongTru(String diaChiThuongTru) {
        this.diaChiThuongTru = diaChiThuongTru;
    }

    @Override
    public String toString() {
        return "NhanKhau{" +
                "id=" + id +
                ", cccd=" + cccd +
                ", ngaySinh=" + ngaySinh +
                ", noiSinh='" + noiSinh + '\'' +
                ", danToc='" + danToc + '\'' +
                ", ngheNghiep='" + ngheNghiep + '\'' +
                ", room=" + room +
                ", trangThai='" + trangThai + '\'' +
                ", diaChiThuongTru='" + diaChiThuongTru + '\'' +
                '}';
    }
}
