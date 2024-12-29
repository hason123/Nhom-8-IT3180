<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html lang="en">

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>Danh Sách Phòng</title>
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
        <style>
          /* Căn giữa nội dung trong các ô theo chiều dọc và ngang */
          td {
            vertical-align: middle;  /* Căn giữa theo chiều dọc */
            text-align: center;      /* Căn giữa theo chiều ngang */
          }
        </style>
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
      <a href="${pageContext.request.contextPath}/home"
        ><i class="fas fa-home"></i> Trang chủ</a
      >

      <a href="${pageContext.request.contextPath}/rooms"
        ><i class="fas fa-users"></i> Quản lý phòng</a
      >
      <a href="${pageContext.request.contextPath}/nhankhau"
        ><i class="fas fa-users"></i> Quản lý nhân khẩu</a
      >
      <a href="${pageContext.request.contextPath}/bills"
        ><i class="fas fa-wallet"></i> Quản lý hóa đơn</a
      >
      <a href="${pageContext.request.contextPath}/fees"
      ><i class="fas fa-wallet"></i> Quản lý khoản phí</a
      >
      <a href="${pageContext.request.contextPath}/payment-methods"
      ><i class="fas fa-wallet"></i> Phương thức thanh toán</a
      >
      <a href="${pageContext.request.contextPath}/phuong-tien"
        ><i class="fas fa-car"></i> Quản lý phương tiện</a
      >

      <!-- <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a> -->
      <a href="${pageContext.request.contextPath}/user/list"
      ><i class="fas fa-user-circle"></i> Tài khoản</a
    >
    </div>
        <div class="container-m">
          <h2 class="text-center">Danh Sách Phòng</h2>

          <div class="d-flex justify-content-between align-items-center mb-4">
            <p style="font-size: 1.4rem;"><strong>Tổng số phòng:</strong> ${totalRooms}</p>
            <a href="${pageContext.request.contextPath}/rooms/add" class="btn btn-success">Thêm phòng</a>
          </div>



          <div class="mb-4">
            <form method="get" action="${pageContext.request.contextPath}/rooms" class="d-flex align-items-center">
              <input type="text" name="keyword" value="${keyword}" class="form-control me-2" placeholder="Tìm kiếm">
              <select name="searchType" class="form-select me-2">
                <option value="idRoom" ${searchType == 'idRoom' ? 'selected' : ''}>ID Phòng</option>
                <option value="floor" ${searchType == 'floor' ? 'selected' : ''}>Tầng</option>
                <option value="hostId" ${searchType == 'hostId' ? 'selected' : ''}>ID Chủ nhà</option>
                <option value="hostName" ${searchType == 'hostName' ? 'selected' : ''}>Tên chủ nhà</option>
                <option value="phoneNumber" ${searchType == 'phoneNumber' ? 'selected' : ''}>Số điện thoại</option>
              </select>


            </form>
          </div>


          <!-- Bảng danh sách phòng -->
          <table class="table table-striped table-bordered">
            <thead class="table-dark text-center">
              <tr>
                <th class="">Mã phòng</th>
                <th>Tầng</th>
                <th>Diện Tích (m²)</th>
                <th>Số người</th>
                <th>ID Chủ Nhà</th>
                <th>Tên Chủ Nhà</th>
                <th>Số Điện Thoại</th>
                <th>Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="room" items="${rooms}">
                <tr class="text-center">
                  <!-- Định dạng lại idRoom để luôn có 4 chữ số -->
                  <td style="color: rgb(0, 181, 181)">
                    <fmt:formatNumber value="${room.idRoom}" pattern="0000" />
                  </td>
                  <td>${room.floor}</td>
                  <td>${room.dientich}</td>
                  <td>${room.soNguoi}</td>
                  <td>${room.hostId}</td>
                  <td style="color: rgb(0, 181, 181)">${room.hostName}</td>
                  <td>${room.phoneNumber}</td>
                  <td>
                    <a href="${pageContext.request.contextPath}/rooms/edit/${room.idRoom}"
                      class="btn btn-warning btn-sm">Sửa</a>
                    <a href="${pageContext.request.contextPath}/rooms/delete/${room.idRoom}"
                      class="btn btn-danger btn-sm"
                      onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này?');">Xóa</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>

          <!-- Hiển thị thông báo nếu danh sách rỗng -->
          <c:if test="${empty rooms}">
            <div class="alert alert-warning text-center" role="alert">
              Không có phòng nào được tìm thấy.
            </div>
          </c:if>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>
