package action;

import Dao.Link;
import Dao.Lvlogindao;
import model.Lvlo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-11-3.
 */
public class LvloginVerify {
    public void verify(String username,String password,String serverCheckcode,String checkCode,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException {
        if (username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "用户名或密码为空");
            request.getRequestDispatcher("index.jsp").forward(request, response);//
            return;
        }
//        Lvlo lv = new Lvlo(username, password);
//        Connection con = null;
//        try {
       //     con = dataSource.getConnection();//链接数据库
            ApplicationContext axt = new ClassPathXmlApplicationContext("databases.xml");
            Lvlogindao lvlogindao1 = axt.getBean("lvlogindao",Lvlogindao.class);
          Lvlo currentUser= lvlogindao1.login1(username, password);
        //    Lvlo currentUser =  lvlogindao1.login1(username,password);
            if (currentUser == null) {
                request.setAttribute("error", "用户名或密码错误");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            } else {
                if(serverCheckcode.equals(checkCode)) {
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("currentUser", currentUser);
                    response.sendRedirect("Lvloginout.jsp");
                }else {
                    request.setAttribute("error", "请正确输入验证码");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }

//        } catch (Exception e) {
//            e.printStackTrace();
//
//        }
    }
}
