<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm Người Dùng</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
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
        padding: 10px;
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="add-user-form">
        <h2 class="form-title">Thêm Người Dùng Mới</h2>

        <!-- Hiển thị thông báo lỗi -->
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger" role="alert">
          <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <!-- Hiển thị thông báo thành công -->
        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert alert-success" role="alert">
          <%= request.getAttribute("successMessage") %>
        </div>
        <% } %>

        <!-- Form thêm người dùng -->
        <form
          action="${pageContext.request.contextPath}/user/add"
          method="POST"
        >
          <!-- Email -->
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              class="form-control"
              placeholder="Nhập email"
              required
            />
          </div>
          <!-- Họ và Tên -->
          <div class="mb-3">
            <label for="fullName" class="form-label">Họ và Tên</label>
            <input
              type="text"
              id="fullName"
              name="fullName"
              class="form-control"
              placeholder="Nhập họ và tên"
              required
            />
          </div>
          <!-- Mật Khẩu -->
          <div class="mb-3">
            <label for="password" class="form-label">Mật Khẩu</label>
            <input
              type="password"
              id="password"
              name="password"
              class="form-control"
              placeholder="Nhập mật khẩu"
              required
            />
          </div>
          <!-- Số Điện Thoại -->
          <div class="mb-3">
            <label for="phone" class="form-label">Số Điện Thoại</label>
            <input
              type="text"
              id="phone"
              name="phone"
              class="form-control"
              placeholder="Nhập số điện thoại"
            />
          </div>
          <!-- Địa Chỉ -->
          <div class="mb-3">
            <label for="address" class="form-label">Địa Chỉ</label>
            <input
              type="text"
              id="address"
              name="address"
              class="form-control"
              placeholder="Nhập địa chỉ"
            />
          </div>
          <!-- Nút Thêm -->
          <div class="text-center">
            <div class="d-flex justify-content-between">
              <button type="submit" class="btn btn-primary w-50 me-2">Thêm</button>
              <a href="${pageContext.request.contextPath}/user/list" class="btn btn-secondary w-50">Hủy</a>
            </div>
          </div>
          
          </div>
        </form>
      </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
