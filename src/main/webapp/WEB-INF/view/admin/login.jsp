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
                <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Bangers&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
                    rel="stylesheet">



            </head>

            <body
                style="background: url('${pageContext.request.contextPath}/resources/images/background_3.webp') no-repeat center center fixed;;">
                <div class="background-blur"
                    style="background: url('${pageContext.request.contextPath}/resources/images/background_3.webp') no-repeat center center fixed;">
                </div>
                <form:form method="post" action="/user/login" modelAttribute="userdto">
                    <div class="login-container">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Logo">
                        <h1>Login</h1>
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