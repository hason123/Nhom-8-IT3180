<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <meta charset="UTF-8" />
                <title>Chỉnh Sửa Hóa Đơn</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet" />
                <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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

                <!-- Form Chỉnh Sửa Hóa Đơn -->
                <div class="container mt-4">
                    <h2 class="text-center">Chỉnh Sửa Hóa Đơn</h2>
                    <form:form method="POST" action="${pageContext.request.contextPath}/bills/edit"
                        modelAttribute="bill">
                        <div class="row">
                            <!-- ID (Ẩn vì không cần chỉnh sửa) -->
                            <form:hidden path="idHoaDon" />

                            <!-- Tiêu đề -->
                            <div class="col-md-6 mb-3">
                                <label for="tieuDe" class="form-label">Tiêu Đề:</label>
                                <form:input path="tieuDe" id="tieuDe" class="form-control" type="text"
                                    placeholder="Nhập tiêu đề hóa đơn" required="true" />
                            </div>

                            <!-- Số tiền -->
                            <div class="col-md-6 mb-3">
                                <label for="soTien" class="form-label">Số Tiền:</label>
                                <form:input path="soTien" id="soTien" class="form-control" type="number"
                                    placeholder="Nhập số tiền" required="true" />
                            </div>

                            <!-- Mã căn hộ -->
                            <div class="col-md-6 mb-3">
                                <label for="maCanHo" class="form-label">Mã Căn Hộ:</label>
                                <form:input path="maCanHo" id="maCanHo" class="form-control" type="text"
                                    placeholder="Nhập mã căn hộ" required="true" />
                            </div>

                            <!-- Kỳ thanh toán -->
                            <div class="col-md-6 mb-3">
                                <label for="kiThanhToan" class="form-label">Kỳ Thanh Toán:</label>
                                <form:input path="kiThanhToan" id="kiThanhToan" class="form-control" type="text"
                                    placeholder="Nhập kỳ thanh toán" required="true" />
                            </div>

                            <!-- Hạn thanh toán -->
                            <div class="col-md-6 mb-3">
                                <label for="hanThanhToan" class="form-label">Hạn Thanh Toán:</label>
                                <form:input path="hanThanhToan" id="hanThanhToan" class="form-control" type="date"
                                    required="true" />
                            </div>

                            <!-- Ngày thanh toán -->
                            <div class="col-md-6 mb-3">
                                <label for="ngayThanhToan" class="form-label">Ngày Thanh Toán:</label>
                                <form:input path="ngayThanhToan" id="ngayThanhToan" class="form-control" type="date" />
                            </div>

                            <!-- Trạng thái -->
                            <div class="col-md-6 mb-3">
                                <label for="trangThai" class="form-label">Trạng Thái:</label>
                                <form:select path="trangThai" id="trangThai" class="form-control">
                                    <form:option value="Chưa thanh toán">Chưa thanh toán</form:option>
                                    <form:option value="Đã thanh toán">Đã thanh toán</form:option>
                                </form:select>
                            </div>

                            <!-- ID Thanh Toán -->
                            <div class="col-md-6 mb-3">
                                <label for="idThanhToan" class="form-label">ID Thanh Toán:</label>
                                <form:input path="idThanhToan" id="idThanhToan" class="form-control" type="text"
                                    placeholder="Nhập ID Thanh Toán" />
                            </div>

                            <!-- ID Các Khoản Phí -->
                            <div class="col-md-6 mb-3">
                                <label for="idCacKhoanPhi" class="form-label">ID Các Khoản Phí:</label>
                                <form:input path="idCacKhoanPhi" id="idCacKhoanPhi" class="form-control" type="text"
                                    placeholder="Nhập ID Các Khoản Phí" />
                            </div>
                        </div>

                        <!-- Nút hành động -->
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                            <a href="${pageContext.request.contextPath}/bills" class="btn btn-secondary">Hủy</a>
                        </div>
                    </form:form>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>