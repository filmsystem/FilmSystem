<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>SHU-MOVIE</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet">
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css" rel="stylesheet">
    <link href="../image/favicon.ico" rel="shortcut icon">
    <link href="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js" rel="stylesheet">
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js" rel="stylesheet">
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
    <link rel="stylesheet" href="/FilmSystem/layui/css/layui.css">
    <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css" >
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

    %>
</head>
<body>

<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">
            <li class="sui-nav"><a href="#">首页</a></li>
            <li><a href="#">电影</a></li>
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">其他      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">关于</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">项目组成员</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">版权</a></li>
                </ul>
            </li>
            <li></li>
        </ul>
        <ul class="sui-nav pull-right">
            <li><a href="#">个人中心</a></li>
            <li><a href="#">退出登录</a></li>
        </ul>
    </div></div>




<br><br>
<div class="sui-steps-round">
    <div class="finished">
        <div class="wrap" >
            <div class="round" style="margin-left:250px">1</div>
            <div class="bar" style="margin-left:250px"></div>
        </div>
        <label style="margin-left:250px">选择影片场次</label>
    </div>
    <div class="finished">
        <div class="wrap">
            <div class="round" >2</div>
            <div class="bar"></div>
        </div>
        <label>选择座位</label>
    </div>
    <div class="finished">
        <div class="wrap">
            <div class="round">3</div>
            <div class="bar"></div>
        </div>
        <label>15分钟内付款</label>
    </div>
    <div class="current">
        <div class="wrap">
            <div class="round">4</div>
        </div>
        <label>影院取票观影</label>
    </div>
</div>

<%!
    ArrayList<Administrator> list;
%>
<%
    list = (ArrayList<Administrator>) session.getAttribute("administratorList");
%>
<%--<% if(list != null){%>--%>
<br><br>
<h1 class="sui-text-danger" align="center" >您已购买成功！</h1>
<br>
<h1 class="sui-text-xlarge" align="center" >取票号</h1>
<br>
<h1 class="sui-text-xxlarge" align="center" >53554333222222</h1>
<br>
<h1 class="sui-text-xlarge" align="center" >二维码</h1>
<br>
<img src="/FilmSystem/img/2.png"width=220px height=600px style="margin-left:580px"/>


        <%--<%}--%>
        <%--}--%>
        <%--//  else{%>--%>
        <%--//  <tr align="center">--%>
        <%--//    <th> <p><%="数据库无记录！"%></p></th>--%>
        <%--//  </tr>--%>

        <%--<%}%>--%>




<script src="/FilmSystem/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['util', 'laydate', 'layer'], function(){
        var util = layui.util
            ,laydate = layui.laydate
            ,layer = layui.layer;
        //固定块

        //倒计时
        var thisTimer, setCountdown = function(y, M, d, H, m, s){
            var endTime = new Date(0, 0, 0, 0, 14, 59) //结束日期
                ,serverTime = new Date(0, 0, 0, 0, 0, 0); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

            clearTimeout(thisTimer);
            util.countdown(endTime, serverTime, function(date, serverTime, timer){
                var str = '请在' + date[2] + '分钟' + date[3] + '秒内完成支付';
                lay('#test2').html(str);
                thisTimer = timer;
            });
        };
        setCountdown(2099,1,1);

        laydate.render({
            elem: '#test1'
            ,type: 'datetime'
            ,done: function(value, date){
                setCountdown(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });


        //某个时间在当前时间的多久前
        var setTimeAgo = function(y, M, d, H, m, s){
            var str = util.timeAgo(new Date(y, M||0, d||1, H||0, m||0, s||0));
            lay('#test4').html(str);
        };

        laydate.render({
            elem: '#test3'
            ,type: 'datetime'
            ,done: function(value, date){
                setTimeAgo(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });

    });
</script>

</body>
</html>