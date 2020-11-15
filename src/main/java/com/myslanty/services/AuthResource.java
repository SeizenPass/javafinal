package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myslanty.db.UserDB;
import com.myslanty.models.User;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("auth")
public class AuthResource {
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String login(String body, @Context HttpServletRequest request) {
        JsonObject json = new Gson().fromJson(body, JsonObject.class);
        List<User> list = UserDB.getInstance().getAllUsers();
        String email = json.get("email").getAsString(),
                password = json.get("password").getAsString();
        boolean isLogged = false;
        for (User u:
             list) {
            if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
                request.getSession().setAttribute("user", u);
                isLogged = true;
            }
        }
        JsonObject data = new JsonObject();
        if (isLogged) {
            data.addProperty("status", "success");
        } else {
            data.addProperty("status", "fail");
        }
        return new Gson().toJson(data);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String logout(@Context HttpServletRequest request) {
        request.getSession().invalidate();
        JsonObject data = new JsonObject();
        data.addProperty("status", "success");
        return new Gson().toJson(data);
    }
}
