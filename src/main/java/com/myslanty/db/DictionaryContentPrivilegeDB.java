package com.myslanty.db;

import com.myslanty.models.DictionaryContentPrivilege;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class DictionaryContentPrivilegeDB {
    public static DictionaryContentPrivilegeDB dictionaryContentPrivilegeDB = new DictionaryContentPrivilegeDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static Map<Integer, DictionaryContentPrivilege> contentPrivilegeMap;

    private DictionaryContentPrivilegeDB() {}

    public static DictionaryContentPrivilegeDB getInstance() {
        init();
        return dictionaryContentPrivilegeDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM dic_content_privs");
            contentPrivilegeMap = getDBContentPrivileges(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected static Map<Integer, DictionaryContentPrivilege> getDBContentPrivileges(ResultSet rs) {
        Map<Integer, DictionaryContentPrivilege> contentPrivilegeMap = new HashMap<>();
        try {
            DictionaryContentPrivilege contentPrivilege;
            while(rs.next()) {
                contentPrivilege = new DictionaryContentPrivilege();
                contentPrivilege.setId(rs.getInt(1));
                contentPrivilege.setName(rs.getString(2));
                contentPrivilegeMap.put(contentPrivilege.getId(),contentPrivilege);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contentPrivilegeMap;
    }
}
