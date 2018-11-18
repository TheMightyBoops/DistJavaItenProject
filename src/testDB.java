import DAO.EventDaoImp;
import Models.Event;

public class testDB {
    public static void main(String args[]) {
        Event event = new Event();

        event.setEventName("Fall down the Stairs");
        event.setDate("06/18/2018");
        event.setEventDescription("This is the time when we fall down the stairs");

        EventDaoImp eventDB = new EventDaoImp();

        eventDB.getConnection();

        eventDB.addEvent(event);

        event = (Event) eventDB.getAllEvents().get(0);

        eventDB.deleteEvent(event);
    }
}
