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
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>
  <style>
    th{background-color: deepskyblue;color: black}
    table#table1{background-color: #FFEFC1;color: black ;width: 500px;}
    .t-table{width:965px;background-color: bisque;}
    .t-delect{margin-left: 190px;margin-top: 30px;padding-left: 1px;padding-top:1px; }
  </style>
</head>
<body>

    <!--todo form被移到下面-->
   <%--<form  action="loging5" method="post">--%>
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
   <div class="t-table">

     <table id="dg" title="申请教室审核后名单" class="easyui-datagrid" fitColumns="true"  pagination="true"
            rownumbers="true" url="paging"  toolbar="#tb">
       <thead>
       <tr>
         <th field="username" width="50">姓名</th>
         <th field="agree" width="50">审核</th>
         <th field="classroom" width="50">教室</th>
         <th field="applytime" width="100">时间</th>
         <th field="unit" width="100">学院</th>
         <th field="fixedphone" width="80">单位电话</th>
         <th field="phone" width="80">个人电话</th>

       </tr>
       </thead>
     </table>
     <!--todo 被注解的内容-->
     <%--<%=Lvloginshenhedao.show1()%>--%>
    </div>
     <br/>
    <!--todo 开始注释-->
   <form  action="loging5" method="post">
     <div class="t-delect">
      <table id="table1">
          <tr height="10">
              <td width="40%"></td>
              <td width="20%">
                  <font >借用人</font>:</td>
              <td><input type="text"  name="username"></td>
              <td width="30%"></td>
          </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="20%">
          <font >审核</font>：</td>
        <td><label>同意</label><input type="radio" value="同意" name="agree1">
        <label>不同意</label><input type="radio" value="不同意" name="agree1">
        </td>
        <td width="30%"></td>
      </tr>
      <tr height="10">
        <td width="40%"></td>
        <td width="20%">
          <font >借用教室</font>:</td>
        <td><input type="text"  name="classrooml1"></td>
        <td width="30%"></td>
      </tr>

      <tr height="10">
        <td width="40%"></td>
        <td width="25%">
          <font >借用时间</font>：</td>
        <td><input type="text"  name="applytimel1"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="5%"><input type="submit" value="删除"></td>
        <td><a href="Management.jsp">返回</a>

        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <font color="red">${error}</font>
      </tr>
      </table>
    <!--todo 注释结束-->
       </div>
    </form>

</body>
</html>
