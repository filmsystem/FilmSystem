<%@ page import="filmsystem.Model.Cinema" %>
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

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">订单管理
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="bookingCount.jsp">查询订单</a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="sui-nav pull-right">
            <li><a href="cinemaInfo.jsp">个人中心</a></li>
            <li><a href="<%=basePath%>/logout.jsp">退出登录</a></li>
        </ul>
    </div>
</div>

<blockquote class="layui-elem-quote"><h1>添加放映厅</h1></blockquote>
<br><br>
<div align="center">
    <form id="registerForm" class="layui-form">
        <input type="hidden" name="cinemaId" value="<%=((Cinema)session.getAttribute("currentUser")).getId()%>"/>
        <div style="width:30%" align="center">
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">影厅编号</label>
                <div class="layui-input-block">
                    <input type="text" name="officeId" id="officeId" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">排数</label>
                <div class="layui-input-block">
                    <input type="text" name="row" id="row" required lay-verify="required" autocomplete="off"
                           class="layui-input" required="required">
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">列数</label>
                <div class="layui-input-block">
                    <input type="text" name="col" id="col" required lay-verify="required" autocomplete="off"
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
<br><br>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#submitBtn").on('click', function () {
            var params = $("#registerForm").serialize();
            //params.add("cinemaId",<%=((Cinema)session.getAttribute("currentUser")).getId()%>);

            $.ajax({
                type: "POST",
                url: '<%=basePath%>/api/filmoffice',
                // dataType: "json",
                data: params,
                success: function (res) {
                    if (res == "SUCCESS")
                        alert("插入成功！")
                    else if (res == "FAIL")
                        alert("插入失败！")
                    else if(res="EMPTY")
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