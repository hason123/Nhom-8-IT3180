<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta charset="UTF-8">
                <title>Danh Sách Phòng</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet">
                <link href="${pageContext.request.contextPath}/resources/css/roomList.css" rel="stylesheet">
                <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
                <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet">
                <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
                    rel="stylesheet">
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
                    <button class="logout-btn" onclick="window.location.href='/login'">Đăng xuất</button>
                    <!-- Nút Đăng xuất -->
                </div>

                <!-- Sidebar -->
                <div class="sidebar">
                    <a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Trang chủ</a>

                    <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-users"></i> Quản lý hộ
                        khẩu</a>
                    <a href="#"><i class="fas fa-user-friends"></i> Quản lý nhân khẩu</a>
                    <a href="#"><i class="fas fa-wallet"></i> Quản lý khoản phí</a>
                    <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a>
                    <a href="#"><i class="fas fa-user-circle"></i> Tài khoản</a>

                </div>

                <div class="container-m">
                    <h2 class="text-center">Danh Sách Phòng</h2>

                    <!-- Nút thêm phòng -->
                    <div class="mb-3 text-end">
                        <a href="${pageContext.request.contextPath}/rooms/add" class="btn btn-success">Thêm Phòng</a>
                    </div>

                    <!-- Bảng danh sách phòng -->
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark text-center">
                            <tr>
                                <th class="">Mã phòng</th>
                                <th>Tầng</th>
                                <th>Diện Tích (m²)</th>
                                <th>ID Chủ Nhà</th>
                                <th>Tên Chủ Nhà</th>
                                <th>Số Điện Thoại</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="room" items="${rooms}">
                                <tr class="text-center">
                                    <td style="color: rgb(0, 181, 181);">${room.idRoom}</td>
                                    <td>${room.floor}</td>
                                    <td>${room.dientich}</td>
                                    <td>${room.hostId}</td>
                                    <td style="color: rgb(0, 181, 181);">${room.hostName}</td>
                                    <td>${room.phoneNumber}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/rooms/edit/${room.idRoom}"
                                            class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="${pageContext.request.contextPath}/rooms/delete/${room.idRoom}"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Hiển thị thông báo nếu danh sách rỗng -->
                    <c:if test="${empty rooms}">
                        <div class="alert alert-warning text-center" role="alert">
                            Không có phòng nào được tìm thấy.
                        </div>
                    </c:if>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>