package Dao;

import Dome.Lvlogin;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.Scanner;

/**
 * Created by zhiyou on 15-4-25.
 */
public class Lvloginshenhedao  {
    public static void inster1(String name1,String number1,String agree,String classroom,String applytime){
       Connection con = null;
        PreparedStatement stmt = null;
        Lvlogin lvlogin = new Lvlogin();
        try{
            lvlogin.setName1(name1);
            lvlogin.setNumber1(number1);
            lvlogin.setAgree(agree);
            lvlogin.setClassrooml(classroom);
            lvlogin.setApplytimel(applytime);
            con = Link.getCon();
            String sql = "insert into lvtable(username, number, agree,classroom,applytime) values(?, ?, ?,?,?);";
            stmt =con.prepareStatement(sql);
            stmt.setString(1,lvlogin.getName1());
            stmt.setString(2,lvlogin.getNumber1());
            stmt.setString(3,lvlogin.getAgree());
            stmt.setString(4,lvlogin.getClassrooml());
            stmt.setString(5,lvlogin.getApplytimel());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static int choosecorrect(String agree,String classroom,String applytime) throws Exception {
        int a=0;
        Connection con=null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = Link.getCon();
            stmt = con.createStatement();
            String sql = "select * from lvtable where agree='" +agree +"' and "+ "classroom='" + classroom + "' and "+"applytime='" + applytime+"';";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                a++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return a;
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
                "<tr><th>姓名</th><th>学号</th><th>审核</th><th>教室</th><th>申请时间</th></tr>";
        try{
            con = Link.getCon();
            stmt =  con.createStatement();
            sql = "select  username,number,agree,classroom,applytime from lvtable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){

                str = str+"<tr><th>"+rs.getString(1)+"</th><th>"+rs.getString(2)+"</th><th>"+rs.getString(3)+"</th><th>"+rs.getString(4)+"</th><th>"+rs.getString(5)+"</th></tr>";
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
