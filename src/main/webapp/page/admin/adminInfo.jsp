<%@ page import="java.util.Random" %>
<%@ page import="filmsystem.Model.Administrator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

%>
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
        <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css">
    </head>
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
            <li><a href="<%=basePath%>/api/logout">退出登录</a></li>
        </ul>


    </div>
</div>
<%
    Random a = new Random();
    int n = a.nextInt(15) + 10;
%>
<%
    Administrator admin = (Administrator) session.getAttribute("currentUser");
%>
<blockquote class="layui-elem-quote"><h1>我的信息</h1></blockquote>
    <img src="/FilmSystem/img/<%=n%>.png" width=100px height=100px style="margin-left:630px;border-radius:50%">
    <br><br>
    <table class="layui-table" lay-even="" lay-skin="nob">
        <tbody>
        <tr>
            <td width="300px" align="right"></td>
            <td width="100px" align="right">
                <h4><strong>管理员</strong></h4>
            </td>
            <td width="300px" align="left">
                <h4><%=admin.getUsername()%>
                </h4>
            </td>
            <td width="400px"></td>
        </tr>
        </tbody>
    </table>
    <br><br>
    <button id="J_addsuppliers" data-toggle="modal" data-target="#J_addsuppliersDialog" data-width="large"
            data-backdrop="static" class="sui-btn btn-bordered btn-large btn-info" style="margin-left:650px">修改
    </button>
    <div id="J_addsuppliersDialog" tabindex="-1" role="dialog" class="sui-modal hide fade"
         data-addsupplierurl="http://" data-getsuppliersurl="http://xxx">
        <form class="updateForm" id="updateForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×
                        </button>
                        <h4 id="myModalLabel" class="modal-title">修改个人信息</h4>
                    </div>
                    <div class="modal-body sui-form form-horizontal">
                        <div class="sui-msg msg-block msg-default msg-tips">
                            <div class="msg-con">以下为需要修改的个人信息</div>
                            <s class="msg-icon"></s>
                        </div>
                        <table class="sui-table table-bordered-simple">
                            <thead>
                            <tr>
                                <th><h4>密码</h4></th>
                                <th><h4>操作</h4></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <input type="hidden" name="id" value="<%=admin.getId()%>"/>
                                <td><input type="text" name="password" id="password_qc"
                                           value="<%=admin.getPassword()%>" class="input-medium"/></td>
                                <td data-supplierid="111">
                                    <button id="updateBtn" class="sui-btn btn-bordered" type="button">修改
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
</body>
</html>
<script>
    $(function () {
        $("#updateBtn").on('click', function () {
            var params = $("#updateForm").serialize();
            $.ajax({
                type: "PUT",
                url: '<%=basePath%>/api/administrator?'+params,
                success: function (res) {
                    console.log("trying……")
                    if (res == "SUCCESS")
                        alert("更新成功！")
                    else if(res="EMPTY")
                        alert("您有必填项未填写！")
                    else if (res == "FAIL")
                        alert("更新失败！")
                    else if (res == "DB_ERROR")
                        alert("数据库出错！")
                },
                error: function () {
                    alert("操作失败！")
                }
            })
        });
    });
</script>