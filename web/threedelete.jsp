<%@ page import="Dao.Lvloginshenhedao" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-27
  Time: 下午3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <% if(session.getAttribute("currentUser")==null) {
    response.sendRedirect("Management.jsp");
    return;
  }
  %>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      //   imgEle.src ="/verfi?a="+new Date().getTime();
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>
    <link rel="stylesheet" type="text/css"href="css/threedelete.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>
 <script type="text/javascript">
     $(document).ready(function(){
         $("#delete").click(function(){
             var selectedRows = $("#dg").datagrid('getSelections');//创建了一个对象，对象的内容，把是你选的所有的内容
             if(selectedRows.length==0){//假如用户一个也没选，给用户一个友情提醒
                 $.messager.alert("系统提示","请选择要删除的选项");
                 return;
             }
             var strIds=[];
             for(var i=0;i<selectedRows.length;i++){
                 strIds.push(selectedRows[i].id);
             }
             var ids = strIds.join(',');//遍历的每个strIds之间都添加一个','
             $.messager.confirm("系统提示","您确定要删除<font color='red'>"+selectedRows.length+"</font>条信息吗",function(r){
                 if(r){
                     $.post("grateDelete",{deiLds:ids},function(result){
                         if(result.success){//如果删除成功给出提示并且刷新#dg表
                             $.messager.alert("系统提示","您已成功删除<font color='red'>"+result.delNums+"</font>条记录");
                             $("#dg").datagrid("reload");
                         }
                         else{
                             alert("删除失败");
                         }
                     },"json");
                 }
             });
         });
     });
 </script>
</head>
<body>
    <img border="0" src="img/am.jpg" width="100%" height="100%"
         style='position: absolute;left:0px;top:0px;z-index: -1'/><br/>
   <div class="t-table">

     <table id="dg" title="申请教室审核后名单" class="easyui-datagrid" fitColumns="true"  pagination="true"
            rownumbers="true" url="paging"  toolbar="#tb">
       <thead>
       <tr>
           <th field="cb" checkbox="true"></th>
           <th field="id" width="20">id</th>
         <th field="username" width="50">姓名</th>
         <th field="agree" width="50">审核</th>
         <th field="classroom" width="50">教室</th>
         <th field="applytime" width="100">时间</th>
         <th field="unit" width="100">学院</th>
         <th field="fixedphone" width="80">单位电话</th>
         <th field="phone" width="80">个人电话</th>

       </tr>
       </thead>
     </table>
     <!--todo 被注解的内容-->
     <%--<%=Lvloginshenhedao.show1()%>--%>
    </div>
     <br/>
    <!--todo 开始注释-->
   <form  action="loging5" method="post">
     <div class="t-delect">
      <table id="table1">
      <tr>
        <td width="20%"></td>
        <td width="20%"><a  href="javascript:gradDelete()" id="delete" class="easyui-linkbutton" iconCls="icon-remove"plain="true">删除</a></td>
        <td><a href="index.jsp">返回</a>

        <td width="20%"></td>
      </tr>
      <tr>
        <td width="40%"></td>
        <font color="red">${error}</font>
      </tr>
      </table>
    <!--todo 注释结束-->
       </div>
    </form>

</body>
</html>
