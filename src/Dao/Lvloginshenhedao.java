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
    public static void inster1(String username,String agree,String classroom,String applytime,String unit,String fixedphone,String phone){
       Connection con = null;
        PreparedStatement stmt = null;
        Lvlogin lvlogin = new Lvlogin();
        try{
            lvlogin.setName1(username);
          //  lvlogin.setNumber1(number1);
            lvlogin.setAgree(agree);
            lvlogin.setClassrooml(classroom);
            lvlogin.setApplytimel(applytime);
            lvlogin.setUnit(unit);
            lvlogin.setFixedphone(fixedphone);
            lvlogin.setPhone(phone);
            con = Link.getCon();
            String sql = "insert into lvtable(username, agree,classroom,applytime,unit,fixedphone,phone) values(?, ?, ?,?,?,?,?);";
            stmt =con.prepareStatement(sql);
            stmt.setString(1,lvlogin.getName1());
          //  stmt.setString(2,lvlogin.getNumber1());
            stmt.setString(2,lvlogin.getAgree());
            stmt.setString(3,lvlogin.getClassrooml());
            stmt.setString(4,lvlogin.getApplytimel());
            stmt.setString(5,lvlogin.getUnit());
            stmt.setString(6,lvlogin.getFixedphone());
            stmt.setString(7,lvlogin.getPhone());
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

    public static int delecterror(String username,String agree,String classroom,String applytime) throws Exception {
        int b=0;
        Connection con=null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = Link.getCon();
            stmt = con.createStatement();
            String sql = "select DISTINCT * from lvtable where username'"+username+"'and"+" agree='" +agree +"' and "+ "classroom='" + classroom + "' and "+"applytime='" + applytime+"';";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                b++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return b;
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
        String str = "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"1000\">" +
                "<tr><th>借用单位</th><th>借用人</th><th>单位电话</th><th>借用人电话</th><th>借用时间</th><th>借用教室</th><th>审核</th></tr>";
        try{
            con = Link.getCon();
            stmt =  con.createStatement();
            sql = "select DISTINCT unit,username,fixedphone,phone,applytime,classroom,agree from lvtable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>";
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
