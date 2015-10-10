package action;

import Dao.Jiaocaikesubmitdao;
import Dao.Lvloginshenhedao;
import Email.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-4-25.
 * 该类暂时得不到请求，
 * 对审核处理的servlet已别转移到，deleteNots文件夹下的ExamineAdd类中处理
 *
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
        /**
        * 对申请时间的特殊处理
        * */
        String applytime1 = request.getParameter("applytime1");
        String applytime2=request.getParameter("applytime2");
        String applytime3 = request.getParameter("applytime3");

        String applytime4 =applytime1+applytime2+applytime3;
          String lemail4 = request.getParameter("email");
//          SendEmail sendEmail = new SendEmail();
        int a=0;
        if(unit.isEmpty()||name4.isEmpty()||fixedphone.isEmpty()||phone.isEmpty()||agree4.isEmpty()||classroom4.isEmpty()||applytime4.isEmpty()||lemail4.isEmpty()){
            request.setAttribute("error","所填选项不能为空");
            request.getRequestDispatcher("Lvloginout.jsp").forward(request,response);
            return;
        }else {
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
                            Lvloginshenhedao.delect(name4, classroom4, applytime4);
                            //todo 如果邮箱填写，就发送邮件
                        if(lemail4!=null) {
                                 SendEmail sendEmail = new SendEmail();
                                  sendEmail.lvsendemail(name4, agree4, classroom4, lemail4);//todo 发送邮件
                        }
                            request.setAttribute("error", "恭喜已经审批完一条");
                            request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                        }
                    }
                    if ("不同意".equals(agree4)) {
                        Lvloginshenhedao.inster1(name4, agree4, classroom4, applytime4, unit, fixedphone, phone);
                        Lvloginshenhedao.delect(name4, classroom4, applytime4);//todo

                        //  sendEmail.lvsendemail(name4,agree4,classroom4,lemail4);
                        request.setAttribute("error", "恭喜已经审批完一条");
                        request.getRequestDispatcher("Lvloginout.jsp").forward(request, response);
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
    }

}
