package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "method") // Chỉ định tên bảng
public class PaymentMethod {
    @Id
    private int idThanhToan; // ID (Mã hình thức thanh toán)

    private String ten; // Tên hình thức thanh toán

    private String loai; // Loại hình thanh toán (ví dụ: Tiền mặt, Chuyển khoản)

    private String noiDung; // Nội dung chi tiết (mô tả hình thức thanh toán)

    private String trangThai; // Trạng thái (ví dụ: Hoạt động, Tạm ngừng)

    public int getIdThanhToan() {
        return idThanhToan;
    }

    public void setIdThanhToan(int idThanhToan) {
        this.idThanhToan = idThanhToan;
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
                "idThanhToan=" + idThanhToan +
                ", ten='" + ten + '\'' +
                ", loai='" + loai + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", trangThai='" + trangThai + '\'' +
                '}';
    }
}
