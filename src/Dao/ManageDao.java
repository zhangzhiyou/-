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

        StringBuilder sb = new StringBuilder("select * from lvtable");//表示从数据库中查到的所有的内容反转，然后形成新的字符串sb
        if(pagebean!=null){
            // sb.append("limit").append(pagebean.getPage()).append(',').append(pagebean.getRows());//追加内容到当前Stringbuffer对象的末尾
            sb.append(" limit "+pagebean.getStart()+","+pagebean.getRows());
        }
        PreparedStatement pstmt = con.prepareStatement(sb.toString());//把的append追加的值转换成toString类型
        System.out.println("22222"+pstmt.executeQuery());
        return pstmt.executeQuery();
        //  return pstmt.executeQuery();//返回，转化后的值
    }
    public int gradeCount(Connection con) throws Exception{//获取总计录数
        String sql = "select count(*) as total from lvtable";
        PreparedStatement pstmt = con.prepareStatement(sql.toString());
        ResultSet rs = pstmt.executeQuery();
        System.out.println("33333"+rs);
        if(rs.next()){
            return rs.getInt("total");
        }else {
            return 0;
        }
    }
}
