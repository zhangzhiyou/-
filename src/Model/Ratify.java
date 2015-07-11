package Model;

import Dao.Link;
import Dao.Lvlogindao;
import Dome.Lvlo;
import Dome.Lvlogin;
import sun.security.pkcs11.Secmod;

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
 */
@WebServlet(urlPatterns = "/loging", name="loging")
public class Ratify extends HttpServlet {

    Lvlogindao lvlogindao = new Lvlogindao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Link link = new Link();

        String username1 = request.getParameter("username1");
        String password1 = request.getParameter("password1");
        String username2 = request.getParameter("username2");
        String password2 = request.getParameter("password2");
        request.setAttribute("username1",username1);
        request.setAttribute("password1",password1);
        request.setAttribute("username2",username2);
        request.setAttribute("password2",password2);
            if (request.getParameter("login") != null) {
                if (request.getParameter("login").equals("1")) {
                    request.getRequestDispatcher("/Lvlogin.jsp").forward(request, response);//服务器内部转换
                }
                if(request.getParameter("login").equals("3")){
                    request.getRequestDispatcher("/Jiaocaike.jsp").forward(request, response);
                }
                if(request.getParameter("login").equals("2")){
                    request.getRequestDispatcher("/Management.jsp").forward(request,response);
                }
//                else{
//                    request.getRequestDispatcher("/index.jsp").forward(request, response);
//                }
            }
    }
}

