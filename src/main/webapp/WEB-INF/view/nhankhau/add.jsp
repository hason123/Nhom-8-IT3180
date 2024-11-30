<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <html lang="en">

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>Thêm nhân khẩu</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
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
          <button class="logout-btn btn btn-light btn-sm" onclick="window.location.href='/login'">
            Đăng xuất
          </button>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
          <a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Trang chủ</a>
          <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-users"></i> Quản lý hộ khẩu</a>
          <a href="${pageContext.request.contextPath}/nhankhau"><i class="fas fa-users"></i> Quản lý nhân khẩu</a>
          <a href="#"><i class="fas fa-wallet"></i> Quản lý khoản phí</a>
          <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>
          <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
        </div>

        <!-- Form nhân khẩu mới -->
        <div class="container mt-4">
          <h2 class="text-center">Thêm nhân khẩu mới</h2>
          <form:form method="post" action="${pageContext.request.contextPath}/nhankhau/add" modelAttribute="nhanKhau">
            <!-- ID nhân khẩu -->
            <div class="mb-3">
              <label for="id" class="form-label">ID Nhân Khẩu:</label>
              <form:input path="id" id="id" class="form-control" type="number" min="1" max="999999"
                oninput="if(this.value.length > 6) this.value = this.value.slice(0, 6);" />
            </div>
            <!-- CCCD -->
            <div class="mb-3">
              <label for="cccd" class="form-label">Căn Cước Công Dân:</label>
              <form:input path="cccd" id="cccd" class="form-control" type="number" min="100000000000" max="999999999999"
                oninput="if(this.value.length > 12) this.value = this.value.slice(0, 12);" required="required" />
            </div>

            <!-- Ngày sinh -->
            <div class="mb-3">
              <label for="ngaySinh" class="form-label">Ngày Sinh:</label>
              <form:input path="ngaySinh" id="ngaySinh" class="form-control" type="date" />
              <form:errors path="ngaySinh" cssClass="text-danger" />
            </div>
            <!-- Nơi sinh -->
            <div class="mb-3">
              <label for="noiSinh" class="form-label">Nơi sinh:</label>
              <form:input path="noiSinh" id="noiSinh" class="form-control" type="text" placeholder="Nhập nơi sinh" />
            </div>
            <!-- Dân tộc -->
            <div class="mb-3">
              <label for="danToc" class="form-label">Dân tộc:</label>
              <form:input path="danToc" id="danToc" class="form-control" type="text" placeholder="Nhập dân tộc" />
            </div>
            <div class="mb-3">
              <label for="ngheNghiep" class="form-label">Nghề nghiệp:</label>
              <form:input path="ngheNghiep" id="ngheNghiep" class="form-control" type="text"
                placeholder="Nhập nghề nghiệp" />
            </div>
            <div class="mb-3">
              <label for="roomId" class="form-label">ID Phòng:</label>
              <form:input path="room.idRoom" id="roomId" class="form-control" type="number" min="1" max="999999"
                oninput="if(this.value.length > 6) this.value = this.value.slice(0, 6);" />
            </div>

            <div class="mb-3">
              <label for="trangThai" class="form-label">Trạng thái:</label>
              <form:input path="trangThai" id="trangThai" class="form-control" type="text"
                placeholder="Nhập trạng thái" />
            </div>
            <div class="mb-3">
              <label for="diaChiThuongTru" class="form-label">Địa chỉ thường trú:</label>
              <form:input path="diaChiThuongTru" id="diaChiThuongTru" class="form-control" type="text"
                placeholder="Nhập địa chỉ thường trú" />
            </div>

            <!-- Display error message if exists -->
            <c:if test="${not empty error}">
              <div class="alert alert-danger text-center" role="alert">
                ${error}
              </div>
            </c:if>

            <form:form method="post" action="${pageContext.request.contextPath}/nhankhau/add" modelAttribute="nhanKhau">
              <!-- Submit buttons -->
              <div class="text-center">
                <button type="submit" class="btn btn-primary">Thêm</button>
                <a href="${pageContext.request.contextPath}/nhankhau" class="btn btn-secondary">Hủy</a>
              </div>
            </form:form>
        </div>
        </form:form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>