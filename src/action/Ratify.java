package action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-23.
 *
 * 1.选择人员登录（根据从前台返回的值不同决定不同人员登录）
 */
@WebServlet(urlPatterns = "/loging", name="loging")
public class Ratify extends HttpServlet {
    private String login;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            login=request.getParameter("login");
                request.setAttribute("error","");
            if (login != null) {
                request.setAttribute("error","");
                int value = Integer.parseInt(login);
                switch (value){
                    case 1:
                        request.getRequestDispatcher("/Lvlogin.jsp").forward(request,response);
                        break;
                    case 2:
                        request.getRequestDispatcher("/Management.jsp").forward(request,response);
                        break;
                    case 3:
                        request.getRequestDispatcher("/Jiaocaike.jsp").forward(request,response);
                        break;
                }

            }else {
                    request.setAttribute("error","请选择登录选项");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
    }
}

