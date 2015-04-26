package Model;

import Dao.Link;
import Dao.Treelogindao;
import Dome.Three;
import Dome.Threelogin;

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
 * Created by zhiyou on 15-4-24.
 */
@WebServlet(urlPatterns = "/loging2", name = "Login2")
public class Treelogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Treelogindao threelogindao = new Treelogindao();
        Link link = new Link();
        String username2 = request.getParameter("username2");
        String password2 = request.getParameter("password2");
        request.setAttribute("username2",username2);
        request.setAttribute("password2",password2);
        if(username2.isEmpty()||password2.isEmpty()){
            request.setAttribute("error","用户名和密码不能为空");
            request.getRequestDispatcher("Threelogin").forward(request,response);
        }
        Three three = new Three(username2,password2);
        Connection con = null;
        try{
            con = link.getCon();
            Three currentUser = threelogindao.login2(con,three);
            if(currentUser==null){
                request.setAttribute("error","用户名或密码错误");
                request.getRequestDispatcher("Threelogin.jsp").forward(request,response);
        }
            else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("currentUser", currentUser);
                response.sendRedirect("Threeloginout.jsp");
            }
    } catch (SQLException e) {
            e.printStackTrace();
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
