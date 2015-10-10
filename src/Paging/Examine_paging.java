package Paging;

import Dao.Link;
import Dao.ManageDao;
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
 * Created by zhiyou on 15-8-8.
 *
 * 该servlet完成提交申请分页
 */
public class Examine_paging extends HttpServlet {
    Link link = new Link();
    ManageDao manageDao = new ManageDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String rows = request.getParameter("rows");
        Pagebean pagebean = new Pagebean(Integer.parseInt(page),Integer.parseInt(rows));
        Connection con = null;
        try{
            con= Link.getCon();
            JSONObject result = new JSONObject();//封装result
            JSONArray jsonArray= Jsonutil.formatRsToJsonArray(manageDao.gradelist(con, pagebean));//gradedao.gradelist(con, pagebean)的返回值是ResultSet类型的值
            //Jsonutil.formatRsToJsonArray（）参数类型是ResultSet类型的 返回 JSONArray类型。把gradedao.gradelist(con, pagebean)转换成json,

            int total=manageDao.gradeCount(con);//获取总数
            result.put("rows",jsonArray);
            result.put("total",total);
            Responsutil.write(response, result);//向页面输出数据

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
