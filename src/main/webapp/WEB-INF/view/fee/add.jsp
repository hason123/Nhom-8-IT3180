<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

        <html lang="en">

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta charset="UTF-8" />
            <title>Thêm Phí</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet" />
            <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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
                <button class="logout-btn" onclick="window.location.href='/login'">Đăng xuất</button>
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
                <!--<a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>-->
                <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>
            </div>


            <!-- Main Content -->
            <div class="container mt-4">
                <h2 class="text-center">Thêm Phí Mới</h2>

                <!-- Form thêm phí -->
                <%--@elvariable id="fee" type=""--%>
                <form:form method="post" modelAttribute="fee" action="${pageContext.request.contextPath}/fees/add">
                    <div class="mb-3">
                        <label for="idPhi" class="form-label">Mã Phí:</label>
                        <form:input path="idPhi" id="idPhi" class="form-control" placeholder="Nhập mã phí" required="true"/>
                        <div class="invalid-feedback">Vui lòng nhập mã phí.</div>
                    </div>

                    <div class="mb-3">
                        <label for="tenPhi" class="form-label">Tên Phí:</label>
                        <form:input path="tenPhi" id="tenPhi" class="form-control" placeholder="Nhập tên phí" required="true"/>
                        <div class="invalid-feedback">Vui lòng nhập tên phí.</div>
                    </div>

                    <div class="mb-3">
                        <label for="moTaPhi" class="form-label">Mô Tả Phí:</label>
                        <form:textarea path="moTaPhi" id="moTaPhi" class="form-control" placeholder="Nhập mô tả phí"
                            rows="3" required="true"></form:textarea>
                    </div>

                    <div class="mb-3">
                        <label for="thoiGianThu" class="form-label">Thời Gian Thu:</label>
                        <form:input type="text" path="thoiGianThu" id="thoiGianThu" class="form-control"
                            placeholder="Nhập thời gian thu" />
                        <div class="invalid-feedback">Vui lòng nhập thời gian thu.</div>
                    </div>

                    <!-- Nút hành động -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Lưu</button>
                        <a href="${pageContext.request.contextPath}/fees" class="btn btn-secondary">Hủy</a>
                    </div>
                </form:form>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>