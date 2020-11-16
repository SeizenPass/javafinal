package com.myslanty.db;


import com.myslanty.models.Club;
import com.myslanty.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserDB {
    public static UserDB userDB = new UserDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<User> users;

    private UserDB() {}

    public static UserDB getInstance() {
        init();
        return userDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM users");
            users = getDBUsers(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        return users;
    }

    public User getUserById(int id) {
        for (User u : users) {
            if (u.getId() == id) {
                return u.copyWithoutPassword();
            }
        }
        return null;
    }

    public void addUser(User user) {
        int id = 0;
        try {
            PreparedStatement ps =
                    cn.prepareStatement("INSERT INTO " +
                            "users(name, surname, priv_id, major_id, email, group_id, graduation_year, password) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getSurname());
            ps.setInt(3, user.getPrivId());
            ps.setInt(4, user.getMajorId());
            ps.setString(5, user.getEmail());
            ps.setInt(6, user.getGroupId());
            ps.setInt(7, user.getGraduationYear());
            ps.setString(8, user.getPassword());
            ps.executeUpdate();
            ps.close();
            ps = cn.prepareStatement("SELECT currval('users_id_seq'::regclass)");
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                id = res.getInt(1);
            }
            user.setId(id);
            users.add(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        users.removeIf(u -> u.getId() == id);
        try {
            PreparedStatement ps = cn.prepareStatement("DELETE FROM users " +
                    "WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Club> getUserClubs(int id) {
        try {
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM clubs " +
                    "WHERE id IN (SELECT club_id FROM clubs_membership WHERE user_id = ?)");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return ClubDB.getDBClubs(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getUsersByClubId(int id) {
        try {
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM users " +
                    "WHERE id IN (SELECT user_id FROM clubs_membership WHERE club_id = ?)");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return getDBUsers(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<User> findUsers(User user) {
        List<User> matchList = new ArrayList<>();
        Pattern namePattern = Pattern.compile(user.getName(), Pattern.CASE_INSENSITIVE);
        Pattern surnamePattern = Pattern.compile(user.getSurname(), Pattern.CASE_INSENSITIVE);
        Pattern emailPattern = Pattern.compile(user.getEmail(), Pattern.CASE_INSENSITIVE);
        Matcher matcher;
        User copy;
        for (User u:
             users) {
            if (u.getMajorId() == user.getMajorId() || user.getMajorId() == 0) {
                if (u.getGroupId() == user.getGroupId() || user.getGroupId() == 0) {
                    if (u.getGraduationYear() == user.getGraduationYear() || user.getGraduationYear() == 0) {
                        matcher = emailPattern.matcher(u.getEmail());
                        if (matcher.find()) {
                            matcher = namePattern.matcher(u.getName());
                            if (matcher.find()) {
                                matcher = surnamePattern.matcher((u.getSurname()));
                                if (matcher.find()) {
                                    copy = u.copyWithoutPassword();
                                    matchList.add(copy);
                                }
                            }
                        }
                    }
                }
            }
        }
        return matchList;
    }

    protected static List<User> getDBUsers(ResultSet rs) {
        List<User> users = new ArrayList<>();
        try {
            User user;
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setSurname(rs.getString(3));
                user.setPrivId(rs.getInt(4));
                user.setMajorId(rs.getInt(5));
                user.setEmail(rs.getString(6));
                user.setGroupId(rs.getInt(7));
                user.setGraduationYear(rs.getInt(8));
                user.setPassword(rs.getString(9));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
