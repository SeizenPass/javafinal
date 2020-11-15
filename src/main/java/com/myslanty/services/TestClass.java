package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myslanty.models.Person;
import com.myslanty.db.PortalRepository;
import com.myslanty.models.User;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 * USED ONLY FOR TESTING
 * NOT INCLUDED IN THE ACTUAL PROJECT
 * FOR REFERENCE
 */

@Path("amiran")
public class TestClass {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Person getString() {
        Person p = new Person();
        p.setAge(17);
        p.setName("Amiran");
        p.setSurname("Kurman");
        return p;
    }
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Person postString(Person person) {
        return person;
    }
    @Path("usingjson")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Person postStringUsingJSON(String body) {
        JsonObject json = new JsonParser().parse(body).getAsJsonObject();
        Person p = new Person();
        p.setAge(json.get("age").getAsInt());
        p.setName(json.get("name").getAsString());
        p.setSurname(json.get("surname").getAsString());
        return p;
    }

    @Path("usingjson2")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public String postStringUsingJSON2(String body) {
        JsonObject json = new JsonParser().parse(body).getAsJsonObject();
        Person p = new Person();
        p.setAge(json.get("age").getAsInt());
        p.setName(json.get("name").getAsString());
        p.setSurname(json.get("surname").getAsString());
        return new Gson().toJson(json);
    }

    @Path("jdbcTest")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public User getUser() {
        Connection con = PortalRepository.getInstance().getConnection();
        User u = new User();
        try {
            Statement statement =con.createStatement();
            ResultSet res = statement.executeQuery("Select * from users");

            while (res.next()) {
                u.setId(res.getInt(1));
                u.setName(res.getString(2));
                u.setSurname(res.getString(3));
                u.setPriv_id(res.getInt(4));
                u.setEmail(res.getString(6));
            }

        }
        catch (Exception e) {

        }
        finally {
            return u;
        }
    }
}
