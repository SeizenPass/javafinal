package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.User;

import java.sql.*;
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

    public Club getClubById(int id) {
        for (Club c : clubs) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    public void addClub(Club club) {
        int id = 0;
        try {
            PreparedStatement ps =
                    cn.prepareStatement("INSERT INTO " +
                            "clubs(club_name, description) " +
                            "VALUES (?, ?)");
            ps.setString(1, club.getClubName());
            ps.setString(2, club.getDescription());
            ps.executeUpdate();
            ps.close();
            ps = cn.prepareStatement("SELECT currval('clubs_id_seq'::regclass)");
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                id = res.getInt(1);
            }
            club.setId(id);
            clubs.add(club);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteClub(int id) {
        clubs.removeIf(c -> c.getId() == id);
        try {
            PreparedStatement ps = cn.prepareStatement("DELETE FROM clubs " +
                    "WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateClub(Club club) {
        for (Club c : clubs) {
            if (c.getId() == club.getId()) {
                c.setClubName(club.getClubName());
                c.setDescription(club.getDescription());
                break;
            }
        }
        try {
            PreparedStatement ps = cn.prepareStatement("UPDATE clubs " +
                    "SET club_name=?, description=? " +
                    "WHERE id=?");
            ps.setString(1, club.getClubName());
            ps.setString(2, club.getDescription());
            ps.setInt(3, club.getId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
