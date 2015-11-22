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
      response.sendRedirect("index.jsp");
      return;
    }
    %>
    <script type="text/javascript">//页面index.jsp页面会被加载到当前页面
        function sayScript(){
            alert("<\/script>")//"\表示转意字符"
        }
    </script>
    <!--引用-->
    <link rel="stylesheet" type="text/css" href="css/lvloginout.css"/>

    <!--引用jqueary已经封装好的js-->
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
//                alert(selectedRows);
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
            });
            $("#shenhe").click(function(){
                var selecteRow=$("#dg").datagrid('getSelections');
                if(selecteRow.length==0){
                    $.messager.alert("系统提示","请选择要审核的项或审核结果");
                    return;
                }
                /**
                 * 获取输入框
                 * */
                var value = $("input[name='agree'][type='radio']:checked").val();
                var strId=[];
                for(var i=0;i<selecteRow.length;i++){
                    strId.push(selecteRow[0].id);
                }
                var id=strId.join(',');

                $.post("examinAdd",{deild:id,agree:value},function(result){
                    if(result.success){
                        $.messager.alert("系统提示","您已成功审核完一条");
                        $("#dg").datagrid("reload");
                    }else{
                        alert("审核失败");
                    }
                },"json")
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
            <img src="img/sdut.jpg" alt="美丽的图书馆"  width="250px" height="150px">
        </a>
            <div class="h-desc">
                点击左侧图片访问山东理工大学图书馆
            </div>
        </div>

    </div>
</div>
    <div align="center"  class="s-teacher">

            <div class="s-table">

                <table id="dg" title="申请教室审核后名单" class="easyui-datagrid" fitColumns="true"  pagination="true"
                    rownumbers="true"   url="apply_paging"  toolbar="#tb">
                    <thead>
                    <tr>
                        <th field="cb" checkbox="true"></th>
                        <th field="id" width="30">id</th>
                        <th field="username" width="30">姓名</th>
                        <th field="reason" width="110">理由</th>
                        <th field="classnumber" width="25">教室</th>
                        <th field="applytime1" width="95">申请时间</th>
                        <th field="unit" width="90">学院</th>
                        <th field="phone" width="60">个人电话</th>
                        <th field="fixedphone" width="60">单位电话</th>
                        <th>
                            <label>同意</label><input class="agree1" checked="checked" type="radio" value="同意" name="agree">
                            <label>不同意</label><input class="agree1" type="radio" value="不同意" name="agree">
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
                <div class="l-aligon">
                   <table id="table3">
                    <tr>
                        <td width="10%"></td>
                        <%--<td width="30%"><input class="confirm" type="submit" value="确定"></td>--%>
                        <td width="20%"><a class="L-back" href="index.jsp">返回登录</a></td>
                        <td width="20%"> <a href="javascript:gradDelete()" id="delete" class="easyui-linkbutton" iconCls="icon-remove"plain="true">删除</a></td>
                        <td width="20%"> <a href="javascript:gradeAdd()" id="shenhe" class="easyui-linkbutton" iconCls="icon-remove"plain="true">审核</a></td>
                    </tr>
                   </table>
                </div>
    </div>
</body>
</html>
