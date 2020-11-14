package com.myslanty;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.json.Json;
import javax.json.bind.annotation.JsonbProperty;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

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
}
