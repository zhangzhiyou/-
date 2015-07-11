package Model;

import Dao.Jiaocaikedao;
import Dao.Link;
import Dome.Jiaocaike;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-24.
 */
@WebServlet(urlPatterns = "/loging2", name = "Login2")
public class Jiaocaikelogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       // Treelogindao threelogindao = new Treelogindao();
        Jiaocaikedao jiaocaikedao = new Jiaocaikedao();
        Link link = new Link();
        String username3 = request.getParameter("username3");
        String password3 = request.getParameter("password3");
        String check2 = request.getParameter("check2");

        request.setAttribute("username3",username3);
        request.setAttribute("password3",password3);
        if(username3.isEmpty()||password3.isEmpty()){
            request.setAttribute("error","用户名和密码不能为空");
            request.getRequestDispatcher("Jiaocaike.jsp").forward(request,response);
        }

        if(check2!=null&& check2.length()>0){
            String usernames = URLEncoder.encode(username3,"utf-8");//处理中文乱码
            String passwordes = URLEncoder.encode(password3,"utf-8");
            Cookie usernamecookie1 = new Cookie("usernames",usernames);//声明一个coocie对象并为其赋值
            Cookie passwordcookie1 = new Cookie("passwords",passwordes);
            usernamecookie1.setMaxAge(24*30*60*60);//设置cookie的期限
            passwordcookie1.setMaxAge(24*30*60*60);
            response.addCookie(usernamecookie1);//添加cookie的值
            response.addCookie(passwordcookie1);
        } else {
            Cookie[] cookies = request.getCookies();//声明一个cookie数组，
            if (cookies != null && cookies.length > 0) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("usernames") || c.getName().equals("passwords")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
        }

       // Three three = new Three(username2,password2);
        Jiaocaike jiaocaike =new Jiaocaike(username3,password3);
        Connection con = null;
        try{
            con = link.getCon();
            Jiaocaike currentUser = jiaocaikedao.login3(con,jiaocaike);
            if(currentUser==null){
                request.setAttribute("error","用户名或密码错误");
                request.getRequestDispatcher("Jiaocaike.jsp").forward(request,response);
        }


            else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("currentUser", currentUser);
                response.sendRedirect("Jiaocaikeloginsubmit.jsp");
            }
    } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                link.closeCon(con);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        }
    }
