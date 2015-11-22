package Dao;

import model.Administrator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by zhiyou on 15-11-21.
 */
public class AdministratorDao {
    public Administrator select(String username,String passsword,Administrator administrator1){
        String sql = "select * from administrator where username = ? and password=? ";
        Connection con=null;
        Administrator administrator = null;
        PreparedStatement pratm=null;
        try {
            con = Link.getCon();
            pratm = con.prepareStatement(sql);
            pratm.setString(1,administrator1.getUsername());
            pratm.setString(2,administrator1.getPassword());
            ResultSet rs= pratm.executeQuery();
            while (rs.next()){
                administrator = new Administrator();
                administrator.setUsername(rs.getString("username"));
                administrator.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return administrator;
    }
}
