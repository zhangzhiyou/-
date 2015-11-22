package Paging;

import Dao.Link;
import Dao.Treelogindao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-11-22.
 */
public class Three_paging extends HttpServlet {
    Treelogindao treelogindao = new Treelogindao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String rows = request.getParameter("rows");
        Pagebean pagebean = new Pagebean(Integer.parseInt(page),Integer.parseInt(rows));
        Connection con = null;
        try {
            con = Link.getCon();
            JSONObject result = new JSONObject();
            JSONArray jsonArray = Jsonutil.formatRsToJsonArray(treelogindao.threelist(con,pagebean));
            int total = treelogindao.threeCount(con);
            result.put("rows",jsonArray);
            result.put("total",total);
            Responsutil.write(response,result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
