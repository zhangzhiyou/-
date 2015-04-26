<%@ page import="Dao.Lvloginshenhedao" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-24
  Time: 下午4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <%if(session.getAttribute("currentUser")==null) {
    response.sendRedirect("Threelogin.jsp");
    return;
  }%>

  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>
</head>

<body>
<div align="center" style="padding-top: 50px">

  <form action="loging4" method="post">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
    <%=Lvloginshenhedao.show1()%>
    <table>
      <tr>
        <td width="40%"></td>
        <td width="5%">姓名：</td>
        <td><input type="text"  name="name2"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%">学号：</td>
        <td><input type="text" name="number2"></td>
        <td width="30%"></td>
      </tr>

      <tr>
        <td width="40%"></td>
        <td width="5%">教室：</td>
        <td><input type="text" name="classroom"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%">理由：</td>
        <td><textarea name="reason" style="width:200px;height:80px;"></textarea></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%"><input type="submit" value="确认"></td>
        <td width="30%"></td>
      </tr>
    </table>
  </form>
</div>
</body >
</html>
