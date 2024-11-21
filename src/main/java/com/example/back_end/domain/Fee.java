package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "fee") // Chỉ định tên bảng là "fee"
public class Fee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idPhi; // ID (Mã phí)

    @Column(nullable = false)
    private String tenPhi; // Tên phí

    @Column
    private String moTaPhi; // Mô tả phí

    @Column(nullable = false)
    private String thoiGianThu; // Thời gian thu (dùng kiểu String để dễ định dạng)

    public Long getIdPhi() {
        return idPhi;
    }

    public void setId(Long idPhi) {
        this.idPhi = idPhi;
    }

    public String getTenPhi() {
        return tenPhi;
    }

    public void setTenPhi(String tenPhi) {
        this.tenPhi = tenPhi;
    }

    public String getMoTaPhi() {
        return moTaPhi;
    }

    public void setMoTaPhi(String moTaPhi) {
        this.moTaPhi = moTaPhi;
    }

    public String getThoiGianThu() {
        return thoiGianThu;
    }

    public void setThoiGianThu(String thoiGianThu) {
        this.thoiGianThu = thoiGianThu;
    }

    @Override
    public String toString() {
        return "Fee{" +
                "idPhi=" + idPhi +
                ", tenPhi='" + tenPhi + '\'' +
                ", moTaPhi='" + moTaPhi + '\'' +
                ", thoiGianThu='" + thoiGianThu + '\'' +
                '}';
    }
}
