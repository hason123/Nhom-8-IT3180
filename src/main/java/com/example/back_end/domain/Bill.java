package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "bill") // Chỉ định tên bảng là "payment"
public class Bill {
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idHoaDon; // ID
    @Column(nullable = false)
    private String tieuDe; // Tiêu đề
    @Column(nullable = false)
    private Double soTien; // Số tiền
    @Column(nullable = false)
    private String maCanHo; // Mã căn hộ

    private String kiThanhToan; // Kì thanh toán

    private String hanThanhToan; // Hạn thanh toán
    @Column
    private String ngayThanhToan; // Ngày thanh toán

    private String trangThai; // Trạng thái

    private int idThanhToan; // ID_Thanh toán

    private int idCacKhoanPhi; // ID_Các khoản phí

    private String loaiThanhToan; // Lưu tên phương thức thanh toán (Tiền mặt, Chuyển khoản, ...)

    // Getter và Setter cho loaiThanhToan
    public String getLoaiThanhToan() {
        return loaiThanhToan;
    }

    public void setLoaiThanhToan(String loaiThanhToan) {
        this.loaiThanhToan = loaiThanhToan;
    }
    public int getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(int idHoaDon) {
        this.idHoaDon = idHoaDon;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public Double getSoTien() {
        return soTien;
    }

    public void setSoTien(Double soTien) {
        this.soTien = soTien;
    }

    public String getMaCanHo() {
        return maCanHo;
    }

    public void setMaCanHo(String maCanHo) {
        this.maCanHo = maCanHo;
    }

    public String getKiThanhToan() {
        return kiThanhToan;
    }

    public void setKiThanhToan(String kiThanhToan) {
        this.kiThanhToan = kiThanhToan;
    }

    public String getHanThanhToan() {
        return hanThanhToan;
    }

    public void setHanThanhToan(String hanThanhToan) {
        this.hanThanhToan = hanThanhToan;
    }

    public String getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(String ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public int getIdThanhToan() {
        return idThanhToan;
    }

    public void setIdThanhToan(int idThanhToan) {
        this.idThanhToan = idThanhToan;
    }

    public int getIdCacKhoanPhi() {
        return idCacKhoanPhi;
    }

    public void setIdCacKhoanPhi(int idCacKhoanPhi) {
        this.idCacKhoanPhi = idCacKhoanPhi;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "idHoaDon=" + idHoaDon +
                ", tieuDe='" + tieuDe + '\'' +
                ", soTien=" + soTien +
                ", maCanHo='" + maCanHo + '\'' +
                ", kiThanhToan='" + kiThanhToan + '\'' +
                ", hanThanhToan='" + hanThanhToan + '\'' +
                ", ngayThanhToan='" + ngayThanhToan + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", idThanhToan=" + idThanhToan +
                ", idCacKhoanPhi=" + idCacKhoanPhi +
                '}';
    }
}
