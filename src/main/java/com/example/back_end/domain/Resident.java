package com.example.back_end.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "resident") // Chỉ định tên bảng
public class Resident {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idHoKhau; // Mã hộ khẩu (ID)


    private String fullName; // Họ tên

    @Column(nullable = false, unique = true)
    private String cccd; // CCCD (Căn cước công dân)


    private String birthDate; // Ngày sinh (Dùng kiểu String để giữ định dạng ngày)


    private String birthPlace; // Nơi sinh


    private String dantoc; // Dân tộc

    private String occupation; // Nghề nghiệp

    @Column(nullable = false)
    private String roomId; // Phòng (ID_Tên căn hộ)


    private String status; // Trạng thái


    private String permanentAddress; // Địa chỉ thường trú

    public Long getIdHoKhau() {
        return idHoKhau;
    }

    public void setIdHoKhau(Long idHoKhau) {
        this.idHoKhau = idHoKhau;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getBirthPlace() {
        return birthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }

    public String getDantoc() {
        return dantoc;
    }

    public void setDantoc(String dantoc) {
        this.dantoc = dantoc;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    @Override
    public String toString() {
        return "Resident{" +
                "IdHoKhau=" + idHoKhau +
                ", fullName='" + fullName + '\'' +
                ", cccd='" + cccd + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", birthPlace='" + birthPlace + '\'' +
                ", dantoc='" + dantoc + '\'' +
                ", occupation='" + occupation + '\'' +
                ", roomId='" + roomId + '\'' +
                ", status='" + status + '\'' +
                ", permanentAddress='" + permanentAddress + '\'' +
                '}';
    }
}
