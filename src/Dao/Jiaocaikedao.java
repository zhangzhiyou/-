package Dao;

import model.Jiaocaike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-7-3.
 */
public class Jiaocaikedao {
    public Jiaocaike login3(Connection con, Jiaocaike jiaocaike) throws SQLException {
        Jiaocaike resultthree = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "select * from jiaocaike where name2=? and password2=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, jiaocaike.getUsername3());
            pstmt.setString(2, jiaocaike.getPassword3());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                resultthree = new Jiaocaike();
                resultthree.setUsername3(rs.getString("name2"));
                resultthree.setPassword3(rs.getString("password2"));

            }
            return  resultthree;
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultthree;
    }
}
