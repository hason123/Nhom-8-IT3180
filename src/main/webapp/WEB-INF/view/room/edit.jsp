<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <html lang="en">

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="UTF-8">
            <title>Chỉnh Sửa Phòng</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-4">
                <h2 class="text-center">Chỉnh Sửa Thông Tin Phòng</h2>

                <!-- Form chỉnh sửa -->
                <form:form action="${pageContext.request.contextPath}/rooms/edit" method="post" modelAttribute="room"
                    class="mt-4">
                    <!-- ID của phòng (ẩn) -->
                    <form:hidden path="idRoom" />

                    <!-- Tầng -->
                    <div class="mb-3">
                        <label for="floor" class="form-label">Tầng</label>
                        <form:input path="floor" type="number" class="form-control" id="floor" required="true" />
                    </div>

                    <!-- Diện tích -->
                    <div class="mb-3">
                        <label for="dientich" class="form-label">Diện Tích (m²)</label>
                        <form:input path="dientich" type="number" step="0.01" class="form-control" id="dientich"
                            required="true" />
                    </div>

                    <!-- ID chủ nhà -->
                    <div class="mb-3">
                        <label for="hostId" class="form-label">ID Chủ Nhà</label>
                        <form:input path="hostId" type="number" class="form-control" id="hostId" />
                    </div>

                    <!-- Tên chủ nhà -->
                    <div class="mb-3">
                        <label for="hostName" class="form-label">Tên Chủ Nhà</label>
                        <form:input path="hostName" type="text" class="form-control" id="hostName" />
                    </div>

                    <!-- Số điện thoại -->
                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label">Số Điện Thoại</label>
                        <form:input path="phoneNumber" type="text" class="form-control" id="phoneNumber" />
                    </div>

                    <!-- Nút hành động -->
                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/rooms" class="btn btn-secondary">Hủy</a>
                        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                    </div>
                </form:form>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>