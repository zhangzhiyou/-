package Dao;

import model.Lvlo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-23.
 */
public class Lvlogindao {
    public Lvlo login1(Connection con, Lvlo lv) throws SQLException {
        Lvlo resultLvlo = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "select * from lvmima where name2=? and password2=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, lv.getUsername1());
            pstmt.setString(2, lv.getPassword1());
            ResultSet rs = pstmt.executeQuery();//pstmt.executeQuery()执行的结果
            if (rs.next()) {
                resultLvlo = new Lvlo();
                //todo
                resultLvlo.setUsername1(rs.getString("name2"));
                resultLvlo.setPassword1(rs.getString("password2"));
            }
            return resultLvlo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultLvlo;
    }

}
