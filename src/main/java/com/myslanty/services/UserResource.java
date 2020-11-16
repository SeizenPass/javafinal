package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.myslanty.db.UserDB;
import com.myslanty.models.Club;
import com.myslanty.models.User;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("users")
public class UserResource {

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public User getUserById(@PathParam("id") int id) {
        return UserDB.getInstance().getUserById(id);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getAllUsers() {
        return UserDB.getInstance().getAllUsers();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public String createUser(User user) {
        UserDB.getInstance().addUser(user);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("{id}/getClubs")
    public List<Club> getUserClubs(@PathParam("id") int id) {
        return UserDB.getInstance().getUserClubs(id);
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteUser(@PathParam("id") int id) {
        UserDB.getInstance().deleteUser(id);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getUsersByClubId(@PathParam("id") int id) {
        return UserDB.getInstance().getUsersByClubId(id);
    }

    @GET
    @Path("find")
    public List<User> findUsers(User user) {
        return UserDB.getInstance().findUsers(user);
    }
}
