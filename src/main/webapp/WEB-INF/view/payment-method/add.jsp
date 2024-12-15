<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>Thêm Phương Thức Thanh Toán</title>
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
      href="${pageContext.request.contextPath}/resources/css/add.css"
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
    <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
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
      <button
        class="logout-btn btn btn-light btn-sm"
        onclick="window.location.href='/login'"
      >
        Đăng xuất
      </button>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
      <a href="${pageContext.request.contextPath}/home"
        ><i class="fas fa-home"></i> Trang chủ</a
      >
      <a href="${pageContext.request.contextPath}/rooms"
        ><i class="fas fa-users"></i> Quản lý hộ khẩu</a
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
      <!--<a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>-->
      <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
    </div>

    <!-- Form Thêm Phương Tiện -->
    <div class="container mt-4">
      <h2 class="text-center">Thêm Phương Thức Thanh Toán</h2>
      <form:form
        method="post"
        action="${pageContext.request.contextPath}/payment-methods/add"
        modelAttribute="paymentMethod"
      >
        <div class="row">
          <div class="mb-3">
            <label for="idThanhToan" class="form-label">Mã thanh toán:</label>
            <form:input
              path="idThanhToan"
              id="idThanhToan"
              class="form-control"
              placeholder="Nhập ID"
            />
            <div class="invalid-feedback">Vui lòng nhập</div>
          </div>

          <div class="col-md-6 mb-3">
            <label for="ten" class="form-label">Tên:</label>
            <form:input
              path="ten"
              id="ten"
              class="form-control"
              type="text"
              placeholder="Tên hình thức thanh toán"
              required="true"
            />
          </div>
          <div class="col-md-6 mb-3">
            <label for="loai" class="form-label">Loại:</label>
            <form:input
              path="loai"
              id="loai"
              class="form-control"
              type="text"
              placeholder=" Loại hình thức thanh toán"
              required="true"
            />
          </div>
        </div>
        <div class="mb-3">
          <label for="noiDung" class="form-label">Nội dung:</label>
          <form:input
            path="noiDung"
            id="noiDung"
            class="form-control"
            type="text"
            placeholder="Nội dung"
            required="true"
          />
        </div>
        <div class="mb-3">
          <label for="trangThai" class="form-label">Trạng thái:</label>
          <form:input
            path="trangThai"
            id="trangThai"
            class="form-control"
            type="text"
            placeholder="Trạng thái"
            required="true"
          />
        </div>

        <!-- Nút hành động -->
        <div class="text-center">
          <button type="submit" class="btn btn-primary">Thêm</button>
          <a
            href="${pageContext.request.contextPath}/payment-methods"
            class="btn btn-secondary"
            >Hủy</a
          >
        </div>
      </form:form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
