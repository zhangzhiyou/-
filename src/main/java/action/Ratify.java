package action;

import Dao.Jiaocaikedao;
import Dao.Link;
import Dao.Lvlogindao;
import Dao.Treelogindao;
import model.Jiaocaike;
import model.Lvlo;
import model.Three;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-23.
 *
 * 1.选择人员登录（根据从前台返回的值不同决定不同人员登录）
 */
@WebServlet(urlPatterns = "/loging", name="loging")
public class Ratify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
  //  Lvlogindao lvlogindao = new Lvlogindao();
    Link link = new Link();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String choose = request.getParameter("chooses");

        //todo 从客户端获取图片的上的验证码
        String serverCheckcode = (String)request.getSession().getAttribute("checkcode");
        String checkCode =  request.getParameter("checkCode");

        /**
         * 判断以什么身份登录
         *  1.审核人员
         *  2.教材科
         *  3.教室管理员
         * */


        /**
         * 审核老师登录验证
         * */
        if (choose == null || choose.length() <= 0) {
            request.setAttribute("error", "请选择登录");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            if (choose.equals("审核老师")) {
                ApplicationContext axt = new ClassPathXmlApplicationContext("databases.xml");
                LvloginVerify lvloginVerify = axt.getBean("lvloginVerify",LvloginVerify.class);
                try {
                    lvloginVerify.verify(username,password,serverCheckcode,checkCode,request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            /**
             * 教材科登录验证
             * */
            if (choose.equals("教材科")) {
                JiaocaikeLoginVerify jiaocaikeLoginVerify = new JiaocaikeLoginVerify();
                jiaocaikeLoginVerify.verify(username,password,serverCheckcode,checkCode,request,response,link);
            }
            /**
             * 教室管理员登录验证
             * */
            if (choose.equals("教室管理员")) {
                ThreeLoginVerify threeLoginVerify = new ThreeLoginVerify();
                threeLoginVerify.verify(username,password,serverCheckcode,checkCode,request,response,link);

            }
            /**
             * 超级管理员登陆
             * */
            if(choose.equals("管理员登陆")){
                AdministratorVerify administratorVerify = new AdministratorVerify();
                administratorVerify.verify(username,password,serverCheckcode,checkCode,request,response);
            }
         }

    }
}

