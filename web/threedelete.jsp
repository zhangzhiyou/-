<%@ page import="Dao.Lvloginshenhedao" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-27
  Time: 下午3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      //   imgEle.src ="/verfi?a="+new Date().getTime();
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>
</head>
<body>
<div align="center" style="padding-top: 50px;">
  <form action="loging5" method="post">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
    <%=Lvloginshenhedao.show1()%>
    <table>

      <tr height="10">
        <td width="40%"></td>
        <td width="10%">审核：</td>
        <td><input type="text"  name="agree1"></td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="10%">教室：</td>
        <td><input type="text"  name="classrooml1"></td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="10%">审核时间：</td>
        <td><input type="text"  name="applytimel1"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%"><input type="submit" value="确定"></td>
        <td><a href="Threeloginout.jsp">返回</a></td>
        <td width="30%"></td>
      </tr>
      </table>
  </form>
</div>
</body>
</html>
