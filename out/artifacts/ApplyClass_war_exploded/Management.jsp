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
  <link rel="stylesheet" href="css/Management.css" type="text/css"/>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>


  <script type="text/javascript">
    $(function(){
      $(".l-login").each(function(){
        $(this)
                .css("position","relative")
                .animate({
                  left:"+=350",
                  top:"+=140"
                })
      })
    })
  </script>
  <style>

    /*.lvlogin{*/
      /*background: url("img/sdut1.jpg");position:relative }*/

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
      <p>
        <a class="l-back" href="index.jsp">返回上一级</a>
      </p>
      <p>
        <tr>
          <th>
            <font color="red">${error}</font>
          </th>
        </tr>
      </p>
    </div>
  </div>
</form>

</body>
</html>