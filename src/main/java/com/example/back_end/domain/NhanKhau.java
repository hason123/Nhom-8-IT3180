package com.example.back_end.domain;

import jakarta.persistence.*;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "nhankhau")
public class NhanKhau {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String hoTen;

    @Column(nullable = false, unique = true)
    private String cccd;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngaySinh;

    @Column(nullable = false)
    private String noiSinh;

    @Column(nullable = false)
    private String ngheNghiep;

    @Column(nullable = false)
    private String phoneNumber;

    private int idRoom;

    @Column(nullable = false)
    private String trangThai;

    @Column(nullable = false)
    private String diaChiThuongTru;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    //@ManyToOne
    //@JoinColumn(name = "nk.room")
    //public Room room;

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
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

    public String getngheNghiep() {
        return ngheNghiep;
    }

    public void setngheNghiep(String ngheNghiep) {
        this.ngheNghiep = ngheNghiep;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber (String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(int idRoom) {
        this.idRoom = idRoom;
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
                ", hoTen='" + hoTen + '\'' +
                ", cccd=" + cccd +
                ", ngaySinh=" + ngaySinh +
                ", noiSinh='" + noiSinh + '\'' +
                ", ngheNghiep='" + ngheNghiep + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", idRoom=" + idRoom +
                ", trangThai='" + trangThai + '\'' +
                ", diaChiThuongTru='" + diaChiThuongTru + '\'' +
                '}';
    }
}
