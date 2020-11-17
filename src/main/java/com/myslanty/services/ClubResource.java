package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.myslanty.db.ClubDB;
import com.myslanty.db.ClubMembershipDB;
import com.myslanty.db.UserDB;
import com.myslanty.models.Club;
import com.myslanty.models.ClubMembership;
import com.myslanty.models.DictionaryContentPrivilege;

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
    @Path("{id}/subscription/{userid}/{privid}")
    public String addSubscriberToClub(@PathParam("id") int id, @PathParam("userid") int userId, @PathParam("privid") int privId) {
        ClubMembershipDB.getInstance().addSubscriberToClub(userId, id, privId);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @DELETE
    @Path("{id}/subscription/{userid}")
    public String deleteSubscriber(@PathParam("id") int id, @PathParam("userid")int userId) {
        ClubMembershipDB.getInstance().deleteSubscriberFromClub(userId, id);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @PUT
    @Path("{id}/subscription/{userid}/{privid}")
    public String changePrivilege(@PathParam("id") int id, @PathParam("userid")int userId, @PathParam("privid") int privId) {
        ClubMembershipDB.getInstance().changePrivilege(userId, id, privId);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("{id}/subscription/{userid}")
    public ClubMembership getPrivilegeByClubIdAndUserId(@PathParam("id") int clubId,
                                                        @PathParam("userid") int userId) {
        return ClubMembershipDB.getInstance().getPrivIdByUserAndClubId(userId, clubId);
    }
}
