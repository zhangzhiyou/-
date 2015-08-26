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
    <link rel="stylesheet" type="text/css" href="css/lvloginout.css"/>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#delete").click(function(){
                var selectedRows = $("#dg").datagrid('getSelections');
                if(selectedRows.length==0){
                    $.messager.alert("系统提示","请选择要删除的项");
                    return;
                }
                var strIds=[];
                for(var i=0;i<selectedRows.length;i++){
                    strIds.push(selectedRows[i].id);//todo 选取每条记录的id
                }
                var ids =strIds.join(',');//todo 在查询出来的id之间加入','
                $.messager.confirm("系统提示","您确定要删除<font color='red'>"+selectedRows.length+"<font>条数据吗？",function(r){
                    if(r){
                        $.post("examineDelete",{deiLds:ids},function(result){
                            if(result.success){
                                $.messager.alert("系统提示","您已成功删除<font color='red'>"+result.delNums+"<font>条记录");
                                $("#dg").datagrid("reload");//todo 删除后刷新"#dg"表
                            }else{
                                alert("删除失败");
                            }
                        },"json")
                    }
                })
            })
        })
    </script>
</head>
<body>
<!--todo 被移到下面-->
<%--<form action="loging3" method="post">--%>
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
                <!--开始注释-->
            <%--<%=Jiaocaikesubmitdao.show2()%>--%>

                <table id="dg" title="申请教室审核后名单" class="easyui-datagrid" fitColumns="true"  pagination="true"
                    rownumbers="true"   url="apply_paging"  toolbar="#tb">
                    <thead>
                    <tr>
                        <th field="cb" checkbox="true"></th>
                        <th field="id" width="30">id</th>
                        <th field="username" width="30">姓名</th>
                        <th field="reason" width="120">理由</th>
                        <th field="classnumber" width="25">教室</th>
                        <th field="applytime1" width="85">申请时间</th>
                        <th field="temail" width="100">邮箱</th>
                        <th field="unit" width="90">学院</th>
                        <th field="phone" width="60">个人电话</th>
                        <th field="fixedphone" width="60">单位电话</th>
                    </tr>
                    </thead>
                </table>
            </div>
      <form action="loging3" method="post">
            <table id="table3">

                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用人：</td>
                    <td><input type="text"  name="name1"></td>
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
                    <td width="25%">借用时间：</td>
                    <td><input type="text"  name="applytimel"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">邮箱：</td>
                    <td><input type="text"  name="applytimel"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">学院：</td>
                    <td><input type="text" name="unit"></td>
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
                    <td width="25%">单位电话：</td>
                    <td><input type="text"  name="fixedphone"></td>
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
                    <td><a href="index.jsp">返回登录</a></td>
                    <td> <a href="javascript:gradDelete()" id="delete" class="easyui-linkbutton" iconCls="icon-remove"plain="true">删除</a></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <font color="red">${error}</font>
                </tr>
            </table>
      </form>
    </div>
</body>
</html>
