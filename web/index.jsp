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
    <style type="text/css">
    div{
     border-top: 1px dashed blue;
      border-right:1px dotted #2b42ff;
      border-left:1px solid #ff0000;
      border-bottom: 1px solid chartreuse ;
    }
    </style>
  </head>
  <body>
  <form id="form" method="post" action="loging">
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
    <div align="center">
      <tr>
        <td>
          <table width=300 height=400 border="1" bordercolor="#ff00ff" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" valign="middle">
                <font color="#7fff00">请选择登录方式:</font>
             </td>
            </tr>
            <tr>
              <td>
                <font color="#FF0000">1.审批老师登录:</font>
                <label>
                  <input type="radio" name="login" value="1">
                </label>
              </td>
            </tr>
            <tr>
            <td>
              <font color="#FF0000">2.教室管理员登录:</font>
              <label>
                <input type="radio" name="login" value="2">
              </label><br/>
            </td>
            </tr>
            <tr>
            <td>
              <font color="black">3.教材科登录:</font>
              <label>
                <input type="radio" name="login" value="3">
              </label>
            </td>
            </tr>
            <tr>
              <td align="center" valign="middle">
                <input type="submit" value="登录">
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </div>
  </form>
  </body>
</html>
