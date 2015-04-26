package Dao;

import Dome.Three;
import sun.reflect.generics.tree.Tree;

import java.sql.*;

/**
 * Created by zhiyou on 15-4-24.
 */
public class Treelogindao {
    public Three login2(Connection con, Three three) throws SQLException {
        Three resultthree = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "select * from three where name1=? and password1=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, three.getUsername2());
            pstmt.setString(2, three.getPassword2());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                resultthree = new Three();
                resultthree.setUsername2(rs.getString("name1"));
                resultthree.setPassword2(rs.getString("password1"));

            }
            return  resultthree;
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultthree;
    }
}
