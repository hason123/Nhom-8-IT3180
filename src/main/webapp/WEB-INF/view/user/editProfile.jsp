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
      <h2 class="form-title">Chỉnh Sửa Hồ Sơ Người Dùng</h2>

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


        <div class="text-center">
          <div class="d-flex justify-content-between" style="gap: 10px;">
            <button type="submit" class="btn btn-primary w-50 me-2">Cập nhật</button>
            <a href="${pageContext.request.contextPath}/user/list" class="btn btn-secondary w-50 text-center d-flex justify-content-center align-items-center">Hủy</a>
          </div>
        </div>

      </form>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
