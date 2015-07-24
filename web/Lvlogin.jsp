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
    <style>
        *{margin:0;padding:0}
        .top{ margin:0 auto; width:100%;
            height:100px;background: #1B7FFF}
        .top .l-head{width:1000px;
            height:100px;
            margin: 0 auto;
        }
        .top .l-head .l-logo{float:left}
        .top .l-head .l-visit{color:#FF1510;font-size:18px;}
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
            width: 300px;height:40px;}
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
                            <input type="text" class="l-name" name="username1">
                        </p>
                    <p>
                        <span>密码：</span>
                        <input type="password" class="l-name" name="password1">
                    </p>
                    <p>
                        <input type="submit" class="l-submit" value="登录">
                    </p>
                </div>
            </div>

            <%--<img border="0" src="img/am.jpg" width="100%" height="100%"--%>
                 <%--style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>--%>
            <%--<table>--%>
                <%--<tr height="10">--%>
                    <%--<td width="40%"></td>--%>
                    <%--<td width="10%">审核老师用户名：</td>--%>
                    <%--<td><input type="text" class="lvlogin" value="${username}" id="username" name="username1"></td>--%>
                    <%--<td width="30%"></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td width="40%"></td>--%>
                    <%--<td width="10%">密    码：</td>--%>
                    <%--<td><input type="password" value="${password}" id="password" name="password1"></td>--%>
                    <%--<td width="30%"></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td width="40%"></td>--%>
                    <%--<td width="10%"><input type="submit" value="登入"></td>--%>
                    <%--<td><a href="Lvlogin.jsp">重置</a></td>--%>
                    <%--<td width="30%"></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td width="40%"></td>--%>
                    <%--<font color="red">${ error}</font>--%>
                <%--</tr>--%>
            <%--</table>--%>
        </form>
    <%--</div>--%>

    </body>
</html>
