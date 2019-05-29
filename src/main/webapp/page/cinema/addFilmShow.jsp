<%@ page import="filmsystem.Model.Cinema" %>
<%@ page import="filmsystem.Model.FilmShow" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="filmsystem.Model.FilmOffice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%!
    ArrayList<FilmOffice> list;
%>
<%
    list = (ArrayList<FilmOffice>) session.getAttribute("filmOfficeList");

    if (list != null) {
%>
<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影厅管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addFilmOffice.jsp">增加影厅</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilmOffice.jsp">查询影厅</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">场次管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addFilmShow.jsp">增加场次</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilmShow.jsp">查询场次</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">电影管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="/FilmSystem/page/admin/addFilm.jsp">增加电影</a>
                    </li>
                    <li role="presentation"><a role="menuitem" tabindex="-1"
                                               href="/FilmSystem/page/admin/queryFilm.jsp">查询电影</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">订单管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">查询订单</a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="sui-nav pull-right">
            <li><a href="cinemaInfo.jsp">个人中心</a></li>
            <li><a href="/FilmSystem/firstPage.jsp">退出登录</a></li>
        </ul>
    </div>
</div>

<blockquote class="layui-elem-quote"><h1>添加放映场次</h1></blockquote>
<br><br>
<div align="center">
    <form id="registerForm" class="layui-form">
        <div style="width:30%" align="center">
            <div class="layui-form-item">
                <label class="layui-form-label">电影编号</label>
                <div class="layui-input-block">
                    <input type="text" name="filmId" required id="filmId" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <br><br>
            <input type="hidden" name="cinemaId" value="<%=((Cinema)session.getAttribute("currentUser")).getId()%>"/>
            <div class="layui-form-item">
               <label class="layui-form-label">影厅编号</label>
                        <!--<input type="text" name="officeId" id="officeId" required lay-verify="required" autocomplete="off"
                           class="layui-input" required="required" value="<%=(list.get(0)).getId()%>">-->
                <div class="layui-input-block">
                    <select name="officeId" id="officeId" class="layui-select">
                        <%
                            for (int i = 0; list != null && i < list.size(); i++) {
                                FilmOffice temp = list.get(i);
                        %>
                        <option value="<%=temp.getId()%>">第<%=temp.getOfficeId()%>号影厅</option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-block">
                    <input type="text" name="beginTime" id="beginTime" required lay-verify="required" autocomplete="off"
                           class="layui-input" required="required">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">放映时长</label>
                <div class="layui-input-block">
                    <input type="text" name="duration" id="duration" required lay-verify="required" autocomplete="off"
                           class="layui-input" required="required">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">票价</label>
                <div class="layui-input-block">
                    <input type="text" name="price" id="price" required lay-verify="required" autocomplete="off"
                           class="layui-input" required="required">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1" id="submitBtn" type="button">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%
    }
%>
</body>
</html>
<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/filmoffice?cinemaId=' + '<%=((Cinema)session.getAttribute("currentUser")).getId()%>',
            success: function (res) {
                if (res != "SUCCESS")
                    alert("数据获取出错！")
                if (location.href.indexOf("#reloaded") == -1) {
                    location.href = location.href + "#reloaded";
                    location.reload();
                }
            },
            error: function () {
                alert("操作失败！")
            }
        })
    };

    $(function () {
        $("#submitBtn").on('click', function () {
            var params = $("#registerForm").serialize();
            $.ajax({
                type: "POST",
                url: '<%=basePath%>/api/filmshow',
                // dataType: "json",
                data: params,
                success: function (res) {
                    if (res == "SUCCESS")
                        alert("插入成功！")
                    else if (res == "FAIL")
                        alert("插入失败！")
                    else if (res = "EMPTY")
                        alert("您有必填项未填写！")
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