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
        <form action="loging1" method="post">
            <img border="0" src="img/am.jpg" width="100%" height="100%"
                 style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
            <table>

                <tr height="10">
                    <td width="40%"></td>
                    <td width="10%">用户名：</td>
                    <td><input type="text" value="${username1}" id="username" name="username1"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="10%">密    码：</td>
                    <td><input type="password" value="${password1}" id="password" name="password1"></td>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="10%"><input type="submit" value="登入"></td>
                    <td><a href="Lvlogin.jsp">重置</a></td>
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
