package deleteNotes;

import Dao.Link;
import Dao.LvshenheDao;
import Paging.Responsutil;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-8-26.
 * 该servlet完成的需求，审核老师可以同时删除多条记录
 *
 */

public class ExamineDelete extends HttpServlet {
    Link link = new Link();
    LvshenheDao lvshenheDao = new LvshenheDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //todo deiLds参数是从Lvlogin.jsp中post方法中的第算个三个参数中得到的
        String deiLds = request.getParameter("deiLds");
        Connection con = null;
        try{
            con=link.getCon();
            JSONObject result = new JSONObject();//封装result
            int delNums=lvshenheDao.gradeDelete(con, deiLds);
            if(delNums>0){//>0说明已经删除了所选信息条数delNums条
                result.put("success","true");
                result.put("delNums",delNums);
            }else {
                result.put("errorMas","删除失败");
            }
            Responsutil.write(response, result);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                link.closeCon(con);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }
}
