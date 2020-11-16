package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.ClubMembership;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClubMembershipDB {
    public static ClubMembershipDB clubMembershipDB = new ClubMembershipDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<ClubMembership> clubMemberships;

    private ClubMembershipDB() {}

    public static ClubMembershipDB getInstance() {
        init();
        return clubMembershipDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM clubs_membership");
            clubMemberships = getDBClubMemberships(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ClubMembership> getAllClubMemberships() {
        return clubMemberships;
    }

    public void addSubscriberToClub(int user_id, int club_id, int priv_id) {
        try {
            PreparedStatement ps =
                    cn.prepareStatement("INSERT INTO " +
                            "clubs_membership " +
                            "VALUES (?, ?, ?)");
            ps.setInt(1, user_id);
            ps.setInt(2, club_id);
            ps.setInt(3, priv_id);
            ps.executeUpdate();
            ps.close();
            ClubMembership cm = new ClubMembership();
            cm.setPrivId(priv_id);
            cm.setClubId(club_id);
            cm.setUserId(user_id);
            clubMemberships.add(cm);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSubscriberFromClub(int user_id, int club_id) {
        clubMemberships.removeIf(cm -> cm.getClubId() == club_id && cm.getUserId() == user_id);
        try {
            PreparedStatement ps = cn.prepareStatement("DELETE FROM clubs_membership " +
                    "WHERE user_id=? AND club_id=?");
            ps.setInt(1, user_id);
            ps.setInt(2, club_id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changePrivilege(int user_id, int club_id, int priv_id) {
        for (ClubMembership cm: clubMemberships) {
            if (cm.getUserId() == user_id && cm.getClubId() == club_id) {
                cm.setPrivId(priv_id);
            }
        }
        try {
            PreparedStatement ps = cn.prepareStatement("UPDATE clubs_membership " +
                    "SET priv_id=? " +
                    "WHERE user_id=? AND club_id=?");
            ps.setInt(1, priv_id);
            ps.setInt(2, user_id);
            ps.setInt(3, club_id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected static List<ClubMembership> getDBClubMemberships(ResultSet rs) {
        List<ClubMembership> clubMemberships = new ArrayList<>();
        try {
            ClubMembership clubMembership;
            while(rs.next()) {
                clubMembership = new ClubMembership();
                clubMembership.setUserId(rs.getInt(1));
                clubMembership.setClubId(rs.getInt(2));
                clubMembership.setPrivId(rs.getInt(3));
                clubMemberships.add(clubMembership);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clubMemberships;
    }
}
