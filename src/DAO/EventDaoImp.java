package DAO;

import Models.Event;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDaoImp implements EventDao {

    private final String DB_URL = "jdbc:derby:DB;create=true";
    private Connection connection = null;
    private List<Event> events = null;

    public Connection getConnection() {
        if(connection == null) {
            try {
                connection = DriverManager.getConnection(DB_URL);
            } catch (SQLException sqle) {
                System.out.println("Failed at: dbConnect\n" + sqle.getMessage());
            }
        }
        return connection;
    }

    @Override
    public List getAllEvents() {
        try {
            events = new ArrayList<Event>();
            Statement sql = connection.createStatement();
            ResultSet resultSet = sql.executeQuery("SELECT * FROM EVENTS");

            while (resultSet.next()) {
                int id = resultSet.getInt("EventID");
                String name = resultSet.getString("EventName");
                String date = resultSet.getString("Date");
                String startTime = resultSet.getString("StartTime");
                String endTime = resultSet.getString("EndTime");
                String description = resultSet.getString("Description");

                Event event = new Event();
                event.setEventID(id);
                event.setEventName(name);
                event.setDate(date);
                event.setStartTime(startTime);
                event.setEndTime(endTime);
                event.setEventDescription(description);

                events.add(event);
            }
        } catch (SQLException sqle) {
            return null;
        }

        return events;
    }

    @Override
    public void updateEvent(Event event) {
        try {
            Statement sql = connection.createStatement();

            sql.execute("UPDATE EVENTS" +
                    "Set Date ='" + event.getDate() +
                    "', StartTime='" + event.getStartTime() +
                    "', EndTime='" + event.getEndTime() +
                    "', Description='" + event.getEventDescription() +
                    "', EventName='" + event.getEventName() +
                    "' WHERE EventId=" + event.getEventID()
            );
            System.out.println("Event: " + event.getEventID() + " added to DB");
        } catch (SQLException sqle) {
            System.out.println("Failed at: Update Event\n" +
                    sqle.getMessage());
        }
    }

    @Override
    public void deleteEvent(Event event) {
        try {

            Statement sql = connection.createStatement();

            sql.execute("DELETE FROM EVENTS WHERE EVENTID = " +
                    event.getEventID());
            System.out.println("Event: " + event.getEventID() +
                    "deleted from db.");
        } catch (SQLException sqle) {
            System.out.println("Failed At: Delete Event\n" +
                sqle.getMessage()
            );
        }
    }

    @Override
    public void addEvent(Event event) {
        try {
            Statement sql = connection.createStatement();
            sql.execute(
                    "INSERT INTO EVENTS VALUES (DEFAULT, " +
                            "'" + event.getEventName() + "'," +
                            "'" + event.getDate() + "'," +
                            "'" + event.getStartTime() + "'," +
                            "'" + event.getEndTime() + "'," +
                            "'" + event.getEventDescription() + "')"
            );
            System.out.println("Event: " + event.getEventID() + "added to DB");
        } catch (SQLException sqle) {
            System.out.println("Failed at Add Event\n "+
            sqle.getMessage());
        }

    }
}
