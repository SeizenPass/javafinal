package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.News;
import com.myslanty.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDB {
    public static NewsDB newsDB = new NewsDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static List<News> news;

    private NewsDB() {}

    public static NewsDB getInstance() {
        init();
        return newsDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM news");
            news = getDBNews(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected static List<News> getDBNews(ResultSet rs) {
        List<News> news = new ArrayList<>();
        try {
            News news1;
            while (rs.next()) {
                news1 = new News();
                news1.setId(rs.getInt(1));
                news1.setTitle(rs.getString(2));
                news1.setContent(rs.getString(3));
                news1.setPublishDate(rs.getTimestamp(4));
                news1.setClubId(rs.getInt(5));
                news.add(news1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    //methods
    public News getNewsById(int id) {
        for (News n:
             news) {
            if (n.getId() == id) {
                return n;
            }
        }
        return null;
    }

    public void deleteNews(int id) {
        news.removeIf(n -> n.getId() == id);
        try {
            PreparedStatement ps = cn.prepareStatement("DELETE FROM news " +
                    "WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addNews(News news1) {
        int id = 0;
        try {
            PreparedStatement ps =
                    cn.prepareStatement("INSERT INTO " +
                            "news(title, content, club_id) " +
                            "VALUES (?, ?, ?)");
            ps.setString(1, news1.getTitle());
            ps.setString(2, news1.getContent());
            ps.setInt(3, news1.getClubId());
            ps.executeUpdate();
            ps.close();
            ps = cn.prepareStatement("SELECT currval('news_id_seq'::regclass)");
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                id = res.getInt(1);
            }
            news1.setId(id);
            news.add(news1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<News> getAllNews() {
        return news;
    }

    public void updateNews(News news1) {
        for (News n : news) {
            if (n.getId() == news1.getId()) {
                n.setTitle(news1.getTitle());
                n.setContent(news1.getContent());
                break;
            }
        }
        try {
            PreparedStatement ps = cn.prepareStatement("UPDATE news " +
                    "SET title=?, content=? " +
                    "WHERE id=?");
            ps.setString(1, news1.getTitle());
            ps.setString(2, news1.getContent());
            ps.setInt(3, news1.getId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<News> getClubNewsByClubId(int id) {
        List<News> newsList = new ArrayList<>();
        for (News n:
             news) {
            if (n.getClubId() == id) {
                newsList.add(n);
            }
        }
        return newsList;
    }
}
