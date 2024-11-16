<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta charset="UTF-8">
                <title>Thêm Phòng</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body>
                <div class="container mt-4">
                    <h2 class="text-center">Thêm Phòng Mới</h2>
                    <form:form method="post" action="${pageContext.request.contextPath}/rooms/add"
                        modelAttribute="room">
                        <!-- Tầng -->
                        <div class="mb-3">
                            <label for="floor" class="form-label">Tầng:</label>
                            <form:input path="floor" id="floor" class="form-control" type="number"
                                placeholder="Nhập tầng" required="true" />
                        </div>
                        <!-- Diện tích -->
                        <div class="mb-3">
                            <label for="dientich" class="form-label">Diện tích (m²):</label>
                            <form:input path="dientich" id="dientich" class="form-control" type="number" step="0.01"
                                placeholder="Nhập diện tích" required="true" />
                        </div>
                        <!-- ID chủ nhà -->
                        <div class="mb-3">
                            <label for="hostId" class="form-label">ID Chủ Nhà:</label>
                            <form:input path="hostId" id="hostId" class="form-control" type="number"
                                placeholder="Nhập ID chủ nhà" />
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
                            <button type="submit" class="btn btn-primary">Thêm</button>
                            <a href="${pageContext.request.contextPath}/rooms" class="btn btn-secondary">Hủy</a>
                        </div>
                    </form:form>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>