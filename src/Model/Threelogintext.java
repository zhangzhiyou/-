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
     //   ManageDao manageDao = new ManageDao();
        String username3 = request.getParameter("username2");
        String password3 = request.getParameter("password2");
        request.setAttribute("username2", username3);
        request.setAttribute("password2", password3);
        //todo 添加分页
//        String page = request.getParameter("page");//获取jsp页面传过来的参数pags
//        String rows = request.getParameter("rows");
//        Pagebean pagebean = new Pagebean(Integer.parseInt(page), Integer.parseInt(rows));//强制转换page和rows
        // todo 添加分页结束
        if (username3.isEmpty() || password3.isEmpty()) {
            request.setAttribute("erroe", "用户名或密码不能为空");
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

               // con = link.getCon();
                //todo 开始添加分页
//                JSONObject result = new JSONObject();//封装result
//                JSONArray jsonArray = Jsonutil.formatRsToJsonArray(manageDao.gradelist(con, pagebean));//gradedao.gradelist(con, pagebean)的返回值是ResultSet类型的值
//                //Jsonutil.formatRsToJsonArray（）参数类型是ResultSet类型的 返回 JSONArray类型。把gradedao.gradelist(con, pagebean)转换成json,
//                int total = manageDao.gradeCount(con);//获取总数
//                result.put("rows", jsonArray);
//                result.put("total", total);
//                Responsutil.write(response, result);//向页面输出数据
//                //todo 添加分页结束
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

        //todo 添加分页

    }
}
