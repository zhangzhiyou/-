package Model;

import Dao.Link;
import Dao.Treelogindao;
import Dome.Three;
import Dome.Threelogin;

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
public class Treelogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Treelogindao threelogindao = new Treelogindao();
        Link link = new Link();
        String username2 = request.getParameter("username2");
        String password2 = request.getParameter("password2");
        String check2 = request.getParameter("check2");

        request.setAttribute("username2",username2);
        request.setAttribute("password2",password2);
        if(username2.isEmpty()||password2.isEmpty()){
            request.setAttribute("error","用户名和密码不能为空");
            request.getRequestDispatcher("Threelogin").forward(request,response);
        }

        if(check2!=null&& check2.length()>0){
            String usernames = URLEncoder.encode(username2,"utf-8");//处理中文乱码
            String passwordes = URLEncoder.encode(password2,"utf-8");
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

        Three three = new Three(username2,password2);
        Connection con = null;
        try{
            con = link.getCon();
            Three currentUser = threelogindao.login2(con,three);
            if(currentUser==null){
                request.setAttribute("error","用户名或密码错误");
                request.getRequestDispatcher("Threelogin.jsp").forward(request,response);
        }


            else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("currentUser", currentUser);
                response.sendRedirect("Threeloginout.jsp");
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
