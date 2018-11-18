<%@ page import="java.util.List" %>
<%@ page import="Models.Event" %>
<%@ page import="DAO.EventDaoImp" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="Styles/styles.css">
<%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 11/4/18
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Controls</title>

</head>
<body>
<header>
    <nav class="menu">
        <ul>
            <c:set var="isAdmin" scope="page" value='${sessionScope["user"].isAdmin()}'/>
            <c:if test="${isAdmin}">
            <a href="adminControlPanel.jsp">Admin control panel</a>
            </c:if>
            <a href="index.jsp">Home</a>
            <a href="schedule.jsp">Schedule</a>
            <h3 id="title">SciCon 2018 Mission Control</h3>
    </nav>
</header>
<main>

    <h2 id="news">To add an event just fill in and submit this form </h2>
    <form method="post" id="addEvent" name="addEvent" action="addEvent.go">
        <input title="Event Name:" type="text" id="eventName" name="eventName">
        <input title="Date:" type="text" id="date" name="date" placeholder="mm/dd/yyyy">
        <input title="Start Time:" type="text" id="startTime" name="startTime" placeholder="Ex:3.45">
        <input title="End Time:" type="text" id="endTime" name="endTime" placeholder="Ex:13.56">
        <br/>
        <textarea title="Description:" name="eventDescription" id="eventDescription"></textarea>
        <br/>
        <button type="submit">Add event</button>
    </form>
    <h2 id="news">To remove an event just click the delete under to the desired event<br>
    To edit it, change the desired form and click update.<br>
        Event order will swith automatically in this list if you change event times.
    </h2>
    <%
        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();
        List<Event> events = eventDB.getAllEvents();
        pageContext.setAttribute("events", events);
        //TODO finish this and then add last page
    %>
    <c:forEach var="item" items="${events}">
        <form method="post" action="editEvent.go">
            <input title="Event Name:" type="text" id="eventName2" name="eventName2" value="${item.eventName}">
            <input title="Date:" type="text" id="date2" name="date2" value="${item.date}">
            <input title="Start Time:" type="text" id="startTime2" name="startTime2" value="${item.startTime}">
            <input title="End Time:" type="text" id="endTime2" name="endTime2" value="${item.endTime}">
            <br/>
            <textarea title="Description:" name="eventDescription2"
                      id="eventDescription2">${item.eventDescription}</textarea>
            <br/>
            <button type="submit" name="edit" value="${item.eventID}">Update</button>
        </form>
        <form method="post" action="deleteEvent.go">
            <button type="submit" name="delete" value="${item.eventID}">Delete</button>
        </form>

    </c:forEach>
</main>
</body>
</html>
