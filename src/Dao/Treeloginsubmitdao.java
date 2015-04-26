package Dao;

import Dome.Three;
import Dome.Threelogin;

import java.sql.*;

/**
 * Created by zhiyou on 15-4-26.
 */
public class Treeloginsubmitdao {
    public static void inster2(String name2,String number2,String reason,Integer classroom){
        Connection con= null;
        PreparedStatement stmt = null;
        Threelogin threelogin = new Threelogin();

        try {


            threelogin.setName2(name2);
            threelogin.setNumber2(number2);
            threelogin.setReason(reason);
            threelogin.setClassroom(classroom);
            con = Link.getCon();
            String sql = "insert into threetable(username,number1,reason,classnumber) values(?,?,?,?);";
            stmt=con.prepareStatement(sql);
            stmt.setString(1,threelogin.getName2());
            stmt.setString(2,threelogin.getNumber2());
            stmt.setString(3,threelogin.getReason());
            stmt.setInt(4,threelogin.getClassroom());
            stmt.executeUpdate();
        }catch (SQLDataException e){
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String show2()throws SQLException{
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String str =  "<table  border=\"1\" bordercolor=\"black\" cellpadding=\"10\" cellspacing=\"0\" width=\"500\">" +
                "<tr><th>姓名</th><th>学号</th><th>理由</th><th>教室</th></tr>";
        try {
            con = Link.getCon();
            stmt =  con.createStatement();
            String sql = "select username,number1,reason,classnumber from threetable";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                str = str+"<tr><th>"+rs.getString(1)+"</th><th>"+rs.getString(2)+"</th><th>"+rs.getString(3)+"</th><th>"+rs.getInt(4)+
                "</th></tr>";
            }
            str +="</table>";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

}
