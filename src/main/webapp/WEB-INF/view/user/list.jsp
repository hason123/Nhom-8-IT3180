<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>Danh Sách người dùng</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/css/sidebar.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/css/header.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/css/general.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/css/phuongtienList.css"
      rel="stylesheet"
    />
    <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap"
      rel="stylesheet"
    />
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
        <img
          src="${pageContext.request.contextPath}/resources/images/logo.webp"
          alt="Logo"
        />
        <h1>BlueMoon</h1>
      </div>
      <button class="logout-btn" onclick="window.location.href='/login'">
        Đăng xuất
      </button>
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
      ><i class="fas fa-car"></i> Phương thức thanh toán</a
      >
      <a href="${pageContext.request.contextPath}/phuong-tien"
        ><i class="fas fa-car"></i> Quản lý phương tiện</a
      >

      <!-- <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a> -->
      <a href="${pageContext.request.contextPath}/user/list"
      ><i class="fas fa-car"></i> Tài khoản</a
    >
    </div>
    <!-- Main Content -->
    <div class="container-m">
      <h2 class="text-center">Danh sách tài khoản cá nhân</h2>

      <!-- Nút thêm phương tiện -->
      <div class="mb-3 text-end">
        <a
          href="${pageContext.request.contextPath}/user/add"
          class="btn btn-success"
          >Thêm người dùng</a
        >
      </div>

      <!-- Bảng danh sách phương tiện -->
      <table class="table table-striped table-bordered">
        <thead class="table-dark text-center">
          <tr>
            <th>Họ và Tên</th>
            <th>Số Điện Thoại</th>
            <th>Địa Chỉ</th>
            <th>Hành Động</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="user" items="${users}">
            <tr class="text-center align-middle">
              <td>${user.fullName}</td>
              <td>${user.phone}</td>
              <td>${user.address}</td>
              <td>
                <a
                  href="${pageContext.request.contextPath}/user/edit/${user.id}"
                  class="btn btn-warning btn-sm"
                  >Sửa</a
                >
                <a
                  href="${pageContext.request.contextPath}/user/changePassword/${user.id}"
                  class="btn btn-info btn-sm"
                  >Thay Đổi Mật Khẩu</a
                >
                <a
                  href="${pageContext.request.contextPath}/user/delete/${user.id}"
                  class="btn btn-danger btn-sm"
                  onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');"
                  >Xóa</a
                >
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- Hiển thị thông báo nếu danh sách rỗng -->
      <c:if test="${empty users}">
        <div class="alert alert-warning text-center" role="alert">
          Không có người dùng nào tìm thấy.
        </div>
      </c:if>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
