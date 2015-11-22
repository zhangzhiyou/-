<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-11-21
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师管理员用户</title>
  <!--加载文件的路径是相对与当前文件夹来说的,因为要加载的文件夹在本文件夹的上一层所以要要加'/'-->
  <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.3.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.3.6/themes/icon.css">
  <script type="text/javascript" src="/jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="/vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>


  <script type="text/javascript">
    $(document).ready(function(){
      $("#delete").click(function(){
        var selectRows = $("#dg").datagrid('getSelections');//获取表格中checkbox中id的值并且存放到数组中
        if(selectRows.length==0){
          $.messager.alert("系统提示","请选择要删除的项");
          return;
        }
       var stringId=[];
        for(var i=0;i<selectRows.length;i++){
          stringId.push(selectRows[i].id);
        }
        var ids= stringId.join(',');
        $.messager.confirm("系统提示","你确定要删除<font color='red'>"+selectRows.length+"<font>条数据",function(r){
          if(r){
            $.post("threedelect",{deiLds:ids},function(result){
              if(result.success){
                $.messager.alert("系统提示","你以成功删除<font color='red'>"+result.delNums+"<font>条数据");
                $("#dg").datagrid("reload");//删除后重新刷新表
              }
              else{
                alert("删除失败");
              }
            },"json")//如果没有最后'json'格式会给出"删除失败的提示"
          }
        })
      })



    })
  </script>

  <style type="text/css">
    .three{
      width: 100%;
    }

  </style>
</head>
<body>
  <div class="three">
    <div class="t-table">
      <table id="dg" title="系统用户" class="easyui-datagrid" fitColumns="false"  pagination="true"
             rownumbers="true"   url="three_paging"  toolbar="#tb">
        <thead>
          <tr>
            <th field="cb" checkbox="true"></th>
            <th field="id" width="200" >id</th>
            <th field="name1" width="200">用户名</th>
            <th field="password1" width="200">密码</th>
          </tr>
        </thead>
      </table>
    </div>
    <div class="t-submit">
      <table id="table3">
        <tr>
          <td width="65%"></td>
          <%--<td width="30%"><input class="confirm" type="submit" value="确定"></td>--%>
          <%--<td width="20%"><a class="L-back" href="index.jsp">返回登录</a></td>--%>
          <td width="20%"> <a href="javascript:gradDelete()" id="delete" class="easyui-linkbutton" iconCls="icon-remove"plain="true">删除</a></td>
          <td width="20%"> <a href="javascript:gradeAdd()" id="adddata" class="easyui-linkbutton" iconCls="icon-remove"plain="true">添加</a></td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>
