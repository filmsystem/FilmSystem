<%@ page import="java.util.ArrayList" %>
<%@ page import="filmsystem.Model.Cinema" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

%>
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

<blockquote class="layui-elem-quote"><h1>影院查询</h1></blockquote>
    <%!
  ArrayList<Cinema> list;
%>
    <%
  list = (ArrayList<Cinema>) session.getAttribute("cinemaList");
%>
<%--<% if(list != null){%>--%>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <tr>
        <th width="300px"></th>
        <th width="200px"><h3>影院名</h3></th>
        <th width="200px"><h3>城市</h3></th>
        <th width="300px"><h3>地址</h3></th>
        <th width="100px"><h3>修改</h3></th>
        <th width="100px"><h3>删除</h3></th>
        <th width="200px"></th>
    </tr>
    </thead>
    <%
        for (int i = 0; list != null && i < list.size(); i++) {
            Cinema temp = list.get(i);
    %>

    <tbody>

    <tr>
        <td width="300px"></td>
        <td width="100px"><p class="sui-text-large"><%=temp.getUsername()%>
        </p></td>
        <td width="200px"><p class="sui-text-large"><%=temp.getCity()%>
        </p></td>
        <td width="300px"><p class="sui-text-large"><%=temp.getAddress()%>
        </p></td>
        <td width="100px">
            <button id="J_addsuppliers" data-toggle="modal" data-target="#J_addsuppliersDialog<%=i%>" data-width="large"
                    data-backdrop="static" class="sui-btn btn-bordered btn-large btn-success"><i
                    class="sui-icon icon-pencil"></i>修改
            </button>
            <div id="J_addsuppliersDialog<%=i%>" tabindex="-1" role="dialog" class="sui-modal hide fade"
                 data-addsupplierurl="http://" data-getsuppliersurl="http://xxx">
                <form name="updateForm<%=i%>" id="updateForm<%=i%>">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×
                                </button>
                                <h4 id="myModalLabel<%=i%>" class="modal-title">修改影院</h4>
                            </div>
                            <div class="modal-body sui-form form-horizontal">
                                <div class="sui-msg msg-block msg-default msg-tips">
                                    <div class="msg-con">以下为需要修改的影院信息</div>
                                    <s class="msg-icon"></s>
                                </div>
                                <table class="sui-table table-bordered-simple">
                                    <thead>
                                    <tr>
                                        <th>影院名</th>
                                        <th>城市</th>
                                        <th>地址</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <input type="hidden" name="id" value="<%=temp.getId()%>"/>
                                        <td align="left"><p align="left"><%=temp.getUsername()%>
                                        </p></td>
                                        <td><input type="text" name="city" id="city_qc"
                                                   value=<%=temp.getCity()%> class="input-medium"></td>
                                        <td><input type="text" name="address" id="address_qc"
                                                   value=<%=temp.getAddress()%> class="input-large"></td>
                                        <td data-supplierid="111">
                                            <button id="updateBtn<%=i%>" class="sui-btn btn-bordered" type="button"
                                                    onclick="doUpdate(<%=i%>)">修改
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </td>
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


<script>
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/cinema',
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
        $.ajax({
            type: "DELETE",
            url: '<%=basePath%>/api/cinema/' + id,
            success: function (res) {
                if (res == "SUCCESS")
                    alert("删除成功！")
                else if (res == "NOT_FOUND")
                    alert("无该用户！")
                else if (res == "DB_ERROR")
                    alert("数据库出错！")
                location.replace("queryCinema.jsp");
            },
            error: function () {
                alert("操作失败！")

            }
        })
    };

    function doUpdate(i) {
        var formString="#updateForm"+i.toString()
        var params = $(formString).serialize();
        console.log("form:"+formString);
        console.log("test:"+params.toString());
        $.ajax({
            type: "PUT",
            url: '<%=basePath%>/api/cinema?'+params,
            success: function (res) {
                if (res == "SUCCESS")
                    alert("修改成功！")
                else if(res="EMPTY")
                    alert("您有必填项未填写！")
                else if (res == "FAIL")
                    alert("修改失败！")
                else if (res == "NOT_FOUND")
                    alert("未知用户！")
                else if (res == "DB_ERROR")
                    alert("数据库出错！")
                location.replace("queryCinema.jsp");
            },
            error: function () {
                alert("操作失败！")
            }
        })
    };


</script>

</html>