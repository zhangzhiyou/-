<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-11-21
  Time: 下午12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <%--<%  if(session.getAttribute("curent")==null){--%>
    <%--response.sendRedirect("index.jsp");--%>
    <%--return;--%>
  <%--}--%>
  <%--%>--%>
    <title></title>

  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>

  <style type="text/css">
    .north{
      /*width: 100%;*/
      height: 100px;
      background-color: #fffeee;
      text-align: center;
    }
    .centers{
      background-color: red;
    }
    .west{
      width: 100px;
      background-color: #fffeee;
      height: 100%;
    }

  </style>



    <script type="text/javascript">
      $(function(){//todo 内置函数
        var treeData = [//treeData设置成全局的
          {
            text: "用户管理",
            children: [
              {
                text: "审核老师",
                    attributes: {//是属性
                      url: "manageUser/manageLv.jsp"
                    }
              },
              {
                text: "教师管理员",
                attributes: {
                   url:"manageUser/manageThree.jsp"
                }
              },
              {
                text:"教材科",
                attributes:{
                  url:"manageUser/manageMaterial.jsp"
                }
              }
            ]
          }
        ];
        $("#tree").tree({
          data:treeData,//定义了类型的变量
          lines:true,//说明树分支有线
          onClick:function(node){//点击事件
            if(node.attributes){//如果attributes属性存在
              openTeb(node.text,node.attributes.url);//
            }
          }
        });
       // 新增teb
        function openTeb(text,url){
          if($("#tabs").tabs("exists",text)){//tabs是div的id，.tabs是指tabs方法,如果存在
            $("#tabs").tabs("select",text);//如果存在，就选中
          }
          else{
            var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"><iframe/>"
            $("#tabs").tabs('add',{
              title:text,
              closable:true,//点击相应的链接可以打开新的页面,并且可以手动关闭,默认值时false
              content:content
            });
          }
        }
      });
    </script>
</head>
<body class="easyui-layout">
<div region="north" class="north" >
    <h1>系统管理员登陆管理员登陆</h1>
</div>

<div region="center" class="centers">
  <div class="easyui-tabs" fit="true" border="false" id="tabs">
    <div title="首页">
      <div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
    </div>
  </div>
</div>

<div region="west" class="west" style="width: 200px;" title="用户列表" split="true">
  <ul id="tree"></ul>
</div>
</body>
</html>
