<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <meta charset="UTF-8" />
                <title>Danh Sách Phương Tiện</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/phuongtienList.css" rel="stylesheet" />
                <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                <link
                    href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap"
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
      ><i class="fas fa-car"></i> Phương thức thanh toán</a
      >
      <a href="${pageContext.request.contextPath}/phuong-tien"
        ><i class="fas fa-car"></i> Quản lý phương tiện</a
      >

      <!-- <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a> -->
      <a href="${pageContext.request.contextPath}/user/list"
      ><i class="fas fa-car"></i> Tài khoản</a
    >
    </div>
                <!-- Main Content -->
                <div class="container-m">
                    <h2 class="text-center">Danh Sách Phương Tiện</h2>

                    <!-- Nút thêm phương tiện -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p style="font-size: 1.4rem;"><strong>Tổng số phương tiện:</strong> ${totalPhuongTiens}</p>
                        <a href="${pageContext.request.contextPath}/phuong-tien/add" class="btn btn-success">Thêm phương tiện</a>
                    </div>


                    <form method="get" action="${pageContext.request.contextPath}/phuong-tien" class="d-flex align-items-center mb-4">
                        <input type="text" name="keyword" value="${keyword}" class="form-control me-2" placeholder="Tìm kiếm">
                        <select name="searchType" class="form-select me-2">
                            <option value="loaiXe" ${searchType == 'loaiXe' ? 'selected' : ''}>Loại Xe</option>
                            <option value="tenXe" ${searchType == 'tenXe' ? 'selected' : ''}>Tên Xe</option>
                            <option value="bienKiemSoat" ${searchType == 'bienKiemSoat' ? 'selected' : ''}>Biển Kiểm Soát</option>
                            <option value="tenChuXe" ${searchType == 'tenChuXe' ? 'selected' : ''}>Tên Chủ Xe</option>
                            <option value="maChuXe" ${searchType == 'maChuXe' ? 'selected' : ''}>Mã Chủ Xe</option>
                        </select>
                    </form>


                    <!-- Bảng danh sách phương tiện -->
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>ID</th>
                                <th>Tên Xe</th>
                                <th>Loại Xe</th>
                                <th>Biển Kiểm Soát</th>
                                <th>Tên Chủ Xe</th>
                                <th>Mã Chủ Xe</th>
                                <th>Phòng</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="phuongTien" items="${phuongTiens}">
                                <tr class="text-center">
                                    <td style="color: rgb(0, 181, 181)">${phuongTien.idXe}</td>
                                    <td>${phuongTien.tenXe}</td>
                                    <td>${phuongTien.loaiXe}</td>
                                    <td style="color: rgb(0, 181, 181)">${phuongTien.bienKiemSoat}</td>
                                    <td>${phuongTien.tenChuXe}</td>
                                    <td>${phuongTien.maChuXe}</td>
                                    <td>${phuongTien.room.idRoom}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/phuong-tien/edit/${phuongTien.idXe}"
                                            class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="${pageContext.request.contextPath}/phuong-tien/delete/${phuongTien.idXe}"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa phương tiện này?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Hiển thị thông báo nếu danh sách rỗng -->
                    <c:if test="${empty phuongTiens}">
                        <div class="alert alert-warning text-center" role="alert">
                            Không có phương tiện nào được tìm thấy.
                        </div>
                    </c:if>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>
