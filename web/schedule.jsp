<%@ page import="DAO.EventDaoImp" %>
<%@ page import="Models.Event" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="Styles/styles.css">
<%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 11/4/18
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sci Con Schedule</title>
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
    <%
        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();
        List<Event> events = eventDB.getAllEvents();
        pageContext.setAttribute("events", events);
        //TODO finish this and then add last page
    %>
    <h3 id="title">Your Sci Con 2018</h3>
    <h4 id="title">Here's all the exciting events we have planned for
        the Midwest's 7th biggest science fiction convention!</h4>
    <c:forEach var="item" items="${events}">
        <dl>
            <dt><h3>${item.eventName}</h3></dt>
            <dd>${item.date}</dd>
            <dd><strong>Start Time:&nbsp;</strong><fmt:formatNumber value="${item.startTime}" type="number" pattern="##.##"
                                                              minFractionDigits="2" maxFractionDigits="2"/>
                <c:set var="startTime" scope="page" value="${item.startTime}"/>
                <c:if test="${startTime < 12}">
                    &nbsp;AM
                </c:if>
                <c:if test="${startTime >= 12}">
                    &nbsp;PM
                </c:if>
            </dd>
            <dd><strong>End Time:&nbsp;</strong><fmt:formatNumber value="${item.endTime}" type="number"
                                                            pattern="##.##" minFractionDigits="2"/>
                <c:set var="endTime" scope="page" value="${item.endTime}"/>
                <c:if test="${endTime < 12}">
                    &nbsp;AM
                </c:if>
                <c:if test="${endTime >= 12}">
                    &nbsp;PM
                </c:if>
                <br/>
            </dd>
            <dd>${item.eventDescription}</dd>
            <dd>
        </dl>
    </c:forEach>
</main>
</body>
</html>
