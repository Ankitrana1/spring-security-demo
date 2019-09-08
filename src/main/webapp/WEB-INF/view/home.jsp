<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Home Page</title>
</head>
<body>
<h2>Spring Security Demo</h2>
<hr>
<h4>Welcome to Security Home Page</h4>

<p>
User : <security:authentication property="principal.username"></security:authentication><br>
    <br>
Roles : <security:authentication property="principal.authorities" />
</p>
<form:form method="POST" action="${pageContext.request.contextPath}/logout">

    <input type="submit" value="Logout"/>
</form:form>

<hr>
<a href="${pageContext.request.contextPath}/leaders">leadership meeting</a>
</body>
</html>