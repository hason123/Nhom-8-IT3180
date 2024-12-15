<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

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

                <!-- Form Chỉnh Sửa Phí -->
                <div class="container mt-4">
                    <h2 class="text-center">Chỉnh Sửa Phí</h2>
                    <form:form method="POST" action="${pageContext.request.contextPath}/fees/edit" modelAttribute="fee">
                        <div class="row">

                            <form:hidden path="idPhi" />

                            <!-- Tên Phí -->
                            <div class="col-md-6 mb-3">
                                <label for="tenPhi" class="form-label">Tên Phí:</label>
                                <form:input path="tenPhi" id="tenPhi" class="form-control" type="text"
                                    placeholder="Nhập tên phí" required="true" />
                            </div>

                            <!-- Mô Tả Phí -->
                            <div class="col-md-6 mb-3">
                                <label for="moTaPhi" class="form-label">Mô Tả Phí:</label>
                                <form:textarea path="moTaPhi" id="moTaPhi" class="form-control"
                                    placeholder="Nhập mô tả phí" rows="3"></form:textarea>
                            </div>

                            <!-- Thời Gian Thu -->
                            <div class="col-md-6 mb-3">
                                <label for="thoiGianThu" class="form-label">Thời Gian Thu:</label>
                                <form:input path="thoiGianThu" id="thoiGianThu" class="form-control" type="date"
                                    required="true" />
                            </div>
                        </div>

                        <!-- Nút hành động -->
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                            <a href="${pageContext.request.contextPath}/fees" class="btn btn-secondary">Hủy</a>
                        </div>
                    </form:form>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>