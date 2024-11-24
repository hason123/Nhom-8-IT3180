<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <html lang="en">

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="UTF-8">
            <title>Chỉnh Sửa Phòng</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet">
            <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        </head>

        <body>

            <!-- Header -->
            <div class="header">
                <div style="display: flex; align-items: center;">
                    <button class="menu-btn" onclick="toggleSidebar()">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Logo">
                    <h1>BlueMoon</h1>
                </div>
                <button class="logout-btn btn btn-light btn-sm" onclick="window.location.href='/login'">Đăng
                    xuất</button>
            </div>

            <!-- Sidebar -->
            <div class="sidebar">
                <a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Trang chủ</a>
                <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-users"></i> Quản lý hộ khẩu</a>
                <a href="#"><i class="fas fa-user-friends"></i> Quản lý nhân khẩu</a>
                <a href="#"><i class="fas fa-wallet"></i> Quản lý khoản phí</a>
                <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>
                <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
            </div>

            <!-- Form Chỉnh Sửa Phòng -->
            <div class="container mt-4">
                <h2 class="text-center">Chỉnh Sửa Phòng</h2>
                <form:form method="post" action="${pageContext.request.contextPath}/rooms/edit" modelAttribute="room">
                    <!-- ID của phòng (ẩn) -->
                    <form:hidden path="idRoom" />

                    <div class="row">
                        <!-- Tầng -->
                        <div class="col-md-6 mb-3">
                            <label for="floor" class="form-label">Tầng:</label>
                            <form:input path="floor" id="floor" class="form-control" type="number"
                                placeholder="Nhập tầng" required="true" maxlength="2" />
                        </div>
                        <!-- Diện tích -->
                        <div class="col-md-6 mb-3">
                            <label for="dientich" class="form-label">Diện tích (m²):</label>
                            <form:input path="dientich" id="dientich" class="form-control" type="number" step="0.01"
                                placeholder="Nhập diện tích" required="true" maxlength="5" />
                        </div>
                    </div>

                    <!-- ID chủ nhà -->
                    <div class="mb-3">
                        <label for="hostId" class="form-label">ID Chủ Nhà:</label>
                        <form:input path="hostId" id="hostId" class="form-control" type="number"
                            placeholder="Nhập ID chủ nhà" maxlength="6" />
                    </div>
                    <!-- Tên chủ nhà -->
                    <div class="mb-3">
                        <label for="hostName" class="form-label">Tên Chủ Nhà:</label>
                        <form:input path="hostName" id="hostName" class="form-control" type="text"
                            placeholder="Nhập tên chủ nhà" />
                    </div>
                    <!-- Số điện thoại -->
                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label">Số Điện Thoại:</label>
                        <form:input path="phoneNumber" id="phoneNumber" class="form-control" type="text"
                            placeholder="Nhập số điện thoại" />
                    </div>

                    <!-- Nút hành động -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        <a href="${pageContext.request.contextPath}/rooms" class="btn btn-secondary">Hủy</a>
                    </div>
                </form:form>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>