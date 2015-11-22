package Dao;

import Paging.Pagebean;
import model.Three;

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
    public ResultSet threelist(Connection con, Pagebean pagebean) throws SQLException {
        StringBuffer sb = new StringBuffer("select * from three");
        if(pagebean!=null){
            sb.append(" limit "+pagebean.getStart()+","+pagebean.getRows());
        }
        PreparedStatement prmt = con.prepareStatement(sb.toString());
        return prmt.executeQuery();
    }

    /***
     * 统计一共多少条申请数据
     * */
    public int threeCount(Connection con) throws SQLException {
        String sql = "select count(*) as total from three";
        PreparedStatement premt = con.prepareStatement(sql);
        ResultSet rs = premt.executeQuery();
        if(rs.next()){
            return rs.getInt("total");
        }
      else {
            return 0;
        }
    }

    /***
     * 删除审核用户
     * */
        public int threedelete(Connection con , String deiLds) throws Exception {
            String sql = "delete from three where id in("+deiLds+")";
            PreparedStatement premt = con.prepareStatement(sql);
            return premt.executeUpdate();
        }
 }
