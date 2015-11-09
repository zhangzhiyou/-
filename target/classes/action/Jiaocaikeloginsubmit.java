package action;

import Dao.Jiaocaikesubmitdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-25.
 * 该类完成的需求
 *  1 申请人员申请教室,把信息添加到申请教室的表中
 *  2限定申请的约束条件（相同时间段內同一间教室只能被一个人申请）
 */
@WebServlet(urlPatterns = "/loging4", name = "Login4")
public class Jiaocaikeloginsubmit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txt;
        request.setCharacterEncoding("UTF8");
        String name3 = request.getParameter("name2");
        String reason = request.getParameter("reason");
        String temail = request.getParameter("email");
        String classroom = request.getParameter("classroom");

        /**
         * 对申请使用时间处理
         */
        String applytime1 = request.getParameter("applytimet1");
        String applytime2 = request.getParameter("applytimet2");
        String applytime3 = request.getParameter("applytimet3");
        String applytime = applytime1+applytime2+applytime3;
        String unit = request.getParameter("unit");
        String phone = request.getParameter("phone");
        String fixedphone = request.getParameter("fixedphone");
        txt = name3+"申请教室请审核";
        if(name3.equals("")||reason.equals("")||temail.isEmpty()||classroom.equals("")||applytime.equals("")||unit.equals("")||phone.isEmpty()||fixedphone.isEmpty()){
            request.setAttribute("error","所填表格每项不能为空");
            request.getRequestDispatcher("Jiaocaikeloginsubmit.jsp").forward(request,response);
            return;
        }
        try{
            if(Jiaocaikesubmitdao.choosecorrect(classroom,applytime)>0){
                request.setAttribute("error","这个时间段该教室已被别人申请");
                request.getRequestDispatcher("Jiaocaikeloginsubmit.jsp").forward(request,response);
                return;
            }
            else {
                int a=0;
                Jiaocaikesubmitdao.inster2(name3, reason, classroom, applytime,temail,unit,phone,fixedphone);
                a++;
                request.setAttribute("success","恭喜您成功提交申请"+a+"次");

                request.getRequestDispatcher("Jiaocaikeloginsubmit.jsp").forward(request,response);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
