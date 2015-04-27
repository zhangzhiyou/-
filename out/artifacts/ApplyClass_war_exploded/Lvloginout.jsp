<%@ page import="Dao.Treeloginsubmitdao" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% if(session.getAttribute("currentUser")==null) {
      response.sendRedirect("Lvlogin.jsp");
      return;
    }
    %>

</head>
<body>
    <div align="center" style="padding-top: 50px">
        <form action="loging3" method="post">
            <img border="0" src="img/am.jpg" width="100%" height="100%"
                 style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
            <%=Treeloginsubmitdao.show2()%>
            <table>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">姓名：</td>
                    <td><input type="text"  name="name1"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">学号：</td>
                    <td><input type="text" name="number1"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">审批：</td>
                    <td><input type="text" name="agree"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">id：</td>
                    <td><input type="text" name="id1"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%"><input type="submit" value="确定"></td>
                    <td width="30%"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
