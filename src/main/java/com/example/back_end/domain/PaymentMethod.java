package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "method") // Chỉ định tên bảng
public class PaymentMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // ID (Mã hình thức thanh toán)

    @Column(nullable = false)
    private String ten; // Tên hình thức thanh toán

    @Column(nullable = false)
    private String loai; // Loại hình thanh toán (ví dụ: Tiền mặt, Chuyển khoản)

    @Column
    private String noiDung; // Nội dung chi tiết (mô tả hình thức thanh toán)

    @Column(nullable = false)
    private String trangThai; // Trạng thái (ví dụ: Hoạt động, Tạm ngừng)

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public String toString() {
        return "HinhThucThanhToan{" +
                "id=" + id +
                ", ten='" + ten + '\'' +
                ", loai='" + loai + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", trangThai='" + trangThai + '\'' +
                '}';
    }
}
