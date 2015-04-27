package Model;

import Dao.Treeloginsubmitdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-27.
 */
@WebServlet(urlPatterns = "/loging5", name = "Login5")
public class Threelogindelecte extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String id=request.getParameter("id");
        Integer id4=Integer.valueOf(id);
        try {
            Treeloginsubmitdao.delect1(id4);
            request.getRequestDispatcher("threedelete.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
