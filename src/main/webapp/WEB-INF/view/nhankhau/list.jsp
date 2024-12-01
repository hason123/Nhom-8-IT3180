<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <html lang="en">

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>Danh sách nhân khẩu</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/roomList.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet" />
      </head>

      <body>
        <!-- Header -->
        <div class="header">
          <div style="display: flex; align-items: center">
            <button class="menu-btn" onclick="toggleSidebar()">
              <span></span>
              <span></span>
              <span></span>
            </button>
            <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Logo" />
            <h1>BlueMoon</h1>
          </div>
          <button class="logout-btn" onclick="window.location.href='/login'">
            Đăng xuất
          </button>
          <!-- Nút Đăng xuất -->
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
          <a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Trang chủ</a>

          <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-users"></i> Quản lý hộ khẩu</a>
          <a href="${pageContext.request.contextPath}/nhankhau"><i class="fas fa-users"></i> Quản lý nhân khẩu</a>
          <a href="${pageContext.request.contextPath}/fees"><i class="fas fa-wallet"></i> Quản lý khoản phí</a>
          <a href="${pageContext.request.contextPath}/bills"><i class="fas fa-wallet"></i> Quản lý hóa đơn</a>
          <a href="${pageContext.request.contextPath}/phuong-tien"><i class="fas fa-car"></i> Quản lý phương
            tiện</a>
          <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>
          <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
        </div>

        <div class="container-m">
          <h2 class="text-center">Danh sách nhân khẩu</h2>

          <!-- Nút thêm nhân khẩu -->
          <div class="mb-3 text-end">
            <a href="${pageContext.request.contextPath}/nhankhau/add" class="btn btn-success">Thêm nhân khẩu</a>
          </div>

          <!-- Bảng danh sách nhân khẩu -->
          <table class="table table-striped table-bordered">
            <thead class="table-dark text-center">
              <tr>
                <th class="">Mã nhân khẩu</th>
                <th>Họ tên</th>
                <th>CCCD</th>
                <th>Ngày sinh</th>
                <th>Nơi sinh</th>
                <th>Dân tộc</th>
                <th>Nghề nghiệp</th>
                <th>ID Phòng</th>
                <th>Trạng thái</th>
                <th>Địa chỉ thường trú</th>
                <th>Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="nk" items="${nhanKhaus}">
                <tr class="text-center">
                  <td style="color: rgb(0, 181, 181)">${nk.id}</td>
                  <td>${nk.hoTen}</td>
                  <td>${nk.cccd}</td>
                  <td>${nk.ngaySinh}</td>
                  <td>${nk.noiSinh}</td>
                  <td>${nk.danToc}</td>
                  <td>${nk.ngheNghiep}</td>
                  <td>${nk.room.idRoom}</td>
                  <td>${nk.trangThai}</td>
                  <td>${nk.diaChiThuongTru}</td>
                  <td>
                    <a href="${pageContext.request.contextPath}/nhankhau/edit/${nk.id}"
                      class="btn btn-warning btn-sm">Sửa</a>
                    <a href="${pageContext.request.contextPath}/nhankhau/delete/${nk.id}" class="btn btn-danger btn-sm"
                      onclick="return confirm('Bạn có chắc chắn muốn xóa nhân khẩu này chứ?');">Xóa</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>

          <!-- Hiển thị thông báo nếu không có nhân khẩu nào -->
          <c:if test="${empty nhanKhaus}">
            <div class="alert alert-warning text-center" role="alert">
              Không có nhân khẩu nào tìm thấy.
            </div>
          </c:if>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>