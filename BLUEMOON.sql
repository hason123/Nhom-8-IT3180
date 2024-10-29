CREATE DATABASE BLUEMOON
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
-- de nhu the nay de go dc tieng Viet trong mysql

USE BLUEMOON;

CREATE TABLE USERS (
username varchar(50) NOT NULL, 
pass varchar(50) not null, 
primary key (username)
) ;

INSERT INTO users VALUES ('admin', '123456');


CREATE TABLE QLCUDAN ( 
ID_CUDAN  varchar(6) NOT NULL, 
HOTEN varchar(50)  NOT NULL, 
CCCD  varchar(20) NOT NULL,
NGAYSINH date,
DANTOC varchar(25),
NGHENGHIEP varchar(50),
ID_PHONG varchar(4) NOT NULL,
TRANGTHAI varchar(20) NOT NULL,
DIACHI varchar(255) NOT NULL,
CONSTRAINT PK_CUDAN PRIMARY KEY(ID_CUDAN, HOTEN)
-- DIA CHI THUONG TRU
);


CREATE TABLE QLPHONG(
ID_PHONG varchar(4) NOT NULL,
TANG smallint,
DienTich int,
MaChuHo varchar(6),
TenChuHo varchar(50),
PRIMARY KEY (ID_PHONG),
CONSTRAINT FK_PHONG FOREIGN KEY (MaChuHo, TenChuHo) references QLCUDAN(ID_CUDAN, HOTEN)
);

CREATE TABLE KhoanPhi(
ID int not null,
TenPhi varchar(100),
MoTa varchar (255),
ThoiGianThu varchar (100),
primary key (ID)
);

CREATE TABLE ThanhToan(
ID int not null,
Ten varchar(100),
Loai varchar(50),
NoiDung text(2000),
TrangThai varchar(50),
PRIMARY KEY (ID)
);

CREATE TABLE QLHoadon(
ID varchar(100) not null,
TieuDe varchar(255),
SoTien varchar(50) not null,
MaCanHo varchar(4) not null,
KiThanhToan varchar(20),
HanThanhToan date,
NgayThanhToan date,
TrangThai varchar(50),
ID_ThanhToan int,
PRIMARY KEY (ID),
FOREIGN KEY (MaCanHo) references QLPHONG(ID_PHONG),
FOREIGN KEY (ID_ThanhToan) references ThanhToan(ID)
);

CREATE TABLE ChiTietHoaDon(
ID_HoaDon varchar(100) not null,
ID_KhoanPhi int not null,
CONSTRAINT PK_HOADON primary key (ID_HoaDon, ID_KhoanPhi),
FOREIGN KEY (ID_HoaDon) references QLHoadon(ID), -- them on delete cascade vao xoa 2 dong alter o duoi
FOREIGN KEY (ID_KhoanPhi) references KhoanPhi(ID)
);

ALTER TABLE ChiTietHoaDon 
DROP FOREIGN KEY chitiethoadon_ibfk_1;

ALTER TABLE ChiTietHoaDon
ADD FOREIGN KEY(ID_HoaDon)
REFERENCES QLHoadon(ID)
ON DELETE CASCADE;




CREATE TABLE QLXe(
ID varchar(20),
TenXe varchar(100),
LoaiXe varchar(25),
BienKiemSoat varchar(25),
MaChuXe varchar (6),
TenChuXe varchar(50),
PRIMARY KEY (ID),
CONSTRAINT FK_Xe FOREIGN KEY (MaChuXe, TenChuXe) references QLCUDAN(ID_CUDAN, HOTEN)
);






















