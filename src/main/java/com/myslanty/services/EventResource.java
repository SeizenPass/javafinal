package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.myslanty.db.EventDB;
import com.myslanty.models.Event;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("events")
public class EventResource {
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Event getClubEventById(@PathParam("id") int id) {
        return EventDB.getInstance().getEventById(id);
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteEvent(@PathParam("id") int id) {
        EventDB.getInstance().deleteEvent(id);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addEvent(Event event) {
        EventDB.getInstance().addEvent(event);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Event> getAllEvents() {
        return EventDB.getInstance().getAllEvents();
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    public String updateEvent(Event event) {
        //TODO implement
        EventDB.getInstance().updateEvent(event);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Event> getClubEventsByClubId(@PathParam("id") int id) {
        return EventDB.getInstance().getClubEventsByClubId(id);
    }
}
