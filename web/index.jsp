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
      $(function(){
        $('.c-login').each(function(){
          $(this)
                  .css('position','relative')
                  .animate({
                    left:"+=450",
                    top:"+=199"
                  },
              'slow'
          )
        })
      })
    </script>
    <style type="text/css">
      /*.choose{background: url("img/edusdut.jpg")}*/
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
              <span>1.审批老师登录:</span>
              <input type="radio" class="c-radio" name="login" value='1' align="center"/>
            </p>
          <p>
            <span>2.教室管理员登录:</span>
            <input type="radio" class="c-radio" name="login" value='2' align="center"/>
          </p>
          <p>
            <span>3.教材科登录:</span>
            <input type="radio" class="c-radio" name="login" value='3' align="center"/>
          </p>
          <p>
            <input type="submit" class="c-submit" value="确定">
          </p>
          <p>
            <font color="red">${error}</font>
          </p>
        </div>
    </div>
  </form>
  </body>
</html>
