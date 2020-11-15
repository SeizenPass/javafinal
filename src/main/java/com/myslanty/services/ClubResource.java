package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
        Club club = new Club();
        club.setId(id);
        return club;
    }

    @Path("{id}")
    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteClub(@PathParam("id") int id) {
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addClub(Club club) {
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Club> getAllClubs() {
        List<Club> list = new ArrayList<>();
        Club club = new Club();
        club.setId(1);
        list.add(club);
        club = new Club();
        club.setId(2);
        list.add(club);
        return list;
    }

}
