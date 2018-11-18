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
    <link rel="stylesheet" type="text/css" href="Styles/styles.css">
</head>
<body>
<header>
    <nav class="menu">
        <c:set var="isAdmin" scope="page" value='${sessionScope["user"].isAdmin()}'/>
        <c:if test="${isAdmin}">
            <a href="adminControlPanel.jsp">Admin control panel</a>
        </c:if>
        <a href="index.jsp">Home</a>
        <a href="schedule.jsp">Schedule</a>
    </nav>
</header>
<main>
    <h3 id="title">You now have administrative privileges.</h3>
</main>
</body>
</html>
