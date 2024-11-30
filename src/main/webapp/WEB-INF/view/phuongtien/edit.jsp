<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <meta charset="UTF-8" />
                <title>Chỉnh Sửa Phương Tiện</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
                <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
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
                    <button class="logout-btn btn btn-light btn-sm" onclick="window.location.href='/login'">Đăng
                        xuất</button>
                </div>

                <!-- Sidebar -->
                <div class="sidebar">
                    <a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Trang chủ</a>

                    <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-users"></i> Quản lý hộ khẩu</a>
                    <a href="${pageContext.request.contextPath}/nhankhau"><i class="fas fa-users"></i> Quản lý nhân
                        khẩu</a>
                    <a href="${pageContext.request.contextPath}/fees"><i class="fas fa-wallet"></i> Quản lý khoản
                        phí</a>
                    <a href="${pageContext.request.contextPath}/bills"><i class="fas fa-wallet"></i> Quản lý hóa đơn</a>
                    <a href="${pageContext.request.contextPath}/phuong-tien"><i class="fas fa-car"></i> Quản lý phương
                        tiện</a>
                    <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>
                    <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
                </div>

                <!-- Form Chỉnh Sửa Phương Tiện -->
                <div class="container mt-4">
                    <h2 class="text-center">Chỉnh Sửa Phương Tiện</h2>
                    <form:form method="post" action="${pageContext.request.contextPath}/phuong-tien/edit"
                        modelAttribute="phuongTien">
                        <!-- ID Xe (ẩn) -->
                        <form:hidden path="idXe" />

                        <div class="row">
                            <!-- Tên xe -->
                            <div class="mb-3">
                                <label for="tenXe" class="form-label">Tên Xe:</label>
                                <form:input path="tenXe" id="tenXe" class="form-control" type="text"
                                    placeholder="Nhập tên xe" required="true" />
                            </div>

                            <!-- Loại phương tiện -->
                            <div class="col-md-6 mb-3">
                                <label for="loaiXe" class="form-label">Loại phương tiện:</label>
                                <form:input path="loaiXe" id="loaiXe" class="form-control" type="text"
                                    placeholder="Nhập loại phương tiện" required="true" />
                            </div>
                            <!-- Biển kiểm soát -->
                            <div class="col-md-6 mb-3">
                                <label for="bienKiemSoat" class="form-label">Biển kiểm soát:</label>
                                <form:input path="bienKiemSoat" id="bienKiemSoat" class="form-control" type="text"
                                    placeholder="Nhập biển kiểm soát" required="true" />
                            </div>
                        </div>

                        <!-- Tên chủ xe -->
                        <div class="mb-3">
                            <label for="tenChuXe" class="form-label">Tên chủ xe:</label>
                            <form:input path="tenChuXe" id="tenChuXe" class="form-control" type="text"
                                placeholder="Nhập tên chủ xe" required="true" />
                        </div>

                        <!-- Mã chủ xe -->
                        <div class="mb-3">
                            <label for="maChuXe" class="form-label">Mã chủ xe:</label>
                            <form:input path="maChuXe" id="maChuXe" class="form-control" type="number" min="1"
                                max="999999" placeholder="Nhập mã chủ xe" required="true"
                                oninput="if(this.value.length > 6) this.value = this.value.slice(0, 6);" />
                        </div>

                        <!-- Nút hành động -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                            <a href="${pageContext.request.contextPath}/phuong-tien" class="btn btn-secondary">Hủy</a>
                        </div>
                    </form:form>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>