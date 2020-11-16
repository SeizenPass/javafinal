package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.Event;
import com.myslanty.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDB {
    public static EventDB eventDB = new EventDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<Event> events;

    private EventDB() {}

    public static EventDB getInstance() {
        init();
        return eventDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM events");
            events = getDBEvents(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAllEvents() {
        return events;
    }

    public Event getEventById(int id) {
        for (Event e: events) {
            if (e.getId() == id) {
                return e;
            }
        }
        return null;
    }

    public void addEvent(Event event) {
        int id = 0;
        Timestamp date = null;
        try {
            PreparedStatement ps =
                    cn.prepareStatement("INSERT INTO " +
                            "events(event_name, description, date, club_id) " +
                            "VALUES (?, ?, ?, ?)");
            ps.setString(1, event.getEventName());
            ps.setString(2, event.getDescription());
            ps.setTimestamp(3, event.getDate());
            ps.setInt(4, event.getClubId());
            ps.executeUpdate();
            ps.close();
            ps = cn.prepareStatement("SELECT currval('events_id_seq'::regclass)");
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                id = res.getInt(1);
            }
            ps = cn.prepareStatement("SELECT publish_date FROM events WHERE id=?");
            ps.setInt(1, id);
            res = ps.executeQuery();
            while (res.next()) {
                date = res.getTimestamp(1);
            }
            event.setId(id);
            event.setPublishDate(date);
            events.add(event);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEvent(int id) {
        events.removeIf(e -> e.getId() == id);
        try {
            PreparedStatement ps = cn.prepareStatement("DELETE FROM events " +
                    "WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateEvent(Event event) {
        for (Event e : events) {
            if (e.getId() == event.getId()) {
                e.setEventName(event.getEventName());
                e.setDescription(event.getDescription());
                e.setDate(event.getDate());
                break;
            }
        }
        try {
            PreparedStatement ps = cn.prepareStatement("UPDATE events " +
                    "SET event_name=?, description=?, date=? " +
                    "WHERE id=?");
            ps.setString(1, event.getEventName());
            ps.setString(2, event.getDescription());
            ps.setTimestamp(3, event.getDate());
            ps.setInt(4, event.getId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getClubEventsByClubId(int id) {
        List<Event> ans = new ArrayList<>();
        for (Event e: events) {
            if (e.getClubId() == id) {
                ans.add(e);
            }
        }
        return ans;
    }

    protected static List<Event> getDBEvents(ResultSet rs) {
        List<Event> events = new ArrayList<>();
        try {
            Event event;
            while(rs.next()) {
                event = new Event();
                event.setId(rs.getInt(1));
                event.setEventName(rs.getString(2));
                event.setDescription(rs.getString(3));
                event.setDate(rs.getTimestamp(4));
                event.setPublishDate(rs.getTimestamp(5));
                event.setClubId(rs.getInt(6));
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }
}
