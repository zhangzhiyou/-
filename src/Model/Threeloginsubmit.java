package Model;

import Dao.Treeloginsubmitdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-25.
 */
@WebServlet(urlPatterns = "/loging4", name = "Login4")
public class Threeloginsubmit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String name3 = request.getParameter("name2");
        String number3 = request.getParameter("number2");
        String reason = request.getParameter("reason");
        String classroom = request.getParameter("classroom");
        String applytime = request.getParameter("applytimet");
        Integer classnumber = Integer.valueOf(classroom);//将字符串强制转换成int类型

        try{
            Treeloginsubmitdao.inster2(name3,number3,reason,classnumber,applytime);

            request.getRequestDispatcher("Threeloginout.jsp").forward(request,response);


        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
