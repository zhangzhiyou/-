package Dao;

import Dome.Three;
import Dome.Threelogin;

import java.sql.*;

/**
 * Created by zhiyou on 15-4-26.
 */
public class Treeloginsubmitdao {
    public static void inster2(String name2,String reason,Integer classroom,String applytime1,String temail){
        Connection con= null;
        PreparedStatement stmt = null;
        Threelogin threelogin = new Threelogin();

        try {

            threelogin.setName2(name2);
          //  threelogin.setNumber2(number2);
            threelogin.setReason(reason);
            threelogin.setClassroom(classroom);
            threelogin.setApplytimet(applytime1);
            threelogin.setTemail(temail);
            con = Link.getCon();
            String sql = "insert into threetable(username,reason,classnumber,applytime1,temail) values(?,?,?,?,?);";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,threelogin.getName2());
           // stmt.setString(2,threelogin.getNumber2());
            stmt.setString(2,threelogin.getReason());
            stmt.setInt(3,threelogin.getClassroom());
            stmt.setString(4,threelogin.getApplytimet());
            stmt.setString(5,threelogin.getTemail());

            stmt.executeUpdate();
        }catch (SQLDataException e){
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delect1(String agree,String classroom,String applytime) throws Exception {
        Connection conn=null;
        PreparedStatement stmt=null;
        conn=Link.getCon();
        String sql="delete from lvtable where agree='"+agree+"'and "+"classroom='"+classroom+"'and "+" applytime='"+applytime+"';";
        stmt=conn.prepareStatement(sql);
        stmt.executeUpdate();
    }

    public static String show2()throws SQLException{
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String str =  "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\">" +
                "<tr><th>姓名</th><th>理由</th><th>教室</th><th>申请时间</th><th>邮箱</th></tr>";
        try {
            con = Link.getCon();
            stmt =  con.createStatement();
            String sql = "select distinct username,  reason, classnumber, applytime1,temail from threetable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+
                "</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>";
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
