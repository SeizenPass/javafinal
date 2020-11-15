package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.myslanty.db.ClubDB;
import com.myslanty.db.UserDB;
import com.myslanty.models.Club;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("clubs")
public class ClubResource {
    @Path("{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Club getClubById(@PathParam("id") int id) {
        return ClubDB.getInstance().getClubById(id);
    }

    @Path("{id}")
    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteClub(@PathParam("id") int id) {
        ClubDB.getInstance().deleteClub(id);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addClub(Club club) {
        ClubDB.getInstance().addClub(club);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Club> getAllClubs() {
        return ClubDB.getInstance().getAllClubs();
    }

    @PUT
    public String updateClub(Club club) {
        ClubDB.getInstance().updateClub(club);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Path("{id}/subscription/{userid}")
    public String addSubscriberToClub(@PathParam("id") int id, @PathParam("userid") int userId) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @DELETE
    @Path("{id}/subscription/{userid}")
    public String deleteSubscriber(@PathParam("id") int id, @PathParam("userid")int userId) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @PUT
    @Path("{id}/subscription/{userid}")
    public String changePrivilege(@PathParam("id") int id, @PathParam("userid")int userId) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }
}
