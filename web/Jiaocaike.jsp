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
  <link rel="stylesheet" type="text/css" href="css/jiaocaike.css"/>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript">
    $(function(){
      $('.l-login').each(function(){
        $(this)
                .css('position','relative')
                .animate({
                  left:"+=384",
                  top:"+=110"
                },
                'slow'
        )
      })
    })
  </script>
  <style>
    .lvlogin{
      background: url("img/sdut1.jpg");}
  </style>
</head>
<body>

<%--<div align="center" style="padding-top: 50px;">--%>
<form action="loging2" method="post">
  <div class="top">
    <div class="l-head">
      <div class="l-logo">
        <a href="http://www.sdut.edu.cn/">
          <img src="img/3.jpg" alt="美丽的冬天" width="160px" height="100px"/>
        </a>
      </div>
      <div class="l-visit">点击左侧图片欢迎访问山东理工大学网站</div>
      <div class="l-desc">
        教材科申请人登录
      </div>
    </div>
  </div>
  <div class="lvlogin">
    <div class="l-login">
      <p>
        <span>用户名：</span>
        <input type="text" class="l-name" name="username3" autocomplete="off">
      </p>
      <p>
        <span>密码：</span>
        <input type="password" class="l-name" name="password3" autocomplete="off">
      </p>
      <p>
        <input type="submit" class="l-submit" value="登录" >
      </p>
      <p>
        <tr>
          <td width="40%"></td>
          <font color="red">${error}</font>
        </tr>
      </p>
    </div>
  </div>
</form>
</body>
</html>
