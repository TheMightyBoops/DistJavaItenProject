package DAO;

import Models.Event;

import java.util.List;

public interface EventDao {
    public List getAllEvents();
    public void updateEvent(Event event);
    public void deleteEvent(Event event);
    public void addEvent(Event event);
}
