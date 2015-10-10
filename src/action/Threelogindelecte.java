package action;

import Dao.Jiaocaikesubmitdao;
import Dao.Lvloginshenhedao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-27.
 * 该servlet完成的需求
 *  1 删除审核完的数据，支持多项删除
 */
@WebServlet(urlPatterns = "/loging5", name = "Login5")
public class Threelogindelecte extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        //todo 开始注释
        String id = request.getParameter("id");
        String username=request.getParameter("username");
        String classroom=request.getParameter("classrooml1");
        String agree = request.getParameter("agree1");
        String applytime= request.getParameter("applytimel1");

        try {
            if(Lvloginshenhedao.delecterror(username,agree,classroom,applytime)==0){
                request.setAttribute("error","表中未有该信息请确认后再填写");
                request.getRequestDispatcher("threedelete.jsp").forward(request,response);
            }
            else {
                request.setAttribute("error","恭喜您已经成功删除一条记录");
                Jiaocaikesubmitdao.delect1(username,agree, classroom, applytime);
                request.getRequestDispatcher("threedelete.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
