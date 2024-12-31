use TEST;
-- Thêm theo thứ tự

INSERT INTO method (id_thanh_toan,loai,ten,noi_dung,trang_thai)
VALUES
(1,  'Tiền mặt', 'Thanh toán tại quầy lễ tân' ,'Mời quý cư dân tới quầy lễ tân toà nhà để thanh toán theo thông báo hóa đơn trên ứng dụng' ,'Đã áp dụng'),
(2, 'banks-transfer', 'Chuyển khoản ngân hàng', 'Quý cư dân vui lòng chuyển khoản tới tài khoản BQL tòa nhà', 'Đã áp dụng');

INSERT INTO fee (id_phi,ten_phi,mo_ta_phi,thoi_gian_thu) -- phai them ca 4 cai nay
VALUES
(1, 'Phí quản lý chung cư', '15000', '1 đợt/tháng'),
(2, 'Phí dịch vụ chung cư', '8000', '1 đợt/tháng'),
(3, 'Phí phương tiện xe máy' , '70000', '1 đợt/tháng'),
(4, 'Phí phương tiện ô tô' , '1500000' , '1 đợt/tháng');

 -- ko cần thêm cái này
INSERT INTO fee (id_phi,ten_phi,mo_ta_phi,thoi_gian_thu)
VALUES
(5, 'Phí đóng góp từ thiện', 100000, '1 đợt/tháng');


INSERT INTO room (id_room,floor,dientich,so_nguoi)
VALUES
(101,1,50,0),
(102,1,50,0),
(103,1,60,0),
(201,2,70,0),
(202,2,70,0),
(203,2,80,0);



-- ngay la nam - thang - ngay
INSERT INTO nhankhau(id,ho_ten,cccd,ngay_sinh,noi_sinh,nghe_nghiep,phone_number,id_room,trang_thai,dia_chi_thuong_tru)
VALUES
(1, 'Hà Sơn', '0012204011345', '2004-10-5', 'Hà Nội' ,'Sinh viên', '0123456789' , 101, 'Thường trú',  'Chung cư Bluemoon'),
(2, 'Thuận', '000760722071', '2004-8-26', 'Thái Nguyên' ,'Lập trình viên', '0101010101' , 101, 'Thường trú',  'Chung cư Bluemoon'),
(3, 'Kiên Định', '0012404011545', '2004-1-13', 'Hà Tĩnh' ,'Giáo sư', '0101010102' , 102, 'Tạm trú',  'Mixue Bách Khoa'),
(4, 'Hiếu', '006241310646', '2004-8-9', 'Hà Đông' ,'Game thủ', '0101010103' , 102, 'Tạm trú',  'Circle K');


INSERT INTO Phuong_Tien (id_xe,ten_xe,loai_xe,bien_kiem_soat)
VALUES
('Honda Dream', 'Xe máy', '31-874M4'),
('Yamaha Exciter', 'Xe máy', '29-123AB');

INSERT INTO Phuong_Tien (id_xe,ten_xe,loai_xe,bien_kiem_soat, ma_chu_xe, ten_chu_xe, id_room)
VALUES
('Toyota Vios', 'Ô tô', '30-567CD');








ALTER TABLE bill MODIFY COLUMN ma_can_ho VARCHAR(255) NULL;






