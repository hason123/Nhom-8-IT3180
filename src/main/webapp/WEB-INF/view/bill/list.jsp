<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <meta charset="UTF-8" />
                <title>Danh Sách Hóa Đơn</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/general.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath}/resources/css/billList.css" rel="stylesheet" />
                <script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                <link
                    href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap"
                    rel="stylesheet" />
                <style>
                    /* Căn giữa nội dung trong các ô theo chiều dọc và ngang */
                    td {
                        vertical-align: middle;  /* Căn giữa theo chiều dọc */
                        text-align: center;      /* Căn giữa theo chiều ngang */
                    }
                </style>
                <style>
                    .status {
                        font-weight: bold;
                        color: white;
                        padding: 5px 10px;
                        border-radius: 5px;
                    }
                    .pending { background-color: #FFAC1C; }
                    .paid { background-color: green; }
                    .overdue { background-color: red; }
                </style>

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

      <!-- <a href="#"><i class="fas fa-chart-bar"></i> Tra cứu và thống kê</a> -->
      <a href="${pageContext.request.contextPath}/user/list"
      ><i class="fas fa-user-circle"></i> Tài khoản</a
    >
    </div>

                <!-- Main Content -->
                <div class="container-m">
                    <h2 class="text-center">Danh Sách Hóa Đơn</h2>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p style="font-size: 1.4rem;"><strong>Tổng số hóa đơn:</strong> ${totalBills}</p>
                        <a href="${pageContext.request.contextPath}/bills/add" class="btn btn-success">Thêm Hóa Đơn</a>
                    </div>


                    <!-- Bảng danh sách hóa đơn -->
                    <div class="mb-4">
                        <form method="get" action="${pageContext.request.contextPath}/bills" class="d-flex align-items-center">
                            <input type="text" name="keyword" value="${keyword}" class="form-control me-2" placeholder="Tìm kiếm">
                            <select name="searchType" class="form-select me-2">
                                <option value="maCanHo" ${searchType == 'maCanHo' ? 'selected' : ''}>Mã Căn Hộ</option>
                                <option value="trangThai" ${searchType == 'trangThai' ? 'selected' : ''}>Trạng Thái</option>
                                <option value="kiThanhToan" ${searchType == 'kiThanhToan' ? 'selected' : ''}>Kỳ Thanh Toán</option>
                                <option value="idThanhToan" ${searchType == 'loaiThanhToan' ? 'selected' : ''}>Hình Thức Thanh toán</option>
                               <!-- <option value="idCacKhoanPhi" ${searchType == 'idCacKhoanPhi' ? 'selected' : ''}>ID Các Khoản phí</option> -->
                            </select>


                        </form>
                    </div>

                    <style>
                        .hidden-column {
                            display: none;
                        }
                    </style>
                    <table class="table table-striped table-bordered">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>ID</th>
                                <th>Tiêu Đề</th>
                                <th>Số Tiền</th>
                                <th>Mã Phòng</th>
                                <th>Kỳ Thanh Toán</th>
                                <th>Hạn Thanh Toán</th>
                                <th>Ngày Thanh Toán</th>
                                <th>Trạng Thái</th>
                                <th>Hình Thức Thanh Toán</th>
                                <th class="hidden-column">ID Các Khoản Phí</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bill" items="${bills}">
                                <tr class="text-center">
                                    <td style="color: rgb(0, 181, 181)">${bill.idHoaDon}</td>
                                    <td>${bill.tieuDe}</td>
                                    <td><fmt:formatNumber value="${bill.soTien}" type="number" maxFractionDigits="0" />đ</td>
                                    <td><fmt:formatNumber value="${bill.maCanHo}" pattern="0000" /></td>
                                    <td>${bill.kiThanhToan}</td>
                                    <td>${bill.hanThanhToan}</td>
                                    <td>${bill.ngayThanhToan}</td>
                                    <td>
    <span class="status
        ${bill.trangThai == 'Chưa thanh toán' ? 'pending' :
          (bill.trangThai == 'Đã thanh toán' ? 'paid' :
          (bill.trangThai == 'Đã quá hạn' ? 'overdue' : ''))}">
            ${bill.trangThai}
    </span>
                                    </td>

                                    <td>${bill.loaiThanhToan}</td>

                                    <!--<td>${bill.idCacKhoanPhi}</td>-->
                                    <td>
                                        <a href="${pageContext.request.contextPath}/bills/edit/${bill.idHoaDon}"
                                            class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="${pageContext.request.contextPath}/bills/delete/${bill.idHoaDon}"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa hóa đơn này?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Hiển thị thông báo nếu danh sách rỗng -->
                    <c:if test="${empty bills}">
                        <div class="alert alert-warning text-center" role="alert">
                            Không có hóa đơn nào được tìm thấy.
                        </div>
                    </c:if>
                </div>

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>
