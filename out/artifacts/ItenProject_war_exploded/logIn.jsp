<%@ page import="Models.User" %><%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 11/4/18
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Log In</title>

</head>
<body>
<header>
    <nav>
        <ul>
            <c:set var="isAdmin" scope="page" value='${sessionScope["user"].isAdmin()}' />
            <c:if test="${isAdmin}">
                <li><a href="adminControlPanel.jsp">Admin control panel</a></li>
            </c:if>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="schedule.jsp">Schedule</a></li>
        </ul>
    </nav>
</header>
<main>
    <h3>You now have administrative privileges.</h3>
</main>
</body>
</html>
