<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta charset="UTF-8">
                <title>Sign up - Bluemoon</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
            </head>

            <body
                style="background: url('${pageContext.request.contextPath}/resources/images/background_3.webp') no-repeat center center fixed;">
                <div class="background-blur"
                    style="background: url('${pageContext.request.contextPath}/resources/images/background_3.webp') no-repeat center center fixed;">
                </div>
                <form:form method="post" action="/user/save" modelAttribute="newUser">
                    <div class="login-container">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Logo"
                            class="mb-3">
                        <h1 class="mb-3">Sign up</h1>
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p>
                        </c:if>
                        <!-- Compact form layout -->
                        <div class="row g-2">
                            <div class="col-12 mb-2">
                                <form:input type="email" class="form-control" path="email" placeholder="Email" />
                            </div>
                            <div class="col-12 mb-2">
                                <form:input type="password" class="form-control" path="password"
                                    placeholder="Password" />
                            </div>
                            <div class="col-6">
                                <form:input type="tel" class="form-control" path="phone" placeholder="Phone" />
                            </div>
                            <div class="col-6">
                                <form:input type="text" class="form-control" path="fullName" placeholder="Full Name" />
                            </div>
                            <div class="col-12 mb-3">
                                <form:input type="text" class="form-control" path="address" placeholder="Address" />
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Sign up</button>
                    </div>
                </form:form>
            </body>

            </html>