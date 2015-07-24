<%@ page import="Dao.Jiaocaikesubmitdao" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% if(session.getAttribute("currentUser")==null) {
      response.sendRedirect("Lvlogin.jsp");
      return;
    }
    %>
    <script type="text/javascript">//页面index.jsp页面会被加载到但前页面
        function sayScript(){
            alert("<\/script>")//"\表示转意字符"
        }
    </script>
    <style>
        *{margin: 0;padding:0}

        th{background-color:deepskyblue;color: black}
        table#table3{background-color: blanchedalmond;
            color: black;width: 500px;}
            .s-teacher .s-table{width:1000px;margin: 0 auto;
                background-color:bisque;}
        .head{width:100%;height:70px;background-color: aquamarine;
            margin: 0 auto;position:relative; }
        .head .h-logo .h-chain{width:1000px;height:70px;
            margin:0 auto;}
        .s-teacher{ width:100%;height:600px;  position:absolute;
            padding-top:120px;}
        .head .h-logo .h-chain .h-desc{font-size: 20px;
            line-height:100% ;color:#FF1C24;
            float: right;padding-top: 20px;padding-right: 320px;}

    </style>
</head>
<body>
<form action="loging3" method="post">
<div class="head">
    <div class="h-logo">
        <div class="h-chain">
        <a href="http://lib.sdut.edu.cn/index.html">
            <img src="img/sdut.jpg" alt="美丽的图书馆"  width="150px" height="70px">
        </a>
            <div class="h-desc">
                点击左侧图片访问山东理工大学图书馆
            </div>
        </div>

    </div>
</div>
    <div align="center"  class="s-teacher">

            <img border="0" src="img/am.jpg" width="100%" height="100%"
                 style='position: absolute;left:0px;top:0px;z-index: -1'/>
            <div class="s-table">
            <%=Jiaocaikesubmitdao.show2()%>
            </div>
            <table id="table3">
                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用单位：</td>
                    <td><input type="text"  name="unit"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用人：</td>
                    <td><input type="text"  name="name1"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">单位电话：</td>
                    <td><input type="text"  name="fixedphone"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="30%">借用人电话：</td>
                    <td><input type="text"  name="phone"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用时间：</td>
                    <td><input type="text"  name="applytimel"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用教室：</td>
                    <td><input type="text"  name="classrooml"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">
                        <font >审批：</font></td>
                    <td><label>同意</label><input type="radio" value="同意" name="agree">
                        <label>不同意</label><input type="radio" value="不同意" name="agree"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%"><input type="submit" value="确定"></td>
                    <td><a href="Lvloginout.jsp">重置</a></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>

                    <font color="red">${ error}</font>
                </tr>
            </table>

    </div>
</form>
</body>
</html>
