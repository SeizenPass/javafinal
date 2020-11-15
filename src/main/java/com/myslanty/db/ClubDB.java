package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClubDB {
    public static ClubDB clubDB = new ClubDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<Club> clubs;

    private ClubDB() {}

    public static ClubDB getInstance() {
        init();
        return clubDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM clubs");
            clubs = getDBClubs(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Club> getAllClubs() {
        return clubs;
    }

    protected static List<Club> getDBClubs(ResultSet rs) {
        List<Club> clubs = new ArrayList<>();
        try {
            Club club;
            while(rs.next()) {
                club = new Club();
                club.setId(rs.getInt(1));
                club.setClubName(rs.getString(2));
                club.setDescription(rs.getString(3));
                clubs.add(club);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubs;
    }
}
