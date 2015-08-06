package Model;

import Dao.Jiaocaikesubmitdao;
import Dao.Link;
import Dao.Lvloginshenhedao;
import Dao.ManageDao;
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
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-4-27.
 */
@WebServlet(urlPatterns = "/loging5", name = "Login5")
public class Threelogindelecte extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF8");
        //todo 开始注释
        String username=request.getParameter("username");
        String classroom=request.getParameter("classrooml1");
        String agree = request.getParameter("agree1");
        String applytime= request.getParameter("applytimel1");
        // todo 注释结束

        //todo 开始添加
//        String page = request.getParameter("page");//获取jsp页面传过来的参数pags
//        String rows = request.getParameter("rows");
//        Pagebean pagebean = new Pagebean(Integer.parseInt(page),Integer.parseInt(rows));//强制转换page和rows
//        Connection con = null;
        try {
//            con=link.getCon();
//            JSONObject result = new JSONObject();//封装result
//            JSONArray jsonArray= Jsonutil.formatRsToJsonArray(manageDao.gradelist(con, pagebean));//gradedao.gradelist(con, pagebean)的返回值是ResultSet类型的值
//            //Jsonutil.formatRsToJsonArray（）参数类型是ResultSet类型的 返回 JSONArray类型。把gradedao.gradelist(con, pagebean)转换成json,
//            int total=manageDao.gradeCount(con);//获取总数
//            result.put("rows",jsonArray);
//            result.put("total",total);
//            Responsutil.write(response, result);//向页面输出数据
            //todo 注释了之前的删除功能
            if(Lvloginshenhedao.delecterror(username,agree,classroom,applytime)==0){
                request.setAttribute("error","表中未有该信息请确认后再填写");
                request.getRequestDispatcher("threedelete.jsp").forward(request,response);
            }
            else {
                request.setAttribute("success","恭喜您已经成功删除一条记录");
                Jiaocaikesubmitdao.delect1(username,agree, classroom, applytime);
                request.getRequestDispatcher("threedelete.jsp").forward(request,response);
            }
            //请求的url地址没有发生改变
           // response.sendRedirect("threedelete.jsp");//服务器外部跳转，请求的url地址发生了改变

            //todo 注释结束
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
