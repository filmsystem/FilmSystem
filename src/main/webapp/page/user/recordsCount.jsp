<%@ page import="filmsystem.Service.Impi.StatisticsServiceImpl" %>
<%@ page import="filmsystem.DAO.BookingRecordDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="filmsystem.Model.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
        <script src="../../incubator-echarts-4.2.1/dist/echarts.min.js"></script>
    </head>
</head>
<body>

<%--菜单栏--%>
<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="index.jsp" class="sui-brand">SHU-MOVIE</a>
        <%--<ul class="sui-nav">--%>
        <%--<li class="sui-nav"><a href="index.jsp">首页</a></li>--%>
        <%--</ul>--%>
        <form class="sui-form sui-form pull-left" id="searchFilm" action="searchFilm.jsp">
            <div class="layui-input-inline">
                <select name="type">
                    <option value="name">电影</option>
                    <option value="cast">主演</option>
                    <option value="director">导演</option>
                    <option value="year">上映年份</option>
                    <option value="country">国家</option>
                    <option value="type">类型</option>
                </select>
            </div>
            <!--
                       自动补全 -->
            条件
            <input type="text" name="info" id="auto-init-1" value="" data-toggle="autocomplete"
                   data-lookup="[&quot;复仇者联盟4&quot;, &quot;复仇者联盟3&quot;, &quot;复仇者联盟2&quot;, &quot;复仇者联盟1&quot;, &quot;edfa&quot;, &quot;wdasda&quot;, &quot;tueiyhgk&quot;, &quot;vjflcjx&quot;]"
                   class="input-large" placeholder="找电影">

            <input type="image" src="/FilmSystem/img/search.png" width=22px height=22px class="btn"/>
        </form>
        <ul class="sui-nav pull-right">
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心
                <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="userInfo.jsp">我的</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="recordsCount.jsp">我的数据</a></li>
                </ul>
            </li>
            <li><a href="<%=basePath%>/api/logout">退出登录</a></li>
        </ul>
    </div>
</div>
<br><br>
<%--</div>--%>

<%--页面--%>

<blockquote class="layui-elem-quote"><h1>我的数据</h1></blockquote>
<br>
<div class="layui-row">
    <div class="layui-col-md2 layui-col-md-offset2">
        <div class="grid-demo grid-demo-bg1"><h1><span class="sui-text-danger">每月购票统计</span></h1></div>
    </div>
    <div class="layui-col-md2 layui-col-md-offset4">
        <div class="grid-demo grid-demo-bg1"><h1><span class="sui-text-danger">爱看电影类型统计</span></h1></div>
    </div>
</div>
<br><br>
<div class="layui-row">
    <div class="layui-col-md4">
        <div id="chart" style="width:650px;height:400px;"></div>
    </div>
    <div class="layui-col-md4 layui-col-md-offset2">
        <div id="chart2" style="width:650px;height:400px;"></div>
    </div>
</div>
</body>
<%
    Customer customer = (Customer) session.getAttribute("currentUser");
    BookingRecordDAO brd = new BookingRecordDAO();
    Map<String, Integer> resultMap1 = brd.countTimesByMonth(customer.getId());
    //Map<String, Integer> resultMap2 = brd.countTypeByUserId(customer.getId());
    int size = resultMap1.size();
    String[] month1 = new String[size];
    Integer[] count1 = new Integer[size];
    int t = 0;
    for (Map.Entry<String, Integer> entry : resultMap1.entrySet()) {
        month1[t] = entry.getKey();
        count1[t] = entry.getValue();
        t++;
    }
%>
<script type="text/javascript">
    // 初始化图表标签
    var month1=new Array();
    <%   for(int i=0;i <month1.length;i++){   %>
    month1[ <%=i%> ]= " <%=month1[i]%> ";
    <%   }   %>

    var count1=new Array();
    <%   for(int i=0;i <count1.length;i++){   %>
    count1[ <%=i%> ]= " <%=count1[i]%> ";
    <%   }   %>

    var myChart = echarts.init(document.getElementById('chart'));
    var option = {
        xAxis: {
            type: 'category',
            data: month1//['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: count1,//[4, 6, 7, 3, 5, 6, 7],
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
            data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',
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
                data: [
                    {value: 335, name: '直接访问'},
                    {value: 310, name: '邮件营销'},
                    {value: 234, name: '联盟广告'},
                    {value: 135, name: '视频广告'},
                    {value: 1548, name: '搜索引擎'}
                ]
            }
        ]
    };
    myChart2.setOption(option2);
</script>
</html>