<%--
  Created by IntelliJ IDEA.
  User: Ankit Rana
  Date: 8/12/2019
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Custom Login Form</title>
</head>
<body>
    <h3>Login Page</h3>

    <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

        <c:if test="${param.error != null}">
            <i>Sorry! Invalid usename or password</i><br>
        </c:if>
        <c:if test="${param.logout != null}">
            <i>You have been logged out successfully</i><br>
        </c:if>
        <label>UserName</label><input type="text" name ="username" /><br>
        <label>Password</label><input type="text" name ="password"/><br>
        <input type="submit" value="Login"/><br>
    </form:form>
</body>
</html>
