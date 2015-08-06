<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-7-3
  Time: 下午8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <%if(session.getAttribute("currentUser")==null) {
    response.sendRedirect("Jiaocaike.jsp");
    return;
  }%>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>
  <style>
    *{padding:0;margin: 0}
    body{font-size:12px;font-family:"微软雅黑" ;color: #666}
    th{background-color: #ff7f84;color: #000000
    }

    .top{width:100%;height:50px;background: #38C7FF}

    .top .t-sign{width:400px;  height: 50px;margin-left:20px;
      float:left;font-size:15px;}


    .top .t-head{width: 600px;height:50px;font-size: 20px;
      color: red;line-height: 100%;margin-bottom:1px;margin-top:13px;
      float:right;}

    .login .t-body{width:669px;height:315px;background: bisque;
    }
    .login .t-body .t-login{}
  </style>
</head>
    <body>
    <div class="top">
      <div class="t-sign">
        <a href="http://www.baidu.com/s?tn=baidurt&rtt=1&bsst=1&wd=%C9%BD%B6%AB%C0%ED%B9%A4%B4%F3%D1%A7&origin=ps">
          <img  src="img/sdut2.jpg" alt="美丽的山东理工大学" width="100" height="50"/>点击左侧图片访问山理工最新相关信息
        </a>
      </div>
      <div class="t-head">
        申请教室需填表(请按照表中样式填写表 邮箱可以选择不填)
      </div>
    </div>
    <div align="center" style="padding-top: 50px" class="login">
      <form action="loging4" method="post">

        <img border="0" src="img/am.jpg" width="100%" height="100%"
             style='position: absolute;left:0px;top:0px;z-index: -1'/>
        <%--<%=Lvloginshenhedao.show1()%>--%><!--todo 可以显示吕老师审批后的学生名单-->
       <div class="t-body" align="center">
        <table>
          <tr>
            <td width="10%"></td>
            <td width="15%" class="t-login">借用单位：</td>
            <td><input type="text"  name="unit" value="×××学院" onfocus="this.value=''" onblur="if(this.value=='')this.value='×××学院'"></td>
            <td width="20%"></td>
          </tr>

          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">借用人：</td>
            <td><input type="text"  name="name2" value=""></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">单位电话：</td>
            <td><input type="text"  name="fixedphone" value="123456" onfocus="this.value=''" onblur="if(this.value=='')this.value='123456'"></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="17%" class="t-login">借用人电话：</td>
            <td><input type="text" name="phone" value="123456"  onfocus="this.value=''" onblur="if(this.value=='')this.value='123456'"></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font  class="t-login">申请的教室：</font>
            </td>
            <td><input type="text" name="classroom" value="3104" onfocus="this.value=''" onblur="if(this.value=='')this.value='3104'" on></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font class="t-login"> 申请时间：</font>
            </td>
            <td><input type="text" name="applytimet" value="周三 五六节（第三周）" onfocus="this.value =''" onblur="if (this.value=='')this.value='周三 五六节（第三周）'"></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>

          <tr>
            <td width="20%"></td>
            <td width="10%">
              <font  class="t-login">理由：</font>
            </td>
            <td><textarea name="reason" style="width:200px;height:80px;"></textarea></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="20%"></td>
            <td width="10%" class="t-login">邮箱：</td>
            <td><input type="text" name="email"></td>
            <td width="30%"></td>
          </tr>

          <tr></tr>
          <tr>
            <td width="40%"></td>
            <td><input type="submit" value="提交"></td>
            <td ><a href="index.jsp">返回登录</a></td>
            <td width="30%"></td>
          </tr>
          <tr></tr>
          <tr>
            <td width="40%"></td>
            <font color="red">${error}</font>
          </tr>
          <tr>
            <td width="40%"></td>
            <font color="red">${success}</font>
          </tr>
        </table>
       </div>
      </form>
    </div>
   </body>
</html>
