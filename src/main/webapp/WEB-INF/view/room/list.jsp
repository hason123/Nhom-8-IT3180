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
            </head>

            <body>
                <div class="container mt-4">
                    <h2 class="text-center">Danh Sách Phòng</h2>

                    <!-- Nút thêm phòng -->
                    <div class="mb-3 text-end">
                        <a href="${pageContext.request.contextPath}/rooms/add" class="btn btn-success">Thêm Phòng</a>
                    </div>

                    <!-- Bảng danh sách phòng -->
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>#</th>
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
                                    <td>${room.idRoom}</td>
                                    <td>${room.floor}</td>
                                    <td>${room.dientich}</td>
                                    <td>${room.hostId}</td>
                                    <td>${room.hostName}</td>
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