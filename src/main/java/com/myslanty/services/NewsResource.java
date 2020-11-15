package com.myslanty.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
        //TODO implement
        News news = new News();
        news.setId(id);
        return news;
    }

    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteNewsById(@PathParam("id") int id) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("status", "success");
        return new Gson().toJson(json);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String addNews(News newobj) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("id", 9999);
        return new Gson().toJson(json);
    }

    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<News> getAllNews() {
        //TODO implement
        List<News> list = new ArrayList<>();
        News news = new News();
        news.setId(1);
        list.add(news);
        news = new News();
        news.setId(2);
        list.add(news);
        return list;
    }

    @PUT
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String updateNewsById(@PathParam("id") int id) {
        //TODO implement
        JsonObject json = new JsonObject();
        json.addProperty("id", id);
        return new Gson().toJson(json);
    }

    @GET
    @Path("club/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<News> getClubNewsByClubId(@PathParam("id") int id) {
        //TODO implement
        List<News> list = new ArrayList<>();
        News news = new News();
        news.setId(1);
        news.setClubId(id);
        list.add(news);
        news = new News();
        news.setId(2);
        news.setClubId(id);
        list.add(news);
        return list;
    }
}
