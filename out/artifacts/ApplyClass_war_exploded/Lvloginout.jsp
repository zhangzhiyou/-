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
                alert(selectedRows);
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
                    $.messager.alert("系统提示","请选择要审核的项");
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

                alert("hello"+id);
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
    <style>
       .s-table #dg tr:nth-of-type(even){
           background-color: #edf3cf;
        }
        .s-table #dg tr:nth-of-type(odd){
            background-color: #a7a7a7;
        }
    </style>
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
            <%--<img border="0" src="img/beijing3.jpg" width="100%" height="100%"--%>
                 <%--style='position: absolute;left:0px;top:0px;z-index: -1'/>--%>
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
                        <th field="reason" width="110">理由</th>
                        <th field="classnumber" width="25">教室</th>
                        <th field="applytime1" width="95">申请时间</th>
                        <th field="temail" width="100">邮箱</th>
                        <th field="unit" width="90">学院</th>
                        <th field="phone" width="60">个人电话</th>
                        <th field="fixedphone" width="60">单位电话</th>
                        <th>
                            <label>同意</label><input class="agree1" type="radio" value="同意" name="agree">
                            <label>不同意</label><input class="agree1" type="radio" value="不同意" name="agree">
                        </th>
                    </tr>
                    </thead>

                </table>
            </div>
      <%--<form action="loging3" method="post">--%>
            <%--<table id="table3">--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">借用人：</td>--%>
                    <%--<td width="40%"><input type="text"  name="name1"></td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">教室：</td>--%>
                    <%--<td width="50%">--%>
                        <%--<input type="text"name="classrooml">--%>
                    <%--</td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>

                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">邮箱：</td>--%>
                    <%--<td width="50"><input type="text" validType="email" class="easyui-validatebox"  name="email"></td></br>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>

                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="35%">个人电话：</td>--%>
                    <%--<td width="50%"><input type="text"  name="phone"></td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="35%">单位电话：</td>--%>
                    <%--<td width="50%"><input type="text"  name="fixedphone"></td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">--%>
                        <%--<font >审批：</font></td>--%>
                    <%--<td width="50%" class="agree"><label>同意</label><input class="agree1" type="radio" value="同意" name="agree">--%>
                        <%--<label>不同意</label><input class="agree1" type="radio" value="不同意" name="agree"></td></br>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">学院：</td>--%>
                    <%--<td width="50%">--%>
                        <%--<select name="unit" id="selectAge">--%>
                            <%--<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>--%>
                            <%--<option value="机械工程学院">机械工程学院</option>--%>
                            <%--<option value="交通与车辆工程学院">交通与车辆工程学院</option>--%>
                            <%--<option value="电气与电子工程学院">电气与电子工程学院</option>--%>
                            <%--<option value="计算机科学与技术学院">计算机科学与技术学院</option>--%>
                            <%--<option value="化学工程学院">化学工程学院</option>--%>
                            <%--<option value="建筑工程学院">建筑工程学院</option>--%>
                            <%--<option value="资源与环境工程学院">资源与环境工程学院</option>--%>
                            <%--<option value="材料科学与工程学院">材料科学与工程学院</option>--%>
                            <%--<option value="生命科学学院">生命科学学院</option>--%>
                            <%--<option value="理学院">理学院</option>--%>
                            <%--<option value="商学院">商学院</option>--%>
                            <%--<option value="文学与新闻传播学院">文学与新闻传播学院</option>--%>
                            <%--<option value="外国语学院">外国语学院</option>--%>
                            <%--<option value="法学院">法学院</option>--%>
                            <%--<option value="马克思主义学院">马克思主义学院</option>--%>
                            <%--<option value="美术学院">美术学院</option>--%>
                            <%--<option value="音乐学院">音乐学院</option>--%>
                            <%--<option value="体育学院">体育学院</option>--%>
                            <%--<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td width="10%"></td>--%>
                    <%--<td width="30%">时间：</td>--%>
                    <%--&lt;%&ndash;<input type="text"  name="applytimel">&ndash;%&gt;--%>
                    <%--<td width="70">--%>
                        <%--<select name="applytime1">--%>
                            <%--<option value="周一">周一</option>--%>
                            <%--<option value="周二">周二</option>--%>
                            <%--<option value="周三">周三</option>--%>
                            <%--<option value="周四">周四</option>--%>
                            <%--<option value="周五">周五</option>--%>
                            <%--<option value="周六">周六</option>--%>
                            <%--<option value="周日">周日</option>--%>
                        <%--</select>--%>
                        <%--<select name="applytime2">--%>
                            <%--<option value="第一.二节">第一.二节</option>--%>
                            <%--<option value="第三.四节">第三.四节</option>--%>
                            <%--<option value="第五.六节">第五.六节</option>--%>
                            <%--<option value="第七.八节">第七.八节</option>--%>
                            <%--<option value="第九.十节">第九.十节</option>--%>
                        <%--</select>--%>


                        <%--<select name="applytime3">--%>
                            <%--<option value="(第一周)">第一周</option>--%>
                            <%--<option value="(第二周)">第二周</option>--%>
                            <%--<option value="(第三周)">第三周</option>--%>
                            <%--<option value="(第四周)">第四周</option>--%>
                            <%--<option value="(第五周)">第五周</option>--%>
                            <%--<option value="(第六周)">第六周</option>--%>
                            <%--<option value="(第七周)">第七周</option>--%>
                            <%--<option value="(第八周)">第八周</option>--%>
                            <%--<option value="(第九周)">第九周</option>--%>
                            <%--<option value="(第十周)">第十周</option>--%>
                            <%--<option value="(第十一周)">第十一周</option>--%>
                            <%--<option value="(第十二周)">第十二周</option>--%>
                            <%--<option value="(第十三周)">第十三周</option>--%>
                            <%--<option value="(第十四周)">第十四周</option>--%>
                            <%--<option value="(第十五周">第十五周</option>--%>
                            <%--<option value="(第十六周)">第十六周</option>--%>
                            <%--<option value="(第十七周)">第十七周</option>--%>
                            <%--<option value="(第十八周)">第十八周</option>--%>
                            <%--<option value="(第十九周)">第十九周</option>--%>
                            <%--<option value="(第二十周)">第二十周</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                    <%--<td width="10%"></td>--%>
                <%--</tr>--%>
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
