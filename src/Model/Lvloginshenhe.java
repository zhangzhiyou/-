package Model;

import Dao.Lvloginshenhedao;
import Email.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Scanner;

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
      //  String number4 = request.getParameter("number1");
        String agree4 = request.getParameter("agree");
        /**
         * 增加选择判断的条件
         */
        String classroom4 = request.getParameter("classrooml");
        String applytime4 = request.getParameter("applytimel");
        String lemail4 = request.getParameter("email");
         SendEmail sendEmail = new SendEmail();

            try{
                if("同意".equals(agree4)){
               //     System.out.println(Lvloginshenhedao.choosecorrect(agree4,classroom4,applytime4)+"==========");
                   if(Lvloginshenhedao.choosecorrect(agree4,classroom4,applytime4)>0){
                       request.setAttribute("error","该教室在该时间已被占用");
                       request.getRequestDispatcher("Lvloginout.jsp").forward(request,response);
                       return;
                   }
                    else {
                       Lvloginshenhedao.inster1(name4, agree4,classroom4,applytime4);
                       Lvloginshenhedao.delect(name4,classroom4,applytime4);//todo
                     //  SendEmail sendEmail = new SendEmail();
                       sendEmail.lvsendemail(name4,agree4,classroom4,lemail4);
                       request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);

                   }
                }
                else {
                    Lvloginshenhedao.inster1(name4, agree4,classroom4,applytime4);
                    Lvloginshenhedao.delect(name4,classroom4,applytime4);//todo

                    sendEmail.lvsendemail(name4,agree4,classroom4,lemail4);
                    request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                }


            }catch (Exception e){
                e.printStackTrace();
            }
        }
}
