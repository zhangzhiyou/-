<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-7-3
  Time: 下午8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <%if(session.getAttribute("currentUser")==null) {
    response.sendRedirect("Jiaocaike.jsp");
    return;
  }%>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      imgEle.src="/verfi?a="+new Date().getTime();
    }
    input
  </script>
  <style>
    th{background-color: #ff7f84;color: #000000
    }
  </style>
</head>
    <body>
    <div align="center" style="padding-top: 50px">
      <form action="loging4" method="post">
        <img border="0" src="img/am.jpg" width="100%" height="100%"
             style='position: absolute;left:0px;top:0px;z-index: -1'/>
        <%--<%=Lvloginshenhedao.show1()%>--%><!--todo 可以显示吕老师审批后的学生名单-->
        <table>
          <tr>
            <td width="40%"></td>
            <td width="3%">借用单位：</td>
            <td><input type="text"  name="unit"></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td width="3%">借用人：</td>
            <td><input type="text"  name="name2"></td>
            <td width="30%"></td>
          </tr>

          <tr>
            <td width="40%"></td>
            <td width="3%">单位电话：</td>
            <td><input type="text"  name="fixedphone"></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td width="3%">借用人电话：</td>
            <td><input type="text"  name="phone"></td>
            <td width="30%"></td>
          </tr>


          <%--<tr>--%>
          <%--<td width="40%"></td>--%>
          <%--<td width="5%">学号：</td>--%>
          <%--<td><input type="text" name="number2"></td>--%>
          <%--<td width="30%"></td>--%>
          <%--</tr>--%>
          <tr>
            <td width="40%"></td>
            <td width="5%">
              <font color="#a52a2a">申请的教室：</font>
            </td>
            <td><input type="text" name="classroom"></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td width="10%">
              <font color="#a52a2a"> 申请时间：</font>
            </td>
            <td><input type="text" name="applytimet"></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td width="5%">
              <font color="#ff3dda">理由：</font>
            </td>
            <td><textarea name="reason" style="width:200px;height:80px;"></textarea></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td width="5%">邮箱：</td>
            <td><input type="text" name="email"></td>
            <td width="30%"></td>
          </tr>
          <tr>
            <td width="40%"></td>
            <td><input type="submit" value="确认"></td>
            <td ><a href="Threeloginout.jsp">重置</a></td>
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
