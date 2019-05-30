<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>
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
    <%--<link href="../image/favicon.ico" rel="shortcut icon">--%>
    <link href="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js" rel="stylesheet">
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js" rel="stylesheet">
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
    <link rel="stylesheet" href="/FilmSystem/layui/css/layui.css">
    <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

    %>

</head>

<body>


<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影院管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addCinema.jsp">增加影院</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryCinema.jsp">查询影院</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影片管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addFilm.jsp">增加影片</a></li>
                    <!--<li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilm.jsp">查询影片</a></li>-->
                </ul>
            </li>


            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">管理员 <i
                    class="caret"></i></a>
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

<blockquote class="layui-elem-quote"><h1>管理员查询</h1></blockquote>
<%!
    ArrayList<Administrator> list;
    Administrator administrator;
%>
<%
    list = (ArrayList<Administrator>) session.getAttribute("administratorList");
    administrator = (Administrator) session.getAttribute("currentUser");

    if(administrator == null)
        administrator = new Administrator();
%>
<%--<% if(list != null){%>--%>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <tr>
        <th width="300px"></th>
        <th width="200px"><h3>管理员名</h3></th>
        <th width="200px"><h3>删除</h3></th>
        <th width="200px"></th>
    </tr>
    </thead>

    <%--<%--%>
    <%--for(int i = 0; i < list.size(); i++){--%>
    <%--%>--%>

    <%
        for (int i = 0; list != null && i < list.size(); i++) {
            Administrator temp = list.get(i);
    %>

    <tbody>

    <tr>
        <%--<td><input type="text" name="username"  value= "<%=list.get(i).getUsername()%>" /></td>--%>
        <%--<td> <p> <%=list.get(i).getId()%> </p> </td>--%>
        <%--<td> <p> <%=list.get(i).getUsername()%> </p> </td>--%>
        <td width="300px"></td>
        <td width="200px"><p class="sui-text-xlarge"><%=temp.getUsername()%>
        </p></td>
        <form class="deleteForm">
            <td width="100px">
                <button id="deleteBtn<%=i%>" class="sui-btn btn-bordered btn-large btn-danger"
                        onclick="doDelete(<%=list.get(i).getId()%>)" type="button">删除
                </button>
            </td>
        </form>
        <td width="200px"></td>
    </tr>
    </tbody>
    <%}%>
</table>
</body>
</html>
<script>
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/administrator',
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

    function doDelete(id) {
        if('<%=administrator%>' == id){
            alert("自己不能删自己！")
        }
        else{
            $.ajax({
                type: "DELETE",
                url: '<%=basePath%>/api/administrator/' + id,
                success: function (res) {
                    if (res == "SUCCESS")
                        alert("删除成功！")
                    else if (res == "NOT_FOUND")
                        alert("无该用户！")
                    else if (res == "DB_ERROR")
                        alert("数据库出错！")
                    location.replace("queryAdmin.jsp");
                },
                error: function () {
                    alert("操作失败！")
                }
            })
        }
    };
</script>