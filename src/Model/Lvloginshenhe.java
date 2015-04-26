package Model;

import Dao.Lvloginshenhedao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-25.
 */
@WebServlet(urlPatterns = "/loging3", name = "Login3")
public class Lvloginshenhe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String name4 = request.getParameter("name1");
        String number4 = request.getParameter("number1");
        String agree4 = request.getParameter("agree");

            try{
                Lvloginshenhedao.inster1(name4,number4,agree4);
                request.getRequestDispatcher("Lvloginout.jsp").forward(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
}
