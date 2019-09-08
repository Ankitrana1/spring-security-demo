# spring-security-demo

1. All Java Config and No XML.
2. Spring Security- In memory DB

Note : Spring security provides "error" and "logout" variable so we can take action accordingly
Ex :    <c:if test="${param.error != null}">
            <i>Sorry! Invalid usename or password</i><br>
        </c:if>
        <c:if test="${param.logout != null}">
            <i>You have been logged out successfully</i><br>
        </c:if>
        
