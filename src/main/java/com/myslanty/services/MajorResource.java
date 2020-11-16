package com.myslanty.services;

import com.myslanty.db.MajorDB;
import com.myslanty.models.Major;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.util.List;

@Path("majors")
public class MajorResource {
    @GET
    public List<Major> getAllMajors() {
        return MajorDB.getInstance().getAllMajors();
    }

    @GET
    @Path("{id}")
    public Major getMajorById(@PathParam("id") int id) {
        return MajorDB.getInstance().getMajorById(id);
    }
}
