package Dao;

import Dome.Jiaocaikelogin;

import java.sql.*;

/**
 * Created by zhiyou on 15-4-26.
 */
public class Jiaocaikesubmitdao {
    public static void inster2(String name2,String reason,String classroom,String applytime1,String temail,String unit,String phone,String fixedphone){
        Connection con= null;
        PreparedStatement stmt = null;
        Jiaocaikelogin jiaocaikelogin = new Jiaocaikelogin();
        try {

            jiaocaikelogin.setName2(name2);
          //  threelogin.setNumber2(number2);
            jiaocaikelogin.setReason(reason);
            jiaocaikelogin.setClassroom(classroom);
            jiaocaikelogin.setApplytimet(applytime1);
            jiaocaikelogin.setTemail(temail);
            jiaocaikelogin.setUnit(unit);
            jiaocaikelogin.setPhone(phone);
            jiaocaikelogin.setFixedphone(fixedphone);

            con = Link.getCon();
            String sql = "insert into threetable(username,reason,classnumber,applytime1,temail,unit,phone,fixedphone) values(?,?,?,?,?,?,?,?);";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,jiaocaikelogin.getName2());
           // stmt.setString(2,threelogin.getNumber2());
            stmt.setString(2,jiaocaikelogin.getReason());
            stmt.setString(3, jiaocaikelogin.getClassroom());
            stmt.setString(4,jiaocaikelogin.getApplytimet());
            stmt.setString(5,jiaocaikelogin.getTemail());
            stmt.setString(6,jiaocaikelogin.getUnit());
            stmt.setString(7,jiaocaikelogin.getPhone());
            stmt.setString(8,jiaocaikelogin.getFixedphone());

            stmt.executeUpdate();
        }catch (SQLDataException e){
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //判断老师所审核的学生是否在名单中
    public static int judge(String name2,String classroom,String applytime1,String unit,String phone,String fixedphone){
     int d=0;
        Connection con =null;
        Statement stam = null;
        ResultSet rs = null;
        try {
            con = Link.getCon();
            stam = con.createStatement();
            String sql="select DISTINCT * from threetable where username='"+name2+"'and unit='"+unit+"' and  phone='"+phone+"'AND fixedphone='"+fixedphone+"'AND "+"classnumber='" + classroom + " 'and " +"applytime1='" + applytime1+"';";
            rs = stam.executeQuery(sql);
            while (rs.next()){
                d++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return d;
    }

    //把审核完的人员从名单中删除
    public static void delect1( String username, String agree,String classroom,String applytime) throws Exception {
        Connection conn=null;
        PreparedStatement stmt=null;
        conn=Link.getCon();
        String sql="delete from lvtable where username='"+username+"'and"+" agree='"+agree+"'and "+"classroom='"+classroom+" 'and "+" applytime='"+applytime+"';";
        stmt=conn.prepareStatement(sql);
          stmt.executeUpdate();
    }

    public static String show2()throws SQLException{
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String str =  "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"1000\">" +
                "<tr><th>借用单位</th><th>借用人</th><th>单位电话</th><th>借用人电话</th><th>借用时间</th><th>借用教室</th><th>借用理由</th><th>借用人邮箱</th></tr>";
        try {
            con = Link.getCon();
            stmt =  con.createStatement();
            String sql = "select distinct unit,  username, fixedphone, phone,applytime1,classnumber,reason,temail from threetable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+
                "</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getInt(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td></tr>";
            }
            str +="</table>";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    public static int choosecorrect(String name,String classroom,String applytime) throws Exception {
        int a=0;
        Connection con=null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            con = Link.getCon();
            stmt = con.createStatement();
            String sql = "select DISTINCT * from threetable where username='" +name+"' and "+"classnumber='" + classroom + "' and "+"applytime1='" + applytime+"';";
            rs = stmt.executeQuery(sql);
            while (rs.next()){
                a++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return a;
    }

}
