package Model;

import Dao.Link;
import Dao.Lvlogindao;
import Dome.Lvlo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-4-24.
 */
@WebServlet(urlPatterns = "/loging1", name = "Login1")
public class Lvlogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Lvlogindao lvlogindao = new Lvlogindao();
        Link link = new Link();
        String username1 = request.getParameter("username1");
        String password1 = request.getParameter("password1");
        request.setAttribute("username1",username1);
        request.setAttribute("password1",password1);
        if (username1.isEmpty() || password1.isEmpty()) {
            request.setAttribute("error", "用户名或密码为空");
            request.getRequestDispatcher("Lvlogin.jsp").forward(request, response);//
            return;
        }

        Lvlo lv=new Lvlo(username1,password1);
        Connection con=null;
        try{
            con =link.getCon();//链接数据库
            Lvlo currentUser = lvlogindao.login1(con, lv);


            if(currentUser==null){
                request.setAttribute("error","用户名或密码错误");
                request.getRequestDispatcher("Lvlogin.jsp").forward(request,response);
            }
            else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("currentUser",currentUser);
                response.sendRedirect("Lvloginout.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                link.closeCon(con);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }
}
