<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đổi Mật Khẩu</title>
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <div class="container mt-5">
      <h2 class="text-center">Đổi Mật Khẩu</h2>

      <!-- Hiển thị thông báo thành công hoặc lỗi -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>

      <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
      </c:if>

      <!-- Form thay đổi mật khẩu -->
      <form
        action="${pageContext.request.contextPath}/user/change-password"
        method="post"
      >
        <div class="form-group">
          <label for="currentPassword">Mật khẩu cũ</label>
          <input
            type="password"
            class="form-control"
            id="currentPassword"
            name="currentPassword"
            required
          />
        </div>

        <div class="form-group">
          <label for="newPassword">Mật khẩu mới</label>
          <input
            type="password"
            class="form-control"
            id="newPassword"
            name="newPassword"
            required
          />
        </div>

        <div class="form-group">
          <label for="confirmPassword">Xác nhận mật khẩu mới</label>
          <input
            type="password"
            class="form-control"
            id="confirmPassword"
            name="confirmPassword"
            required
          />
        </div>

        <button type="submit" class="btn btn-primary btn-block">
          Thay đổi mật khẩu
        </button>
      </form>

      <div class="mt-3">
        <a
          href="${pageContext.request.contextPath}/user/list"
          class="btn btn-secondary btn-block"
          >Quay trang danh sách</a
        >
      </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
