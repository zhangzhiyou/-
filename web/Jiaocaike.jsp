<%@ page import="java.net.URLDecoder" %>
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
<%
  request.setCharacterEncoding("utf-8");
  String username1="";
  String password1="";
  Cookie[] cookies = request.getCookies();//获取前一个页面的cookie数组
  if(cookies !=null&&cookies.length>0){
    for(Cookie c:cookies){//遍历cookie
      if(c.getName().equals("usernames")){//这个usernames就是添加cookie值时的username,比较cookie中的值是否和输入的值相等
        username1= URLDecoder.decode(c.getValue());//如果相等就取出，cookie字符窗中的cookie的值
        System.out.println("======="+username1);
      }
      if(c.getName().equals("passwords")){
        password1 =URLDecoder.decode(c.getValue());
        System.out.println("--------"+password1);
      }
    }
  }
%>
<div align="center" style="padding-top: 50px;">
  <form action="loging2" method="post">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
    <table>
      <tr height="10">
        <td width="40%"></td>
        <td width="10%">教材科用户名：</td>
        <td><input type="text" value="${username1}" id="username" name="username3"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="10%">密    码：</td>
        <td><input type="password" value="${password1}" id="password" name="password3"></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <td width="10%"><input type="submit" value="登入"></td>
        <td><a href="Jiaocaike.jsp">重置</a></td>
        <td width="30%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
            <td width="10%"><input  type="checkbox" checked="checkde" name="check2"></td>
           <td>10天內记住密码</td>
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
