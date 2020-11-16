package com.myslanty.db;

import com.myslanty.models.Group;
import com.myslanty.models.Major;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MajorDB {
    public static MajorDB majorDB = new MajorDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<Major> majors;

    private MajorDB() {}

    public static MajorDB getInstance() {
        init();
        return majorDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM majors");
            majors = getDBMajors(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected static List<Major> getDBMajors(ResultSet rs) {
        List<Major> majors = new ArrayList<>();
        try {
            Major major;
            while(rs.next()) {
                major = new Major();
                major.setId(rs.getInt(1));
                major.setMajorName(rs.getString(2));
                majors.add(major);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return majors;
    }

    public List<Major> getAllMajors() {
        return majors;
    }

    public Major getMajorById(int id) {
        for (Major m:
             majors) {
            if (m.getId() == id) {
                return m;
            }
        }
        return null;
    }
}
