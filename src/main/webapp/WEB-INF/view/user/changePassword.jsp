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
    <style>
      body {
        background-color: #f8f9fa;
      }
      .add-user-form {
        margin: 50px auto;
        max-width: 600px;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .form-title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #007bff;
      }
      .btn-primary {
        width: 100%;
        padding: 8px;
        font-size: 18px;
      }
    </style>
  </head>

  <body>
    <div class="container">
      <div class="add-user-form">
        <h2 class="form-title">Đổi Mật Khẩu</h2>

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
            <label for="currentPassword" class="form-label">Mật khẩu cũ</label>
            <input
              type="password"
              class="form-control"
              id="currentPassword"
              name="currentPassword"
              required
            />
          </div>

          <div class="form-group" >
            <label for="newPassword" class="form-label">Mật khẩu mới</label>
            <input
              type="password"
              class="form-control"
              id="newPassword"
              name="newPassword"
              required
            />
          </div>

          <div class="form-group">
            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
            <input
              type="password"
              class="form-control"
              id="confirmPassword"
              name="confirmPassword"
              required
            />
          </div>

          <div class="form-check">
            <input
                    type="checkbox"
                    class="form-check-input"
                    id="showPassword"
                    onclick="togglePasswordVisibility()"
            />
            <label class="form-check-label" for="showPassword">Hiển thị mật khẩu</label>
          </div>

          <br />

          <div class="text-center">
            <div class="d-flex justify-content-between" style="gap: 10px;">
              <button type="submit" class="btn btn-primary w-50 me-2">Thay đổi mật khẩu</button>
              <a href="${pageContext.request.contextPath}/user/list" class="btn btn-secondary w-50 text-center d-flex justify-content-center align-items-center">Hủy</a>
            </div>
          </div>



        </form>


      </div>
    </div>


      <!-- Bootstrap JS and dependencies -->
    <script>
      function togglePasswordVisibility() {
        var passwordFields = document.querySelectorAll('#currentPassword, #newPassword, #confirmPassword');
        var showPasswordCheckbox = document.getElementById('showPassword');

        // Nếu checkbox được chọn, thay đổi tất cả các ô mật khẩu sang hiển thị
        passwordFields.forEach(function(field) {
          if (showPasswordCheckbox.checked) {
            field.type = 'text';
          } else {
            field.type = 'password';
          }
        });
      }
    </script>
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
