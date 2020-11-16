package com.myslanty.db;

import com.myslanty.models.Club;
import com.myslanty.models.DictionaryContentPrivilege;
import com.myslanty.models.DictionaryUserPrivilege;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DictionaryUserPrivilegeDB {
    public static DictionaryUserPrivilegeDB dictionaryUserPrivilegeDB = new DictionaryUserPrivilegeDB();
    private static Connection cn = PortalRepository.getInstance().getConnection();
    private static Map<Integer, DictionaryUserPrivilege> userPrivilegeMap;

    private DictionaryUserPrivilegeDB() {}

    public static DictionaryUserPrivilegeDB getInstance() {
        init();
        return dictionaryUserPrivilegeDB;
    }

    private static void init() {
        try {
            Statement s = cn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM dic_user_privs");
            userPrivilegeMap = getDBUserPrivileges(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected static Map<Integer, DictionaryUserPrivilege> getDBUserPrivileges(ResultSet rs) {
        Map<Integer, DictionaryUserPrivilege> userPrivilegeMap = new HashMap<>();
        try {
            DictionaryUserPrivilege userPrivilege;
            while(rs.next()) {
                userPrivilege = new DictionaryUserPrivilege();
                userPrivilege.setId(rs.getInt(1));
                userPrivilege.setName(rs.getString(2));
                userPrivilegeMap.put(userPrivilege.getId(),userPrivilege);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userPrivilegeMap;
    }

    public List<DictionaryUserPrivilege> getAllUserPrivileges() {
        List<DictionaryUserPrivilege> list = new ArrayList<>();
        for (Integer s:
                userPrivilegeMap.keySet()) {
            list.add(userPrivilegeMap.get(s));
        }
        return list;
    }

    public DictionaryUserPrivilege getUserPrivilegeById(int id) {
        return userPrivilegeMap.get(id);
    }
}
