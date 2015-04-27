package Dao;

import Dome.Lvlogin;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

/**
 * Created by zhiyou on 15-4-25.
 */
public class Lvloginshenhedao  {
    public static void inster1(String name1,String number1,String agree){
       Connection con = null;
        PreparedStatement stmt = null;
        Lvlogin lvlogin = new Lvlogin();


        try{
            lvlogin.setName1(name1);
            lvlogin.setNumber1(number1);
            lvlogin.setAgree(agree);
            con = Link.getCon();
            String sql = "insert into lvtable(username, number, agree) values(?, ?, ?);";
            stmt =con.prepareStatement(sql);
            stmt.setString(1,lvlogin.getName1());
            stmt.setString(2,lvlogin.getNumber1());
            stmt.setString(3,lvlogin.getAgree());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
    public static void delect(Integer id) throws Exception {
        Connection conn=null;
        PreparedStatement stmt=null;
        conn=Link.getCon();
        String sql="delete from threetable where id="+id;
        stmt=conn.prepareStatement(sql);
        stmt.executeUpdate();
    }
    public static String show1() throws SQLException{
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql;
        String str = "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\">" +
                "<tr><th>id</th><th>姓名</th><th>学号</th><th>审核</th></tr>";
        try{

            con = Link.getCon();
            stmt =  con.createStatement();
            sql = "select id, username,number,agree from lvtable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><th>"+rs.getInt(1)+"</th><th>"+rs.getString(2)+"</th><th>"+rs.getString(3)+"</th><th>"+rs.getString(4)+"</th></tr>";
            }
            str += "</table>";
        }catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }
}
