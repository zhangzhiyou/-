package Model;

import Dao.Jiaocaikesubmitdao;
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
        String unit = request.getParameter("unit");
        String name4 = request.getParameter("name1");
        String fixedphone = request.getParameter("fixedphone");
        String phone = request.getParameter("phone");

        //  String number4 = request.getParameter("number1");
        String agree4 = request.getParameter("agree");
        /**
         * 增加选择判断的条件
         */
        String classroom4 = request.getParameter("classrooml");
        String applytime4 = request.getParameter("applytimel");
        //  String lemail4 = request.getParameter("email");
        //  SendEmail sendEmail = new SendEmail();
        int a=0;
        if (Jiaocaikesubmitdao.judge(name4, classroom4, applytime4, unit, phone, fixedphone) == 0) {
            request.setAttribute("error", "您审批的该记录不在申请表中");
            request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);

        } else {
            try {
                if ("同意".equals(agree4)) {
                    //     System.out.println(Lvloginshenhedao.choosecorrect(agree4,classroom4,applytime4)+"==========");
                    if (Lvloginshenhedao.choosecorrect(agree4, classroom4, applytime4) > 0) {
                        request.setAttribute("error", "该教室在该时间已被占用,您不能再同意该教室的申请");
                        request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                        return;
                    } else {
                        Lvloginshenhedao.inster1(name4, agree4, classroom4, applytime4, unit, fixedphone, phone);
                        Lvloginshenhedao.delect(name4, classroom4, applytime4);//todo
                        //  SendEmail sendEmail = new SendEmail();
                        //   sendEmail.lvsendemail(name4,agree4,classroom4,lemail4);//todo 发送邮件
                        request.setAttribute("success","恭喜已经审批完一条");
                        request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                    }
                }
                if ("不同意".equals(agree4)) {
                    Lvloginshenhedao.inster1(name4, agree4, classroom4, applytime4, unit, fixedphone, phone);
                    Lvloginshenhedao.delect(name4, classroom4, applytime4);//todo
                    System.out.println("name4=" + name4 + "classroom4=" + classroom4 + "applytime4=" + applytime4);

                    //  sendEmail.lvsendemail(name4,agree4,classroom4,lemail4);
                    request.setAttribute("success","恭喜已经审批完一条");
                    request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                }


            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}
