<%@ page import="com.example.back_end.domain.NhanKhau" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <html lang="en">

      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="UTF-8" />
        <title>Thêm Phòng</title>
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


        <script>
          const nhanKhaus = [
            <c:forEach var="nhanKhau" items="${nhanKhaus}">
            {
              id: "${nhanKhau.id}",
              hoTen: "${nhanKhau.hoTen}",
              phoneNumber: "${nhanKhau.phoneNumber}"
            },
            </c:forEach>
          ];
        </script>



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
          <!--<a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>-->
          <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
        </div>

        <!-- Form Thêm Phòng -->
        <div class="container mt-4">
          <h2 class="text-center">Thêm Phòng Mới</h2>
          <form:form method="post" action="${pageContext.request.contextPath}/rooms/add" modelAttribute="room">
            <div class="row">

              <div class="mb-3">
                <label for="idRoom" class="form-label">ID Phòng:</label>
                <form:input path="idRoom" id="idRoom" class="form-control" type="number" min="1" max="9999"
                            placeholder="Nhập ID Phòng" required="true"
                            oninput="if(this.value.length > 4) this.value = this.value.slice(0, 4);" />
              </div>

              <!-- Tầng -->
              <div class="col-md-6 mb-3">
                <label for="floor" class="form-label">Tầng:</label>
                <form:input path="floor" id="floor" class="form-control" type="number" min="0" max="99"
                  placeholder="Tầng (tối đa 2 chữ số)" required="true"
                  oninput="if(this.value.length > 2) this.value = this.value.slice(0, 2);" />
              </div>
              <!-- Diện tích -->
              <div class="col-md-6 mb-3">
                <label for="dientich" class="form-label">Diện tích (m²):</label>
                <form:input path="dientich" id="dientich" class="form-control" type="number" min="1" max="99999"
                  placeholder="Diện tích (tối đa 5 chữ số)" required="true"
                  oninput="if(this.value.length > 5) this.value = this.value.slice(0, 5);" />
              </div>
            </div>
          <div class="row">


            <!-- ID chủ nhà -->
            <div class="col-md-6 mb-3">
              <label for="hostId" class="form-label">ID Chủ Nhà:</label>
              <select id="hostId" name="hostId" class="form-control" onchange="fillNhanKhauInfo()">
                <option value="">Chọn chủ nhà</option>
                <!-- Lặp qua danh sách nhân khẩu và tạo các option -->
                <c:forEach var="nhanKhau" items="${nhanKhaus}">
                  <option value="${nhanKhau.id}">${nhanKhau.id}</option>
                </c:forEach>
              </select>
            </div>

            <!-- Số người -->
            <div class=" col-md-6 mb-3">
              <label for="soNguoi" class="form-label">Số người:</label>
              <form:input path="soNguoi" id="soNguoi" class="form-control" type="number" min="0" max="999999"
                          oninput="if(this.value.length > 6) this.value = this.value.slice(0, 6);" />
            </div>
          </div>

            <!-- Tên chủ nhà -->
            <div class="mb-3">
              <label for="hostName" class="form-label">Tên Chủ Nhà:</label>
              <form:input path="hostName" id="hostName" class="form-control" list="hostNameList" placeholder="Nhập tên chủ nhà" onchange="fillNhanKhauInfoByName()"/>
              <datalist id="hostNameList">
                <c:forEach var="nhanKhau" items="${nhanKhaus}">
                  <option value="${nhanKhau.hoTen}">${nhanKhau.hoTen}</option>
                </c:forEach>
              </datalist>
            </div>

            <!-- Số điện thoại -->
            <div class="mb-3">
              <label for="phoneNumber" class="form-label">Số Điện Thoại:</label>
              <form:input path="phoneNumber" id="phoneNumber" class="form-control" type="text"
                placeholder="Nhập số điện thoại" />
            </div>
            <!-- Nút hành động -->
            <div class="text-center">
              <button type="submit" class="btn btn-primary">Thêm</button>
              <a href="${pageContext.request.contextPath}/rooms" class="btn btn-secondary">Hủy</a>
            </div>
          </form:form>
        </div>

        <!-- Bootstrap JS -->
        <script>
          function fillNhanKhauInfo() {
            const hostIdInput = document.getElementById('hostId');
            const hostNameInput = document.getElementById('hostName');
            const phoneNumberInput = document.getElementById('phoneNumber');

            const hostId = hostIdInput.value.trim();

            // Tìm nhân khẩu theo ID
            const nhanKhau = nhanKhaus.find(nk => nk.id === hostId);

            if (nhanKhau) {
              // Nếu tìm thấy nhân khẩu, tự động điền thông tin
              hostNameInput.value = nhanKhau.hoTen;
              phoneNumberInput.value = nhanKhau.phoneNumber;
            } else {
              // Nếu không tìm thấy nhân khẩu, làm trống các trường thông tin
              hostNameInput.value = '';
              phoneNumberInput.value = '';
            }
          }
          function fillNhanKhauInfoByName() {
            const hostIdInput = document.getElementById('hostId');
            const hostNameInput = document.getElementById('hostName');
            const phoneNumberInput = document.getElementById('phoneNumber');

            const hostName = hostNameInput.value.trim().toLowerCase();

            // Tìm nhân khẩu theo tên
            const nhanKhau = nhanKhaus.find(nk => nk.hoTen.toLowerCase() === hostName);

            if (nhanKhau) {
              // Nếu tìm thấy nhân khẩu, tự động điền thông tin
              hostIdInput.value = nhanKhau.id;
              phoneNumberInput.value = nhanKhau.phoneNumber;
            } else {
              // Nếu không tìm thấy nhân khẩu, làm trống các trường thông tin
              hostIdInput.value = '';
              phoneNumberInput.value = '';
            }
          }
          // Gắn sự kiện khi người dùng thay đổi ID chủ nhà
          document.getElementById('hostId').addEventListener('change', fillNhanKhauInfo);
          document.getElementById('hostName').addEventListener('input', fillNhanKhauInfoByName);


        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
      </body>

      </html>