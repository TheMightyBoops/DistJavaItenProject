<%@ page import="java.util.List" %>
<%@ page import="Models.Event" %>
<%@ page import="DAO.EventDaoImp" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h2>To add an event just fill in and submit this form </h2>
    <form method="post" id="addEvent" name="addEvent" action="addEvent.go">
        <input title="Event Name:" type="text" id="eventName" name="eventName">
        <input title="Date:" type="text" id="date" name="date" placeholder="mm/dd/yyyy">
        <input title="Start Time:" type="text" id="startTime" name="startTime" placeholder="Ex:3 AM">
        <input title="End Time:" type="text" id="endTime" name="endTime" placeholder="Ex:3 PM">
        <textarea title="Description:" name="eventDescription" id="eventDescription"></textarea>
        <button type="submit">Add event</button>
    </form>
    <h2>To remove an event just click the delete next to the desired event</h2>
    <%
        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();
        List<Event> events = eventDB.getAllEvents();

        if(events != null) {
            for(Event e: events) {
                out.print("<dl>" +
                        "<dt>" + e.getEventName() + "</dt>" +
                        "<dd>" + e.getDate() + "</dt>" +
                        "<dd>" + e.getStartTime() + "</dd>" +
                        "<dd>" + e.getEndTime() + "</dd>" +
                        "<dd>" + e.getEventDescription() + "</dd>" +
                        "<dd><form method='post' action='deleteEvent.go'>" +
                            "<button type='submit' name='delete' value='"+e.getEventID()+"'>Delete</button>" +
                        "</form></dd></dl>"

                );
            }
        }
    %>
</main>
</body>
</html>
