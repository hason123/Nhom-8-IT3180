use TEST;
INSERT INTO Phuong_Tien (ten_xe,loai_xe,bien_kiem_soat)
VALUES
('Honda Dream', 'Xe máy', '31-874M4'),
('Yamaha Exciter', 'Xe máy', '29-123AB'),
('Toyota Vios', 'Ô tô', '30-567CD');

INSERT INTO method (id_thanh_toan,loai,ten,noi_dung,trang_thai)
VALUES
(1,  'Tiền mặt', 'Thanh toán tại quầy lễ tân' ,'Mời quý cư dân tới quầy lễ tân toà nhà để thanh toán theo thông báo hóa đơn trên ứng dụng' ,'Đã áp dụng'),
(2, 'banks-transfer', 'Chuyển khoản ngân hàng', 'Quý cư dân vui lòng chuyển khoản tới tài khoản BQL tòa nhà', 'Đã áp dụng');

INSERT INTO fee (id_phi,ten_phi,mo_ta_phi,thoi_gian_thu)
VALUES
(1, 'Phí dịch vụ chung cư', '15000', '1 đợt/tháng'),
(2, 'Phí quản lý chung cư', '8000', '1 đợt/tháng'),
(3, 'Phí phương tiện xe máy' , '70000', '1 đợt/tháng'),
(4, 'Phí phương tiện ô tô' , '1500000' , '1 đợt/tháng');

INSERT INTO room (id_room,floor,dientich,so_nguoi)
VALUES
(103, 1, 70, 1),
(1023, 10, 50, 1),
(502, 4, 50, 2);

-- ko them duoc kieu nay, se gay loi
INSERT INTO nhankhau(ho_ten,cccd,ngay_sinh,noi_sinh,dan_toc,nghe_nghiep,id_room,trang_thai,dia_chi_thuong_tru)
VALUES
('Hà Sơn', '0012204011345', '2004-10-5', 'Hà Nội' ,'Kinh', 'Sinh viên' , 0123, 'Thường trú', 'Chung cư Bluemoon');









