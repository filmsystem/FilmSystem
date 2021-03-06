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

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影院管理<i
                    class="caret"></i></a>
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

<blockquote class="layui-elem-quote"><h1>添加影院</h1></blockquote>
<br><br>
<div align="center">
    <form id="registerForm" class="layui-form">
        <div style="width:30%" align="center">
            <div class="layui-form-item">
                <label class="layui-form-label">影院名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required id="uname" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" name="password" id="pwd" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">城市</label>
                <div class="layui-input-block">
                    <input type="text" name="city" id="city" required lay-verify="required" autocomplete="off"
                           class="layui-input" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="cityid" mod_notice_tip="" >
                    <input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
                    <div id="jsContainer" class="jsContainer" style="height:0">
                        <div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
                        <div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="address" id="addr" required lay-verify="required" autocomplete="off"
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
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#submitBtn").on('click', function () {
            var params = $("#registerForm").serialize();
            $.ajax({
                type: "POST",
                url: '<%=basePath%>/api/registerCinema',
                // dataType: "json",
                data: params,
                success: function (res) {
                    if (res == "SUCCESS"){
                        alert("插入成功！")
                        //location.replace("queryCinema.jsp");
                    }else if(res="EMPTY")
                        alert("您有必填项未填写！")
                    else if (res == "FAIL")
                        alert("插入失败！")
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
<script src="../../cityJs/fixdiv.js"></script>
<script src="../../cityJs/address.js"></script>