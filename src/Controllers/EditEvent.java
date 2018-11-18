package Controllers;

import DAO.EventDaoImp;
import Models.Event;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import static DAO.EventDaoImp.DB_URL;

public class EditEvent extends HttpServlet{
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();

        String[] eventIDs = request.getParameterValues("edit");
        String[] eventNames = request.getParameterValues("eventName2");
        String[] dates = request.getParameterValues("date2");
        String[] startTimes = request.getParameterValues("startTime2");
        String[] endTimes = request.getParameterValues("endTime2");
        String[] eventDescs = request.getParameterValues("eventDescription2");

        Event event = new Event();

        event.setEventName(eventNames[0]);
        event.setDate(dates[0]);
        event.setStartTime(Double.parseDouble(startTimes[0]));
        event.setEndTime(Double.parseDouble(endTimes[0]));
        event.setEventDescription(eventDescs[0]);

        try {
            Connection connection = DriverManager.getConnection(DB_URL);
            Statement sql = connection.createStatement();
            ResultSet resultSet = sql.executeQuery("SELECT * " +
                    "FROM EVENTS " +
                    "WHERE EVENTID=" + eventIDs[0]);
            while (resultSet.next()) {
                event.setEventID(Integer.parseInt(eventIDs[0]));
            }

            eventDB.updateEvent(event);
            RequestDispatcher view = request.getRequestDispatcher("adminControlPanel.jsp");
            view.forward(request, response);
        } catch (SQLException sqle) {
            System.out.println("failed at add cont\n"
            + sqle.getMessage());
        }
    }
}
