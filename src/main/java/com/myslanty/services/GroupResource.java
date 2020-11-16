package com.myslanty.services;

import com.myslanty.db.GroupDB;
import com.myslanty.models.Group;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("groups")
@Produces(MediaType.APPLICATION_JSON)
public class GroupResource {

    @GET
    public List<Group> getAllGroups() {
        return GroupDB.getInstance().getAllGroups();
    }

    @GET
    @Path("{id}")
    public Group getGroupById(@PathParam("id") int id) {
        return GroupDB.getInstance().getGroupById(id);
    }
}
