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
    <form method="post" id="logIn" name="logIn" action="logIn.go">
      <input type="text" id="username" name="username" placeholder="Username">
      <input type="text" id="password" name="password" placeholder="Password">
      <button type="submit">Log In</button>
    </form>

      <h3>Placeholder Text</h3>
      <p>kaljshf lkajsdf hdfsjhf kjhasdflkjhf hsdfkjlhasdf <br> lkjhasdf hsdfh hd khsdfasd</p>
  </main>
  </body>
</html>
