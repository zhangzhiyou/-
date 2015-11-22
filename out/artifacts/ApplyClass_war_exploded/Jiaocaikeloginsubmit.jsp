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
    response.sendRedirect("index.jsp");
    return;
  }%>
  <script type="text/javascript">
    function _change(){
      var imgEle=document.getElementById("img");
      imgEle.src="/verfi?a="+new Date().getTime();
    }
  </script>

  <link type="text/css" href="css/jiaocaikeloginsubmit.css" rel="stylesheet"/>
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>
</head>
    <body class="easyui-layout">
    <div region="north" class="north" >
        <div  class="top">
          <div class="t-sign">
            <a href="http://www.baidu.com/s?tn=baidurt&rtt=1&bsst=1&wd=%C9%BD%B6%AB%C0%ED%B9%A4%B4%F3%D1%A7&origin=ps" style="text-decoration:none">
              <img  src="img/sdut2.jpg" alt="美丽的山东理工大学" width="150" height="100" />点击图片访问山理工最新相关信息
            </a>
          </div>
          <div class="t-head">
            申请教室需填表(请按照表中样式填写表)
          </div>
        </div>
    </div>

     <div region="center" class="centers">
        <div align="center"  class="login">
          <form action="loging4" method="post">
           <div class="t-body" align="center">
            <table class="table" style="color: #060607">

              <tr>
                <td width="20%"></td>
                <td width="10%" class="t-login">借用人：</td>
                <td><input type="text"  name="name2" placeholder="张三"></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <tr>
                <td width="20%"></td>
                <td width="10%" class="t-login">单位电话：</td>
                <td><input type="text" name="fixedphone" placeholder="123456"></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <tr>
                <td width="20%"></td>
                <td width="17%" class="t-login">借用人电话：</td>
                <td><input type="text" name="phone" placeholder="123456"></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>

              <tr>
                <td width="20%"></td>
                <td width="10%">
                  <font  class="t-login">申请的教室：</font>
                </td>
                <td><input type="text" name="classroom" placeholder="3101"></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <tr>
                <td width="20%"></td>
                <td width="10%">
                  <font  class="t-login">理由：</font>
                </td>
                <td><textarea name="reason" style="width:200px;height:80px;" placeholder="学习"></textarea></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <tr>
                <td width="20%"></td>
                <td width="10%" class="t-login">邮箱：</td>
                <td><input type="text" name="email" validType="email" placeholder="用于查看审核后的结果" class="easyui-validatebox"></td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <tr>
                <td width="10%"></td>
                <td width="15%" class="t-login">借用单位：</td>
                <%--<td><input type="text"  name="unit" value="×××学院" onfocus="this.value=''" onblur="if(this.value=='')this.value='×××学院'"></td>--%>
                <td>
                  <select name="unit" id="selectAge">
                    <option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
                    <option value="机械工程学院">机械工程学院</option>
                    <option value="交通与车辆工程学院">交通与车辆工程学院</option>
                    <option value="电气与电子工程学院">电气与电子工程学院</option>
                    <option value="计算机科学与技术学院">计算机科学与技术学院</option>
                    <option value="化学工程学院">化学工程学院</option>
                    <option value="建筑工程学院">建筑工程学院</option>
                    <option value="资源与环境工程学院">资源与环境工程学院</option>
                    <option value="材料科学与工程学院">材料科学与工程学院</option>
                    <option value="生命科学学院">生命科学学院</option>
                    <option value="理学院">理学院</option>
                    <option value="商学院">商学院</option>
                    <option value="文学与新闻传播学院">文学与新闻传播学院</option>
                    <option value="外国语学院">外国语学院</option>
                    <option value="法学院">法学院</option>
                    <option value="马克思主义学院">马克思主义学院</option>
                    <option value="美术学院">美术学院</option>
                    <option value="音乐学院">音乐学院</option>
                    <option value="体育学院">体育学院</option>
                    <option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
                  </select>
                </td>
                <td width="20%"></td>
              </tr>
              <tr></tr>
              <br/><br/>
              <tr>
                <td width="20%"></td>
                <td width="10%">
                  <font class="t-login"> 使用时间：</font>
                </td>
                <td>
                  <select name="applytimet3">
                    <option value="(第一周)">第一周</option>
                    <option value="(第二周)">第二周</option>
                    <option value="(第三周)">第三周</option>
                    <option value="(第四周)">第四周</option>
                    <option value="(第五周)">第五周</option>
                    <option value="(第六周)">第六周</option>
                    <option value="(第七周)">第七周</option>
                    <option value="(第八周)">第八周</option>
                    <option value="(第九周)">第九周</option>
                    <option value="(第十周)">第十周</option>
                    <option value="(第十一周)">第十一周</option>
                    <option value="(第十二周)">第十二周</option>
                    <option value="(第十三周)">第十三周</option>
                    <option value="(第十四周)">第十四周</option>
                    <option value="(第十五周">第十五周</option>
                    <option value="(第十六周)">第十六周</option>
                    <option value="(第十七周)">第十七周</option>
                    <option value="(第十八周)">第十八周</option>
                    <option value="(第十九周)">第十九周</option>
                    <option value="(第二十周)">第二十周</option>
                  </select>
                  <%--<input type="text" name="applytimet" placeholder="周一 三四节(第一周)">--%>
                  <select name="applytimet1">
                    <option value="周一">周一</option>
                    <option value="周二">周二</option>
                    <option value="周三">周三</option>
                    <option value="周四">周四</option>
                    <option value="周五">周五</option>
                    <option value="周六">周六</option>
                    <option value="周日">周日</option>
                  </select>
                    <select name="applytimet2">
                      <option value="第一.二节">第一.二节</option>
                      <option value="第三.四节">第三.四节</option>
                      <option value="第五.六节">第五.六节</option>
                      <option value="第七.八节">第七.八节</option>
                      <option value="第九.十节">第九.十节</option>
                      <option value="上午">上午</option>
                      <option value="下午">下午</option>
                    </select>

                </td>
                <td width="30%"></td>
              </tr>
              <tr></tr>
              <br/><br/>
              <tr>
                <td width="40%"></td>
                <td><input class="submit" type="submit" value="提交"></td>
                <td ><a class="jiao-back" href="index.jsp">返回上级</a></td>
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
     </div>

    <div region="west" class="west" style="width: 300px;" title="学院列单" split="true">

      <div class="discre">
        <MARQUEE class="marquee" onMouseOut = "this.start()"   onMouseOver ="this.stop()" behavior="scroll" style="line-height: 50px;height: 500px;" scrollAmount="1" scrollDelay="1" direction="up">
        <h1>
        <p><a href="http://www.sdut.edu.cn">山东理工大学官网</a></p>
          </h1>
        <p><a href="http://jxxy.sdut.edu.cn/">机械工程学院</a></p>

        <p><a href="http://jtxy.sdut.edu.cn/">交通与车辆工程学院</a></p>

        <p><a href="http://qgxy.sdut.edu.cn/">农业工程与食品科学学院</a></p>

        <p><a href="http://dz.sdut.edu.cn/index.seam">电气与电子工程学院</a></p>

        <p><a href="http://jsjxy.sdut.edu.cn/">计算机科学与技术学院</a></p>

        <p><a href="http://hgxy.sdut.edu.cn/">化学工程学院</a></p>

        <p><a href="http://jgxy.sdut.edu.cn/">建筑工程学院</a></p>

        <%--<p><a href="">资源与环境工程学院</a></p>--%>

        <p><a href="http://xcl.sdut.edu.cn/">材料科学与工程学院</a></p>

        <p><a href="http://smkx.sdut.edu.cn/">生命科学学院</a></p>

        <p><a href="http://lxy.sdut.edu.cn/">理学院</a></p>

        <p><a href="http://bs.sdut.edu.cn/">商学院</a></p>

        <p><a href="http://wxy.sdut.edu.cn/">文学与新闻传播学院</a></p>

        <p><a href="http://wyxy.sdut.edu.cn/">外国语学院</a></p>

        <p><a href="http://law.sdut.edu.cn/uploads/index.html">法学院</a></p>

        <p><a href="http://mksxy.sdut.edu.cn/">马克思主义学院</a></p>

        <p><a href="http://msxy.sdut.edu.cn/">美术学院</a></p>

        <p><a href="http://yyx.sdut.edu.cn/">音乐学院</a></p>

        <p><a href="http://tyx.sdut.edu.cn/">体育学院</a></p>

        <%--<p><a href="">国防教育学院</a></p>--%>

        <p><a href="http://fzfzxy.sdut.edu.cn/index.html">鲁泰纺织服装学院</a></p>
          </MARQUEE>
      </div>
    </div>
   </body>
</html>
