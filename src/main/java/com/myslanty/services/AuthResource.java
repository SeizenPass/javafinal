package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

@Path("auth")
public class AuthResource {
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String login(String body, @Context HttpServletRequest request) {
        JsonObject json = new Gson().fromJson(body, JsonObject.class);
        return new Gson().toJson(json);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String logout() {
        return "Test";
    }
}
