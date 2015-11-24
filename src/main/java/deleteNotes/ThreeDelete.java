package deleteNotes;

import Dao.Link;
import Dao.Treelogindao;
import Paging.Responsutil;
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
public class ThreeDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deiLds = request.getParameter("deiLds");
        Connection con=null;
        Treelogindao treelogindao = new Treelogindao();
        try {
            con = Link.getCon();
            JSONObject result = new JSONObject();
            int delNums = treelogindao.threedelete(con,deiLds);
            if(delNums>0){
                result.put("success","true");
                result.put("delNums",delNums);
            }
            else {
                result.put("errorMag","删除失败");
            }
            Responsutil.write(response,result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
