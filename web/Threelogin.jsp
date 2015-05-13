<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午3:11
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
  <form action="loging2" method="post">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
    <table>

      <tr height="10">
        <td width="40%"></td>
        <td width="10%">用户名：</td>
        <td><input type="text" value="${username2}" id="username" name="username2"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="10%">密    码：</td>
        <td><input type="password" value="${password2}" id="password" name="password2"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="10%"><input type="submit" value="登入"></td>
        <td><a href="Threelogin.jsp">重置</a></td>
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
