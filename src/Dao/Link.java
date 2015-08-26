package Dao;

import java.sql.*;

/**
 * Created by zhiyou on 15-4-23.
 */
public class Link {
  static   String url = "jdbc:mysql://localhost:3306/classes?"
            + "user=root&password=0000&useUnicode=true&characterEncoding=UTF8";

// static    private String jdbcName="com.mysql.jdbc.Driver";

    /**
     * 获取数据库连接
     * @return
     * @throws Exception
     */
    public static Connection getCon() throws Exception{


       // Class.forName(jdbcName);
        Class.forName("com.mysql.jdbc.Driver");//注册驱动
        Connection con= DriverManager.getConnection(url);//建立链接

        return con;
    }

    /**
     * 关闭数据库连接
     * @param con
     * @throws Exception
     */
    public void closeCon(Connection con) throws Exception{
        if(con!=null){
            con.close();
        }
    }

    public static void main(String[] args) {


       Link link = new Link();
        try {
            link.getCon();

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
