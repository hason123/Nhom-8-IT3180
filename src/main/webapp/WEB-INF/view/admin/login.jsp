<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta charset="UTF-8">
                <title>Login - Bluemoon</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <style>
                    body {
                        background: url('${pageContext.request.contextPath}/resources/images/background_2.webp') no-repeat center center fixed;
                        background-size: cover;
                        font-family: Arial, sans-serif;
                        height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0;
                        position: relative;
                        /* Thêm thuộc tính này để định vị lớp phủ */
                    }

                    /* Lớp phủ làm mờ ảnh nền */
                    .background-blur {
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: url('${pageContext.request.contextPath}/resources/images/background_2.webp') no-repeat center center fixed;
                        background-size: cover;
                        filter: blur(6px);
                        /* Độ mờ (blur) của ảnh nền */
                        z-index: -1;
                        /* Đảm bảo lớp phủ này không che khuất nội dung */
                    }

                    .login-container {
                        background-color: rgba(255, 255, 255, 0.9);
                        border-radius: 10px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                        padding: 2rem;
                        text-align: center;
                        width: 100%;
                        max-width: 400px;
                    }

                    .login-container img {
                        width: 120px;
                        height: 120px;
                        border-radius: 50%;
                        margin-bottom: 1rem;
                    }

                    .login-container h1 {
                        color: #4682B4;
                        font-weight: bold;
                        margin-bottom: 1rem;
                    }

                    .btn-primary {
                        background-color: #4682B4;
                        border: none;
                    }

                    .btn-primary:hover {
                        background-color: #1E90FF;
                    }

                    .form-label {
                        color: #333;
                    }

                    #emailHelp {
                        color: #6c757d;
                    }
                </style>


            </head>

            <body>
                <div class="background-blur"></div> <!-- Lớp phủ làm mờ ảnh nền -->
                <form:form method="post" action="/user/login" modelAttribute="userdto">
                    <div class="login-container">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Logo">
                        <h1>Bluemoon Login</h1>
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p>
                        </c:if>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input type="email" class="form-control" path="email" />
                            <div id="emailHelp" class="form-text"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <form:input type="password" class="form-control" path="password" />
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form:form>
            </body>



            </html>