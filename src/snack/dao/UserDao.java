package snack.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import snack.bean.UserBean;

public class UserDao extends DaoBase{

    public UserBean auth(String email,String password) {
        if(con == null) {
            return null;
        }

        PreparedStatement stmt = null;
        ResultSet rs = null;
        UserBean userbean = null;

        try {
            stmt = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");

            stmt.setString(1, email);
            stmt.setString(2 ,password);
            rs = stmt.executeQuery();

            while(rs.next()) {
                userbean = new UserBean();

                userbean.setId(rs.getInt("id"));
                userbean.setType(rs.getString("type"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return userbean;

    }

}