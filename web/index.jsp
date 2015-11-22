<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>欢迎来到主页面</title>
    <script type="text/javascript">
      function _change(){
        var imgEle=document.getElementById("img");
        //   imgEle.src ="/verfi?a="+new Date().getTime();
        imgEle.src="/verfi?a="+new Date().getTime();
      }
    </script>
    <%--<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">--%>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
      function myReload() {
        document.getElementById("CreateCheckCode").src = document.getElementById("CreateCheckCode").src + "?nocache=" + new Date().getTime();
      }
    </script>
    <style type="text/css">
    </style>
  </head>
  <body>
  <form id="form" method="post" action="loging">
    <div class="top">
      <div class="t-head">
        <div class="t-logo">
          <a href="http://jwch.sdut.edu.cn/">
            <img src="img/sdut2.jpg" alt="美丽的山东理工大学" width="200px" height="150px">
          </a>
        </div>
        <div class="t-desc">
          点击左侧图片访问教务处网站
        </div>
        <div class="t-login">
          选择登录
        </div>
      </div>
    </div>
    <div class="choose">
        <div class="c-login">
          <p>
            <span>用户名:</span>
            <input type="text" class="c-radio" name="username" >
          </p>
          <p>
            <span>密  码:</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" class="c-radio" name="password">
          </p>
          <p class="c-p">
            选择登录：
            <input class="chooses" checked="checked" type="radio" name="chooses" value="审核老师">审核老师
            <input class="chooses" type="radio" name="chooses" value="教材科">教材科
            <input class="chooses" type="radio" name="chooses" value="教室管理员">教室管理员
            <input class="chooses" type="radio" name="chooses" value="管理员登陆">系统管理员
          </p>
          <p class="yanzhengma">验证码：
            <input name="checkCode" class="cheak" type="text" id="checkCode" title="验证码区分大小写"
                   size="8" ,maxlength="4"/>
            <img src="DrawImage" id="CreateCheckCode" align="middle">
            <a  id="c-change" onclick="myReload()">换一个(全是大写)</a>
          </p>
          <p>
            <input style="cursor: pointer" type="submit" class="c-submit" value="确定">
          </p>
          <p class="error">
            <font color="red">${error}</font>
          </p>
        </div>
    </div>
  </form>
  </body>
</html>
