<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <html lang="en">

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>Bluemoon HomePage</title>

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

        <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />

        <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
      </head>

      <body>
        <c:if test="${not empty successMessage}">
          <div id="successAlert" class="alert alert-success mt-3" role="alert">
            ${successMessage}
          </div>
          <script>
            setTimeout(function () {
              var alertElement = document.getElementById("successAlert");
              if (alertElement) {
                alertElement.style.display = "none";
              }
            }, 3000);
          </script>
        </c:if>

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

        <!-- Main content -->
        <div class="container-m">
          <a href="${pageContext.request.contextPath}/nhankhau" class="function">
            <img src="${pageContext.request.contextPath}/resources/images/nhan_khau.webp" alt="Nhan_khau" />
            <p>Quản lý nhân khẩu</p>
          </a>
          <a href="${pageContext.request.contextPath}/rooms" class="function">
            <img src="${pageContext.request.contextPath}/resources/images/ho_khau.webp" alt="Ho_khau" />
            <p>Quản lý hộ khẩu</p>
          </a>

          <a href="${pageContext.request.contextPath}/fees" class="function">
            <img src="${pageContext.request.contextPath}/resources/images/phi.webp" alt="Phi" />
            <p>Quản lý khoản phí</p>
          </a>
          <div class="function">
            <img src="${pageContext.request.contextPath}/resources/images/tai_khoan.jpg" alt="tai_khoan" />
            <p>Quản lý tài khoản cá nhân</p>
          </div>
          <div class="function">
            <img src="${pageContext.request.contextPath}/resources/images/tra_cuu.jpg" alt="tra_cuu" />
            <p>Tra cứu và thống kê</p>
          </div>
        </div>
      </body>

      </html>