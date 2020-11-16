package com.myslanty.db;

import com.myslanty.models.Event;
import com.myslanty.models.Group;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GroupDB {
    public static GroupDB groupDB = new GroupDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<Group> groups;

    private GroupDB() {}

    public static GroupDB getInstance() {
        init();
        return groupDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM groups");
            groups = getDBGroups(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected static List<Group> getDBGroups(ResultSet rs) {
        List<Group> groups = new ArrayList<>();
        try {
            Group group;
            while(rs.next()) {
                group = new Group();
                group.setId(rs.getInt(1));
                group.setPostfix(rs.getString(2));
                groups.add(group);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groups;
    }

    public List<Group> getAllGroups() {
        return groups;
    }

    public Group getGroupById(int id) {
        for (Group g:
             groups) {
            if (g.getId() == id) {
                return g;
            }
        }
        return null;
    }
}
