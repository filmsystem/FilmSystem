<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <title>SHU-MOVIE</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet">
        <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css" rel="stylesheet">

        <link href="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js" rel="stylesheet">
        <link href="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js" rel="stylesheet">
        <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
        <link rel="stylesheet" href="/FilmSystem/layui/css/layui.css">
        <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css" >
        <%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

        %>
    </head>
</head>
<body>

<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影院管理      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addCinema.jsp">增加影院</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryCinema.jsp">查询影院</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影片管理      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addFilm.jsp">增加影片</a></li>
                    <!--<li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilm.jsp">查询影片</a></li>-->
                </ul>
            </li>


            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">管理员      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addAdmin.jsp">增加管理员</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryAdmin.jsp">查询管理员</a></li>
                </ul>
            </li>
        </ul>


        <ul class="sui-nav pull-right">
            <li><a href="adminInfo.jsp">个人中心</a></li>
            <li><a href="<%=basePath%>/logout.jsp">退出登录</a></li>
        </ul>



    </div>
</div>

<blockquote class="layui-elem-quote"><h1>添加影片</h1></blockquote>
<%!
    HashMap<String, Integer> map;
%>
<%
    map = (HashMap<String, Integer>) session.getAttribute("NameIdMap");
%>
<% if(map != null){%>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <tr>
        <th width="400px"></th>
        <th width="300px"><h2>影 片</h2></th>
        <th width="300px"><h2>添加</h2></th>
        <th></th>
    </tr>
    </thead>

    <%
        for (String key : map.keySet()) {
    %>

    <%--<%--%>
        <%--for (int i = 0; i < 10; i++){--%>
    <%--%>--%>

    <tbody>

    <tr>
        <%--<td><input type="text" name="username"  value= "<%=list.get(i).getUsername()%>" /></td>--%>
        <%--<td> <p> <%=list.get(i).getId()%> </p> </td>--%>
        <%--<td> <p> <%=list.get(i).getUsername()%> </p> </td>--%>
        <td width="400px"></td>
        <td width="300px"><p class="sui-text-xlarge"><%=key%></p></td>
        <td width="300px"><button class="sui-btn btn-info" onclick="doInsert(<%=map.get(key)%>)"><i class="sui-icon icon-pencil"></i>
        </button></td>
        <td></td>


    </tr>

    <%--<%}--%>
    <%--}--%>
    <%--//  else{%>--%>
    <%--//  <tr align="center">--%>
    <%--//    <th> <p><%="数据库无记录！"%></p></th>--%>
    <%--//  </tr>--%>
    </tbody>
    <%}%>
</table>
<%}%>


<script>
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/doubanSearchNew',
            success: function (res) {
                if (res != "SUCCESS")
                    alert("数据获取出错！")
                if(location.href.indexOf("#reloaded")==-1){
                    location.href=location.href+"#reloaded";
                    location.reload();
                }
            },
            error: function () {
                alert("操作失败！")
            }
        })
    };

    function doInsert(id) {
        $.ajax({
            type: "POST",
            url: '<%=basePath%>/api/film/' + id,
            success: function (res) {
                if (res == "SUCCESS")
                    alert("添加成功！")
                else if (res == "FAIL")
                    alert("添加失败！")
                else if(res="EMPTY")
                    alert("您有必填项未填写！")
                else if (res == "NOT_FOUND")
                    alert("未知用户！")
                else if (res == "DB_ERROR")
                    alert("数据库出错！")
                else if (res == "NETWORK_ERROR")
                    alert("网络出错！")
                location.replace("addFilm.jsp");
            },
            error: function () {
                alert("操作失败！")
            }
        })
    };


</script>
</body>
</html>