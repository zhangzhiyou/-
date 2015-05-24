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
    <style>
        th{background-color:deepskyblue;color: black}
        table#table3{background-color: blanchedalmond;color: black;width: 500px}
    </style>
</head>
<body>
    <div align="center" style="padding-top: 50px">
        <form action="loging3" method="post">
            <img border="0" src="img/am.jpg" width="100%" height="100%"
                 style='position: absolute;left:0px;top:0px;z-index: -1'/>
            <%=Treeloginsubmitdao.show2()%>
            <table id="table3">
                <tr>
                    <td width="40%"></td>
                    <td width="20%">姓名：</td>
                    <td><input type="text"  name="name1"></td></br>
                    <td width="30%"></td>
                </tr>
                <%--<tr>--%>
                    <%--<td width="40%"></td>--%>
                    <%--<td width="5%">--%>
                        <%--<font color="#7fff00">学号：</font></td>--%>
                    <%--<td><input type="text" name="number1"></td></br>--%>
                    <%--<td width="30%"></td>--%>
                <%--</tr>--%>
                <tr>
                    <td width="40%"></td>
                    <td width="20%">
                        <font color="#ffd700">审批：</font></td>
                    <td><label>同意</label><input type="radio" value="同意" name="agree">
                        <label>不同意</label><input type="radio" value="不同意" name="agree"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="20%">
                        <font color="aqua">教室：</font></td>
                    <td>
                        <%--<input type="text" name="classrooml">--%>
                        <select>
                            <option name="classrome" value="31">31</option>
                            <option name="classrome" value="31">32</option>
                            <option name="classrome" value="31">33</option>
                        </select>
                    </td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">
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
