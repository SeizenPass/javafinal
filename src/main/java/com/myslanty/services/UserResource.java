package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
        //TODO connect to database and fetch user
        User u = new User();
        u.setName("Amiran");
        u.setSurname("Kurman");
        u.setId(id);
        return u;
    }
    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getAllUsers() {
        //TODO connect to database and fetch users
        ArrayList<User> list = new ArrayList<>();
        User u = new User();
        u.setName("Amiran");
        u.setSurname("Kurman");
        u.setId(1);
        list.add(u);
        u = new User();
        u.setName("Amiran2");
        u.setSurname("Kurman2");
        u.setId(2);
        list.add(u);
        return list;
    }
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public String createUser(User user) {
        //TODO connect to database and fetch users
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("{id}/getClubs")
    public List<Club> getUserClubs(@PathParam("id") int id) {
        //TODO connect to database and fetch clubs
        ArrayList<Club> list = new ArrayList<>();
        Club club = new Club();
        club.setId(id);
        club.setClubName("Myslanty");
        list.add(club);
        club = new Club();
        club.setId(id);
        club.setClubName("AmirBro");
        list.add(club);
        return list;
    }
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteUser(@PathParam("id") int id) {
        //TODO connect to database and delete user
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }
    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<User> getUsersByClubId(@PathParam("id") int id) {
        //TODO connect to database and fetch users
        ArrayList<User> list = new ArrayList<>();
        User u = new User();
        u.setName("Amiran");
        u.setSurname("Kurman");
        u.setId(id);
        list.add(u);
        u = new User();
        u.setName("Amiran2");
        u.setSurname("Kurman2");
        u.setId(id);
        list.add(u);
        return list;
    }
}
