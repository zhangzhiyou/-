package Model;

import Dao.Jiaocaikedao;
import Dao.Link;
import Dome.Jiaocaike;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-24.
 */
@WebServlet(urlPatterns = "/loging2", name = "Login2")
public class Jiaocaikelogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       // Treelogindao threelogindao = new Treelogindao();
        Jiaocaikedao jiaocaikedao = new Jiaocaikedao();
        Link link = new Link();
        String username3 = request.getParameter("username3");
        String password3 = request.getParameter("password3");
        request.setAttribute("username3",username3);
        request.setAttribute("password3",password3);
        if(username3.isEmpty()||password3.isEmpty()){
            request.setAttribute("error","用户名和密码不能为空");
            request.getRequestDispatcher("Jiaocaike.jsp").forward(request,response);
        }
        Jiaocaike jiaocaike =new Jiaocaike(username3,password3);
        Connection con = null;
        try{
            con = link.getCon();
            Jiaocaike currentUser = jiaocaikedao.login3(con,jiaocaike);
            if(currentUser==null){
                request.setAttribute("error","用户名或密码错误");
                request.getRequestDispatcher("Jiaocaike.jsp").forward(request,response);
        }
            else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("currentUser", currentUser);
                response.sendRedirect("Jiaocaikeloginsubmit.jsp");
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
