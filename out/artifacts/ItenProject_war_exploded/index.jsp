<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 11/3/18
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
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
    <h1 id="title">Sci Con<br>The Midwests 7th Largest Science Fiction Convention</h1>
    <h3 id="news">Our Story</h3>
    <p id="news">While bored one day Lucas (our founder) had an idea. "I'm bored, so<br>
    why not have a convention." Lucas then set to finding the biggest summer house he could find<br>
        Well, the search is over! The Johnsons move back to Florida in November, and what they don't know<br>
        can't hurt them! So, come visit Sci Con, and [Lucas, put the catchphrase here].
    </p>
    <form method="post" id="logIn" name="logIn" action="logIn.go">
        <h4>Employee log in:</h4>
        <input type="text" id="username" name="username" placeholder="Username">
        <br/>
        <input type="text" id="password" name="password" placeholder="Password">
        <br/>
        <button type="submit">Log In</button>
    </form>
</main>
</body>
</html>
