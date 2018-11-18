package Controllers;

import DAO.EventDaoImp;
import Models.Event;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddEvent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String[] eventNames = request.getParameterValues("eventName");
        String[] dates = request.getParameterValues("date");
        String[] startTimes = request.getParameterValues("startTime");
        String[] endTimes = request.getParameterValues("endTime");
        String[] eventDescs = request.getParameterValues("eventDescription");

        Event event = new Event();

        event.setEventName(eventNames[0]);
        event.setDate(dates[0]);
        event.setStartTime(Double.parseDouble(startTimes[0]));
        event.setEndTime(Double.parseDouble(endTimes[0]));
        event.setEventDescription(eventDescs[0]);

        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();
        eventDB.addEvent(event);

        RequestDispatcher view = request.getRequestDispatcher("adminControlPanel.jsp");
        view.forward(request, response);
    }
}
