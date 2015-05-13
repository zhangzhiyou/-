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
                 style='position: absolute;left:0px;top:0px;z-index: -1'/>
            <%=Treeloginsubmitdao.show2()%>
            <table>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">姓名：</td>
                    <td><input type="text"  name="name1"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">
                        <font color="#7fff00">学号：</font></td>
                    <td><input type="text" name="number1"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">
                        <font color="#ffd700">审批：</font></td>
                    <td><input type="text" name="agree"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%">
                        <font color="aqua">教室：</font></td>
                    <td><input type="text" name="classrooml"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="10%">
                        <font color="#dc143c">申请时间：</font></td>
                    <td><input type="text" name="applytimel"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%"><input type="submit" value="确定"></td>
                    <td><a href="Lvloginout.jsp">重置</a></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>

                    <font color="red">${ error}</font>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
