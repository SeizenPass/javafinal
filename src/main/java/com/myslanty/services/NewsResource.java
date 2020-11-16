package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.myslanty.db.NewsDB;
import com.myslanty.models.News;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("news")
public class NewsResource {
    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public News getNewsById(@PathParam("id") int id) {
        return NewsDB.getInstance().getNewsById(id);
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteNewsById(@PathParam("id") int id) {
        NewsDB.getInstance().deleteNews(id);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addNews(News newobj) {
        NewsDB.getInstance().addNews(newobj);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<News> getAllNews() {
        return NewsDB.getInstance().getAllNews();
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    public String updateNewsById(News news) {
        NewsDB.getInstance().updateNews(news);
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<News> getClubNewsByClubId(@PathParam("id") int id) {
        return NewsDB.getInstance().getClubNewsByClubId(id);
    }
}
