package action;

import Dao.AdministratorDao;
import model.Administrator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by zhiyou on 15-11-21.
 */
public class AdministratorVerify  {
    public void verify(String username,String password ,String serverCheckcode,String checkCode,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        if(username.isEmpty()||password.isEmpty()){
            request.setAttribute("error","用户名或密码不能为空");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        Administrator administrator = new Administrator(username,password);
        AdministratorDao administratorDao = new AdministratorDao();
        Administrator curent =  administratorDao.select(username, password, administrator);
        if(curent==null){
            request.setAttribute("error","用户名或密码错误");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        else {
            if(serverCheckcode.equals(checkCode)){
                HttpSession session = request.getSession();
                session.setAttribute("curent",curent);
                response.sendRedirect("administrator.jsp");
//                request.getRequestDispatcher("administrator.jsp").forward(request,response);
                return;
            }
            else {
                request.setAttribute("error","验证码输入错误");
                request.getRequestDispatcher("index.jsp").forward(request,response);
                return;
            }
        }
    }
}
