package Dao;

import action.LvloginVerify;
import model.Lvlo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-23.
 */
public class Lvlogindao {
//   private JdbcTemplate jdbcTemplate;
//
//    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
//        this.jdbcTemplate = jdbcTemplate;
//    }
//        public Lvlo login1(String username,String password){
//            String sql = "select * from lvmima where name2=? and password2=?";
//            int i = jdbcTemplate.queryForInt(sql,new String[] {username,password},java.lang.String.class);
//
//            System.out.println(i+"jdbcTemplace返回值是");
//            Lvlo lvlo=null;
//           if(i>=1){
//             lvlo.setUsername1(username);
//               lvlo.setPassword1(password);
//               return lvlo;
//           }
//           else {
//               return lvlo;
//           }
//        }
    private DataSource dataSource;
    public DataSource dataSource(){
        return dataSource;
    }
    public void setDataSource(DataSource dataSource){
        this.dataSource = dataSource;
    }
    public  Lvlo login1(String username,String password) throws SQLException {
        Lvlo lv = new Lvlo(username, password);
        Connection con = null;
        Lvlo resultLvlo = null;
        PreparedStatement pstmt = null;
        try {
            String sql = "select * from lvmima where name2=? and password2=?";
            con=dataSource.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, lv.getUsername1());
            pstmt.setString(2, lv.getPassword1());
            ResultSet rs = pstmt.executeQuery();//pstmt.executeQuery()执行的结果
            if (rs.next()) {
                resultLvlo = new Lvlo();
                //todo
                resultLvlo.setUsername1(rs.getString("name2"));
                resultLvlo.setPassword1(rs.getString("password2"));
            }
            return resultLvlo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultLvlo;
    }

}
