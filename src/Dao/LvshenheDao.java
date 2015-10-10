package Dao;

import Email.SendEmail;
import Paging.Pagebean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-8-8.
 */
public class LvshenheDao {
    //todo 查出选中那条的信息,在sql语句中可以再套用sql语句
    public void chooseinformantion(Connection con, int id,String agree) throws Exception{
        String sql = "select username,classnumber,applytime1,temail ,unit,phone,fixedphone from threetable where id="+id;
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            String tusername = rs.getString(1);
            String tclassnumber = rs.getString(2);
            String tapplytime = rs.getString(3);
            String temail = rs.getString(4);
            String tunit = rs.getString(5);
            String tphone = rs.getString(6);
            String tfixedphone = rs.getString(7);
            //todo 发送电子邮件
//            SendEmail sendEmail = new SendEmail();
//            sendEmail.lvsendemail(tusername,agree,tclassnumber,temail);

           String sql1="insert into lvtable(username,agree,classroom,applytime,unit,fixedphone,phone) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt1=con.prepareStatement(sql1);
            pstmt1.setString(1,tusername);
            pstmt1.setString(2,agree);
            pstmt1.setString(3,tclassnumber);
            pstmt1.setString(4,tapplytime);
            pstmt1.setString(5,tunit);
            pstmt1.setString(6,tfixedphone);
            pstmt1.setString(7,tphone);
            pstmt1.executeUpdate();
        }

    }
    //删除审核完的数据
    public int deleteexam(Connection con, int id) throws Exception{
        String sql = "delete from threetable where id="+id;
        PreparedStatement pstmt = con.prepareStatement(sql);
        return pstmt.executeUpdate();
    }

    public ResultSet gradelist (Connection con, Pagebean pagebean) throws SQLException {


        StringBuilder sb = new StringBuilder("select * from threetable");//表示从数据库中查到的所有的内容反转，然后形成新的字符串sb
        if(pagebean!=null){
            sb.append(" limit "+pagebean.getStart()+","+pagebean.getRows());
        }
        PreparedStatement pstmt = con.prepareStatement(sb.toString());//把的append追加的值转换成toString类型
        return pstmt.executeQuery();
        //  return pstmt.executeQuery();//返回，转化后的值
    }
    //计算一共有多少条记录
    public int gradeCount(Connection con) throws Exception{//获取总计录数
        String sql = "select count(*) as total from threetable";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            return rs.getInt("total");
        }else {
            return 0;
        }
    }
}
