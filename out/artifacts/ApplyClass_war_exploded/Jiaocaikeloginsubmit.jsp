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
    *{padding:0;margin: 0}
    body{font-size:12px;font-family:"微软雅黑" ;color: #666}
    th{background-color: #ff7f84;color: #000000
    }
    .top{width:100%;height:50px;background: #38C7FF}
    .top .t-head{width: 700px;height:50px;font-size: 20px;
      color: red;line-height: 100%;
    margin:0 auto;padding-left:650px;padding-top: 12px;}
    .login .t-body{width:669px;height:315px;background: bisque}
    .login .t-body .t-login{}
  </style>
</head>
    <body>
    <div class="top">
      <div class="t-head">
        申请教室需填表
      </div>
    </div>
    <div align="center" style="padding-top: 50px" class="login">
      <form action="loging4" method="post">

        <img border="0" src="img/am.jpg" width="100%" height="100%"
             style='position: absolute;left:0px;top:0px;z-index: -1'/>
        <%--<%=Lvloginshenhedao.show1()%>--%><!--todo 可以显示吕老师审批后的学生名单-->
       <div class="t-body" align="center">
        <table>
          <tr>
            <td width="10%"></td>
            <td width="15%" class="t-login">借用单位：</td>
            <td><input type="text"  name="unit"></td>
            <td width="20%"></td>
          </tr>

          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">借用人：</td>
            <td><input type="text"  name="name2"></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">单位电话：</td>
            <td><input type="text"  name="fixedphone"></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="17%" class="t-login">借用人电话：</td>
            <td><input type="text"  name="phone"></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font  class="t-login">申请的教室：</font>
            </td>
            <td><input type="text" name="classroom"></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font class="t-login"> 申请时间：</font>
            </td>
            <td><input type="text" name="applytimet"></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font  class="t-login">理由：</font>
            </td>
            <td><textarea name="reason" style="width:200px;height:80px;"></textarea></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">邮箱：</td>
            <td><input type="text" name="email"></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="40%"></td>
            <td><input type="submit" value="提交"></td>
            <td ><a href="Threeloginout.jsp">重置</a></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>
          <tr>
            <td width="40%"></td>
            <font color="red">${error}</font>
          </tr>
        </table>
       </div>
      </form>
    </div>
   </body>
</html>
