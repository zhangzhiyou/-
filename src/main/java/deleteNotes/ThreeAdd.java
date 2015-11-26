package deleteNotes;

import Dao.Treelogindao;
import Paging.Responsutil;
import com.sun.org.apache.xpath.internal.SourceTree;
import model.Three;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhiyou on 15-11-24.
 */
public class ThreeAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("username= "+username);
        Three three = new Three(username,password);
        Treelogindao treelogindao = new Treelogindao();
        int number = 0;
        int num = 0;
        try {
            num = treelogindao.check(username);
           JSONObject result = new JSONObject();
            if(num>0){
                result.put("errormag",1);
            }
            else{
                number = treelogindao.addthree(three);
                if(number>0){
                    result.put("errormag",2);
                }
                else {
                    result.put("errormag",3);
                }

            }
            Responsutil.write(response,result);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
