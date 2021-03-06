package Dao;

import Paging.Pagebean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-8-5.
 */
public class ManageDao {
    public ResultSet gradelist (Connection con, Pagebean pagebean) throws SQLException {

        StringBuilder sb = new StringBuilder("select * from threetable");//表示从数据库中查到的所有的内容反转，然后形成新的字符串sb
        if(pagebean!=null){
            // sb.append("limit").append(pagebean.getPage()).append(',').append(pagebean.getRows());//追加内容到当前Stringbuffer对象的末尾
            sb.append(" limit "+pagebean.getStart()+","+pagebean.getRows());
        }
        PreparedStatement pstmt = con.prepareStatement(sb.toString());//把的append追加的值转换成toString类型

        return pstmt.executeQuery();
        //  return pstmt.executeQuery();//返回，转化后的值
    }
    public int gradeCount(Connection con) throws Exception{//获取总计录数
        String sql = "select count(*) as total from threetable";
        PreparedStatement pstmt = con.prepareStatement(sql.toString());
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            return rs.getInt("total");
        }else {
            return 0;
        }
    }

    /**
     * 删除审核完的记录
     * */
    public int gradeDelete(Connection con,String delIds)throws Exception{
        String sql = "delete from threetable where id in("+delIds+")";
        PreparedStatement psmtp = con.prepareStatement(sql);
        return psmtp.executeUpdate();
    }

}
