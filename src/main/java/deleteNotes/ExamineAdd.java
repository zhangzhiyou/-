package deleteNotes;

import Dao.Link;
import Dao.LvshenheDao;
import Paging.Responsutil;
import net.sf.json.JSONObject;
import sun.text.normalizer.IntTrie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

/**
 * Created by zhiyou on 15-9-26.
 * 该servlet完成的需求
 *
 *  1 完成审核人员的审核，
 *  2.把审核的内容删除
 *  3. 完成电子邮件的发送
 *
 *  与该类对审核表操作的servlet是ExmineDelete（该servlet的主要功能是可以删除多项数据数据）
 */
public class ExamineAdd extends HttpServlet {
    Link link = new Link();
    LvshenheDao lvshenheDao = new LvshenheDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //取出选中的 id 的值
        String deild = request.getParameter("deild");
        int id= Integer.parseInt(deild);
        String agree = request.getParameter("agree");
        JSONObject result = new JSONObject();
        Connection con=null;
        try {
            con=link.getCon();
            lvshenheDao.chooseinformantion(con,id,agree);
            if(lvshenheDao.deleteexam(con,id)>0) {
                // lvshenheDao.deleteexam(con,id);
                result.put("success", "true");
            }else {
                result.put("errorMas","删除失败");
            }
            Responsutil.write(response, result);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
