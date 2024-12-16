<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh Sửa Hồ Sơ</title>
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h2 class="text-center">Chỉnh Sửa Hồ Sơ Người Dùng</h2>

      <!-- Hiển thị thông báo thành công nếu có -->
      <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
      </c:if>

      <!-- Hiển thị thông báo lỗi nếu có -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>

      <!-- Form chỉnh sửa thông tin người dùng -->
      <form
        action="${pageContext.request.contextPath}/user/edit/${user.id}"
        method="post"
      >
        <!-- Ẩn ID trong form nếu không muốn người dùng thay đổi -->
        <input type="hidden" name="id" value="${user.id}" />

        <div class="form-group">
          <label for="fullName">Họ và Tên</label>
          <input
            type="text"
            class="form-control"
            id="fullName"
            name="fullName"
            value="${user.fullName}"
            required
          />
        </div>

        <div class="form-group">
          <label for="phone">Số Điện Thoại</label>
          <input
            type="text"
            class="form-control"
            id="phone"
            name="phone"
            value="${user.phone}"
            required
          />
        </div>

        <div class="form-group">
          <label for="address">Địa Chỉ</label>
          <input
            type="text"
            class="form-control"
            id="address"
            name="address"
            value="${user.address}"
            required
          />
        </div>

        <button type="submit" class="btn btn-primary">Cập Nhật</button>

        <!-- Nút Thêm thay vì Hủy -->
        <a
          href="${pageContext.request.contextPath}/user/add"
          class="btn btn-success btn-block"
          >Thêm</a
        >
      </form>

      <div class="mt-3">
        <a
          href="${pageContext.request.contextPath}/user/list"
          class="btn btn-secondary"
          >Quay lại danh sách</a
        >
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
