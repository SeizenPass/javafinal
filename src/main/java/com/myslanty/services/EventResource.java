package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
        //TODO implement
        Event event = new Event();
        event.setId(id);
        return event;
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteEvent(@PathParam("id") int id) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("id", id);
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addEvent(Event event) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Event> getAllEvents() {
        //TODO implement
        List<Event> list = new ArrayList<>();
        Event event = new Event();
        event.setId(1);
        list.add(event);
        event = new Event();
        event.setId(2);
        list.add(event);
        return list;
    }

    @PUT
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String addEvent(@PathParam("id") int id) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("id", id);
        return new Gson().toJson(json);
    }

    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Event> getClubEventsByClubId(@PathParam("id") int id) {
        //TODO implement
        List<Event> list = new ArrayList<>();
        Event event = new Event();
        event.setId(1);
        event.setClubId(id);
        list.add(event);
        event = new Event();
        event.setId(2);
        event.setClubId(id);
        list.add(event);
        return list;
    }
}
