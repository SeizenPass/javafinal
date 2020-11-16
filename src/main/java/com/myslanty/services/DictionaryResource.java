package com.myslanty.services;

import com.myslanty.db.DictionaryContentPrivilegeDB;
import com.myslanty.db.DictionaryUserPrivilegeDB;
import com.myslanty.models.DictionaryContentPrivilege;
import com.myslanty.models.DictionaryUserPrivilege;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.util.List;

@Path("/dictionary")
public class DictionaryResource {

    @GET
    @Path("content/getAll")
    public List<DictionaryContentPrivilege> getAllContentPrivileges() {
        return DictionaryContentPrivilegeDB.getInstance().getAllContentPrivileges();
    }

    @GET
    @Path("content/{id}")
    public DictionaryContentPrivilege getContentPrivilegeById(@PathParam("id") int id) {
        return DictionaryContentPrivilegeDB.getInstance().getContentPrivilegeById(id);
    }

    @Path("user/getAll")
    @GET
    public List<DictionaryUserPrivilege> getAllUserPrivileges() {
        return DictionaryUserPrivilegeDB.getInstance().getAllUserPrivileges();
    }

    @GET
    @Path("user/{id}")
    public DictionaryUserPrivilege getUserPrivilegeById(@PathParam("id") int id) {
        return DictionaryUserPrivilegeDB.getInstance().getUserPrivilegeById(id);
    }
}
