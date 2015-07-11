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
  <% if(session.getAttribute("currentUser")==null) {
    response.sendRedirect("Management.jsp");
    return;
  }
  %>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      //   imgEle.src ="/verfi?a="+new Date().getTime();
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>
  <style>
    th{background-color: deepskyblue;color: black}
    table#table1{background-color: #f7f6ff;color: black ;width: 500px;}
  </style>
</head>
<body>
<div align="center" style="padding-top: 50px;">
  <form action="loging5" method="post">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
  <%=Lvloginshenhedao.show1()%><br/>
    <table id="table1">
      <tr height="10">
        <td width="40%"></td>
        <td width="20%">
          <font color="yellow">审核</font>：</td>
        <td><label>同意</label><input type="radio" value="同意" name="agree1">
        <label>不同意</label><input type="radio" value="不同意" name="agree1">
        </td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="20%">
          <font color="lime">借用教室</font>:</td>
        <td><input type="text"  name="classrooml1"></td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="20%">
          <font color="lime">借用人</font>:</td>
        <td><input type="text"  name="username"></td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="25%">
          <font color="red">审请时间</font>：</td>
        <td><input type="text"  name="applytimel1"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%"><input type="submit" value="删除"></td>
        <td><a href="Management.jsp">返回</a></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <font color="red">${error}</font>
      </tr>
      </table>
    </form>
  </div>
</body>
</html>
