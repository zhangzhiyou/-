package action;

import Dao.Jiaocaikedao;
import Dao.Link;
import model.Jiaocaike;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by zhiyou on 15-11-3.
 */
public class JiaocaikeLoginVerify {
    public void verify(String username,String password,String serverCheckcode,String checkCode,HttpServletRequest request,HttpServletResponse response, Link link) throws ServletException, IOException {
        if (username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "用户名和密码不能为空");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        Jiaocaikedao jiaocaikedao = new Jiaocaikedao();
        Jiaocaike jiaocaike = new Jiaocaike(username, password);
        Connection con = null;
        try {
            con = link.getCon();
            Jiaocaike currentUser = jiaocaikedao.login3(con, jiaocaike);
            if (currentUser == null) {
                request.setAttribute("error", "用户名或密码错误");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if(serverCheckcode.equals(checkCode)) {
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("currentUser", currentUser);
                    response.sendRedirect("Jiaocaikeloginsubmit.jsp");
                }else {
                    request.setAttribute("error", "请正确输入验证码");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
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
}
