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
    .top .l-head .l-desc{float: right;color: #FFF ;line-height:100px;font-size:24px;padding-right:123px;}
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
        <input type="text" class="l-name" name="username2" autocomplete="off">
      </p>
      <p>
        <span>密码：</span>
        <input type="password" class="l-name" name="password2" autocomplete="off">
      </p>
      <p>
        <input type="submit" class="l-submit" value="登录">
      </p>
    </div>
  </div>
</form>

</body>
</html>