<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-7-3
  Time: 下午7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style>
    *{margin:0;padding:0}
    .top{ margin:0 auto; width:100%;
      height:100px;background: #1B7FFF}
    .top .l-head{width:1000px;
      height:100px;
      margin: 0 auto;
    }
    .top .l-head .l-logo{float:left}
    .top .l-head .l-visit{color:#FF1510;font-size:24px;}
    .top .l-head .l-desc{float: right;color: #FFF ;line-height:100px;font-size:24px}
    .lvlogin{width:100%;height:700px;
      background: url("img/sdut1.jpg");position:relative }
    .lvlogin .l-login{width:500px;height:300px;
    position:absolute;top:140px;
      left:450px}
    .lvlogin .l-login p{width:300px;height:40px;
      background:#D5D1FF;border-radius:4px;
      float:left;
      margin:20px}
    .lvlogin .l-login p span{width:100px;height:40px;
      font-size:16px;color:#fff;background:#ABABC4;
      float:left;border-radius:4px;line-height:40px;
      text-align:center;
    }
    .lvlogin .l-login .l-name{width:200px;height:40px;
      font-size:16px;color: #fff;background:#9495A4;
      border-radius:4px;outline:none;border:0px;
      padding:5px;text-align:center;
    }
    .lvlogin .l-login .l-submit{
      width: 300px;height:40px; border-radius:4px}
  </style>
</head>
<body>
<form action="loging6" method="post">
  <div class="top">
    <div class="l-head">
      <div class="l-logo">
        <a href="http://www.sdut.edu.cn/">
          <img src="img/3.jpg" alt="美丽的冬天" width="160px" height="100px"/>
        </a>
      </div>
      <div class="l-visit">点击左侧图片欢迎访问山东理工大学网站</div>
      <div class="l-desc">
        教室管理员登录
      </div>
    </div>
  </div>
  <div class="lvlogin">
    <div class="l-login">
      <p>
        <span>用户名：</span>
        <input type="text" class="l-name" name="username2">
      </p>
      <p>
        <span>密码：</span>
        <input type="password" class="l-name" name="password2">
      </p>
      <p>
        <input type="submit" class="l-submit" value="登录">
      </p>
    </div>
  </div>
</form>
<%--<%--%>
  <%--request.setCharacterEncoding("utf-8");--%>
  <%--String username="";--%>
  <%--String password="";--%>
  <%--Cookie[] cookie=request.getCookies();--%>
  <%--if(cookie !=null&&cookie.length>0){--%>
    <%--for(Cookie c:cookie){--%>
      <%--if(c.getName().equals("username")){--%>
        <%--username= URLDecoder.decode(c.getValue());//得到cookie的值，并为其编码为utf-8--%>
      <%--}--%>
      <%--if(c.getName().equals("password")){--%>
        <%--password =URLDecoder.decode(c.getValue());--%>

      <%--}--%>
    <%--}--%>
  <%--}--%>

<%--%>--%>
<%--<div align="center" style="padding-top: 50px;">--%>
  <%--<form action="loging6" method="post">--%>
    <%--<img border="0" src="img/am.jpg" width="100%" height="100%"--%>
         <%--style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>--%>
    <%--<table>--%>
      <%--<tr height="10">--%>
        <%--<td width="40%"></td>--%>
        <%--<td width="10%">管理教室用户名：</td>--%>
        <%--<td><input type="text" value="${username}" id="username" name="username2"></td>--%>
        <%--<td width="30%"></td>--%>
      <%--</tr>--%>
      <%--<tr>--%>
        <%--<td width="40%"></td>--%>
        <%--<td width="10%">密    码：</td>--%>
        <%--<td><input type="password" value="${password}" id="password" name="password2"></td>--%>
        <%--<td width="30%"></td>--%>
      <%--</tr>--%>
      <%--<tr>--%>
        <%--<td width="40%"></td>--%>
        <%--<td width="10%"><input type="submit" value="登入"></td>--%>
        <%--<td><a href="Lvlogin.jsp">重置</a></td>--%>
        <%--<td width="30%"></td>--%>
      <%--</tr>--%>
      <%--<td width="40%"></td>--%>
      <%--<td width="10%">--%>
        <%--<input type="checkbox" name="usercheck" checked="checked">--%>
      <%--</td>--%>
      <%--<td>30內记住密码</td>--%>
      <%--<td width="30%"></td>--%>
      <%--<tr>--%>
        <%--<td width="40%"></td>--%>
        <%--<font color="red">${ error}</font>--%>
      <%--</tr>--%>
    <%--</table>--%>
  <%--</form>--%>
<%--</div>--%>

</body>
</html>