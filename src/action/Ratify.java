package action;

import Dao.Jiaocaikedao;
import Dao.Link;
import Dao.Lvlogindao;
import Dao.Treelogindao;
import model.Jiaocaike;
import model.Lvlo;
import model.Three;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-4-23.
 *
 * 1.选择人员登录（根据从前台返回的值不同决定不同人员登录）
 */
@WebServlet(urlPatterns = "/loging", name="loging")
public class Ratify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    Lvlogindao lvlogindao = new Lvlogindao();
    Link link = new Link();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String choose = request.getParameter("chooses");
        /**
         * 判断以什么身份登录
         *  1.审核人员
         *  2.教材科
         *  3.教室管理员
         * */


        /**
         * 审核老师登录验证
         * */
        if (choose == null || choose.length() <= 0) {
            request.setAttribute("error", "请选择登录");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;

        } else {
            if (choose.equals("审核老师")) {

                if (username.isEmpty() || password.isEmpty()) {
                    request.setAttribute("error", "用户名或密码为空");
                    request.getRequestDispatcher("index.jsp").forward(request, response);//
                    return;
                }
                Lvlo lv = new Lvlo(username, password);
                Connection con = null;
                try {
                    con = link.getCon();//链接数据库
                    Lvlo currentUser = lvlogindao.login1(con, lv);
                    if (currentUser == null) {
                        request.setAttribute("error", "用户名或密码错误");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        HttpSession session1 = request.getSession();
                        session1.setAttribute("currentUser", currentUser);
                        response.sendRedirect("Lvloginout.jsp");
                    }

                } catch (Exception e) {
                    e.printStackTrace();

                } finally {
                    try {
                        link.closeCon(con);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }

            /**
             * 教材科登录验证
             * */
            Jiaocaikedao jiaocaikedao = new Jiaocaikedao();
            if (choose.equals("教材科")) {
                if (username.isEmpty() || password.isEmpty()) {
                    request.setAttribute("error", "用户名和密码不能为空");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                Jiaocaike jiaocaike = new Jiaocaike(username, password);
                Connection con = null;
                try {
                    con = link.getCon();
                    Jiaocaike currentUser = jiaocaikedao.login3(con, jiaocaike);
                    if (currentUser == null) {
                        request.setAttribute("error", "用户名或密码错误");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        HttpSession session1 = request.getSession();
                        session1.setAttribute("currentUser", currentUser);
                        response.sendRedirect("Jiaocaikeloginsubmit.jsp");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        link.closeCon(con);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }

            }
            /**
             * 教室管理员登录验证
             * */
            Treelogindao treelogindao = new Treelogindao();
            if (choose.equals("教室管理员")) {
                if (username.isEmpty() || password.isEmpty()) {
                    request.setAttribute("error", "用户名或密码不能为空");
                    request.getRequestDispatcher("Management.jsp").forward(request, response);
                    return;
                }
                Three three = new Three(username, password);
                Connection con = null;
                try {
                    con = Link.getCon();
                    Three currentUser = treelogindao.login2(con, three);
                    if (currentUser == null) {
                        request.setAttribute("error", "用户名或密码错误");
                        request.getRequestDispatcher("Management.jsp").forward(request, response);
                    } else {
                        HttpSession session1 = request.getSession();
                        session1.setAttribute("currentUser", currentUser);
                        response.sendRedirect("threedelete.jsp");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        link.closeCon(con);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }


            }
        }

    }
}

