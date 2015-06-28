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
    //todo 添加申请教室学生的名单
    public static void inster1(String name1,String agree,String classroom,String applytime){
       Connection con = null;
        PreparedStatement stmt = null;
        Lvlogin lvlogin = new Lvlogin();
        try{
            lvlogin.setName1(name1);
          //  lvlogin.setNumber1(number1);
            lvlogin.setAgree(agree);
            lvlogin.setClassrooml(classroom);
            lvlogin.setApplytimel(applytime);
            con = Link.getCon();
            String sql = "insert into lvtable(username, agree,classroom,applytime) values(?, ?, ?,?);";
            stmt =con.prepareStatement(sql);
            stmt.setString(1,lvlogin.getName1());
          //  stmt.setString(2,lvlogin.getNumber1());
            stmt.setString(2,lvlogin.getAgree());
            stmt.setString(3,lvlogin.getClassrooml());
            stmt.setString(4,lvlogin.getApplytimel());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
        //审核申请的学生
    public static int choosecorrect(String agree,String classroom,String applytime) throws Exception {
        int a=0;
        Connection con=null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = Link.getCon();
            stmt = con.createStatement();
            String sql = "select DISTINCT * from lvtable where agree='" +agree +"' and "+ "classroom='" + classroom + "' and "+"applytime='" + applytime+"';";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                a++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return a;
    }

    public static void delect(String name,String classroom,String applytime) throws Exception {
        Connection conn=null;
        PreparedStatement stmt=null;
        conn=Link.getCon();
        String sql="delete from threetable where username='"+name+"'AND classnumber='"+classroom+"'and applytime1='"+applytime+"';";
        stmt=conn.prepareStatement(sql);
        stmt.executeUpdate();
    }
    public static String show1() throws SQLException{
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql;
        String str = "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\">" +
                "<tr><th>姓名</th><th>审核</th><th>教室</th><th>申请时间</th></tr>";
        try{
            con = Link.getCon();
            stmt =  con.createStatement();
            sql = "select DISTINCT username,agree,classroom,applytime from lvtable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>";
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
