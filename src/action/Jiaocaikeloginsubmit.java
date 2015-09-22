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
 */
@WebServlet(urlPatterns = "/loging4", name = "Login4")
public class Jiaocaikeloginsubmit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String txt;
        String name3 = request.getParameter("name2");
      //  String number3 = request.getParameter("number2");
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
       //Integer classnumber = Integer.valueOf(classroom);//将字符串强制转换成int类型
      //  String classsnumber = request.getParameter("classroom");
        txt = name3+"申请教室请审核";
        if(name3.equals("")||reason.equals("")||classroom.equals("")||applytime.equals("")||unit.equals("")){
            request.setAttribute("error","表中除邮箱外都不能为空");
            request.getRequestDispatcher("Jiaocaikeloginsubmit.jsp").forward(request,response);
        }
        try{
            if(Jiaocaikesubmitdao.choosecorrect(name3,classroom,applytime)>0){
                request.setAttribute("error","请不要重复申请");
              //  request.getRequestDispatcher("Threeloginout.jsp").forward(request,response);
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
