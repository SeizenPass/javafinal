package com.myslanty;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("amiran")
public class TestClass {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Person getString() {
        return new Person("Amiran", "Kurman", 17);
    }
}
