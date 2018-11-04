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

public class DeleteEvent extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        EventDaoImp eventDB = new EventDaoImp();
        eventDB.getConnection();

        String[] eventIDs =
                request.getParameterValues("delete");

        Event event = new Event();
        try {
            Connection connection =
                    DriverManager.getConnection(DB_URL);
            Statement sql = connection.createStatement();
            ResultSet resultSet = sql.executeQuery("SELECT * " +
                    "FROM EVENTS " +
                    "WHERE EVENTID=" + eventIDs[0]);
            while (resultSet.next()) {
                event.setEventID(Integer.parseInt(eventIDs[0]));
            }

            eventDB.deleteEvent(event);
            RequestDispatcher view = request.getRequestDispatcher("adminControlPanel.jsp");
            view.forward(request, response);


        } catch (SQLException sqle) {
            System.out.println("Failed at del cont\n" +
            sqle.getMessage());
        }

    }
}
