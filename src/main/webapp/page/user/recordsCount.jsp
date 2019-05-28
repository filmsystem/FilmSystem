<%@ page import="filmsystem.Model.Film" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <script src="/FilmSystem/incubator-echarts-4.2.1/dist/echarts.min.js"></script>

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
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilm.jsp">查询影片</a></li>
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
            <li><a href="/FilmSystem/firstPage.jsp">退出登录</a></li>
        </ul>
    </div>
</div>

<blockquote class="layui-elem-quote"><h1>我的数据</h1></blockquote>
<br>
<div class="layui-row">
    <div class="layui-col-md2 layui-col-md-offset2" >
        <div class="grid-demo grid-demo-bg1"><h1><span class="sui-text-danger">每月购票统计</span></h1></div>
    </div>
    <div class="layui-col-md2 layui-col-md-offset4" >
        <div class="grid-demo grid-demo-bg1"><h1><span class="sui-text-danger">爱看电影类型统计</span></h1></div>
    </div>
</div>
<br><br>
<div class="layui-row">
    <div class="layui-col-md4" >
        <div id="chart" style="width:650px;height:400px;"></div>
    </div>
    <div class="layui-col-md4 layui-col-md-offset2" >
        <div id="chart2" style="width:650px;height:400px;"></div>
    </div>
</div>
</body>

<script type="text/javascript">
    // 初始化图表标签
    var myChart = echarts.init(document.getElementById('chart'));
    var option = {
        xAxis: {
            type: 'category',
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [4, 6, 7, 3, 5, 6, 7],
            type: 'line'
        }]
    };
    myChart.setOption(option);
</script>
<script type="text/javascript">
    var myChart2 = echarts.init(document.getElementById('chart2'));

    option2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        },
        series: [
            {
                name:'访问来源',
                type:'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:234, name:'联盟广告'},
                    {value:135, name:'视频广告'},
                    {value:1548, name:'搜索引擎'}
                ]
            }
        ]
    };
    myChart2.setOption(option2);
</script>
</html>