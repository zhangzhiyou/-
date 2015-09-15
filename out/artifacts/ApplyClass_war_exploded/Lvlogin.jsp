<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%--<script type="text/javascript">--%>
        <%--function _change(){--%>
            <%--var imgEle=document.getElementById("img");--%>
            <%--//   imgEle.src ="/verfi?a="+new Date().getTime();--%>
            <%--imgEle.src="/verfi?a="+new Date().getTime();--%>
        <%--}--%>

    <%--</script>--%>
    <link type="text/css" href="css/Lvlogin.css" rel="stylesheet"/>
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
                          top:"+=125"
                      })
          })
      })


   </script>

    <style>
        /*.lvlogin{*/
            /*background: url("img/sdut1.jpg");*/
        /*}*/
    </style>
</head>
    <body>

    <%--<div align="center" style="padding-top: 50px;">--%>
        <form action="loging1" method="post">
            <div class="top">
                <div class="l-head">
                    <div class="l-logo">
                        <a href="http://www.sdut.edu.cn/">
                            <img src="img/3.jpg" alt="美丽" width="160px" height="100px"/>
                        </a>
                    </div>
                    <div class="l-visit">点击左侧图片欢迎访问山东理工大学网站</div>
                    <div class="l-desc">
                        审核教室老师登录
                    </div>
                </div>
            </div>
            <div class="lvlogin">
                <div class="l-login">
                        <p>
                            <span>用户名：</span>
                            <input type="text" class="l-name" name="username1" autocomplete="off">
                        </p>
                    <p>
                        <span>密码：</span>
                        <input type="password" class="l-name" name="password1" autocomplete="off">
                    </p>
                    <p>
                        <input type="submit" class="l-submit" value="登录">
                    </p>
                    <p>
                        <a class="l-href" href="index.jsp">返回上一级页面</a>
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
    <%--</div>--%>

    </body>
</html>
