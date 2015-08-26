package Model;

import Dao.Link;
import Dao.ManageDao;
import Dao.Treelogindao;
import Dome.Three;
import Paging.Jsonutil;
import Paging.Pagebean;
import Paging.Responsutil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-7-8.
 * 教室管理老师登录
 */
@WebServlet(urlPatterns = "/loging6", name="loging6" )
public class Threelogintext extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Treelogindao treelogindao = new Treelogindao();
        Link link = new Link();
        String username3 = request.getParameter("username2");
        String password3 = request.getParameter("password2");
        request.setAttribute("username2", username3);
        request.setAttribute("password2", password3);
        if (username3.isEmpty() || password3.isEmpty()) {
            request.setAttribute("error", "用户名或密码不能为空");
            request.getRequestDispatcher("Management.jsp").forward(request, response);
            return;
        }
        Three three = new Three(username3, password3);
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
