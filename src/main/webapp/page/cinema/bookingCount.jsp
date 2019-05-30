<%@ page import="filmsystem.Model.Cinema" %>
<%@ page import="filmsystem.Model.BookingRecord" %>
<%@ page import="java.util.Map" %>
<%@ page import="filmsystem.DAO.BookingRecordDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.TreeMap" %>
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
        <script src="/FilmSystem/incubator-echarts-4.2.1/dist/echarts.min.js"></script>
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

<blockquote class="layui-elem-quote"><h1>报表</h1></blockquote>
<br><br>
<div class="layui-row">
    <div class="layui-col-md2 layui-col-md-offset2">
        <div class="grid-demo grid-demo-bg1"><h1><span class="sui-text-danger">近七天营业额</span></h1></div>
    </div>
    <div class="layui-col-md2 layui-col-md-offset4">
    <div class="grid-demo grid-demo-bg"><h1><span class="sui-text-danger">历史销售Top5</span></h1></div>
    </div>
</div>
<br><br>
<%--<div id="chart" style="width:800px;height:400px;margin-left:23%"></div>--%>
<div class="layui-row">
    <div class="layui-col-md4 ">
        <div id="chart" style="width:600px;height:400px;"></div>
    </div>
    <div class="layui-col-md4 layui-col-md-offset1">
    <div id="chart2" style="width:750px;height:400px;"></div>
    </div>
</div>
</body>
<%
    Cinema cinema=(Cinema)session.getAttribute("currentUser");
    BookingRecordDAO brd=new BookingRecordDAO();
    Map<String,Float> tMap=brd.countTurnoverByDayInAWeek(cinema.getId());
    Map<String, Float> resultMap = new TreeMap<String, Float>(tMap);
    int size = resultMap.size();
    String[] day1 = new String[size];
    Float[] turnover = new Float[size];
    int t = 0;
    for (Map.Entry<String, Float> entry : resultMap.entrySet()) {
        day1[t] = entry.getKey();
        turnover[t] = entry.getValue();
        t++;
    }
%>
<script type="text/javascript">
    // 初始化图表标签
    var day1=new Array();
    <%   for(int i=0;i <day1.length;i++){   %>
    day1[ <%=i%> ]= " <%=day1[i]%> ";
    <%   }   %>

    var turnover=new Array();
    <%   for(int i=0;i <turnover.length;i++){   %>
    turnover[ <%=i%> ]= " <%=turnover[i]%> ";
    <%   }   %>


    var myChart = echarts.init(document.getElementById('chart'));
    var dataAxis = day1//['点', '击', '柱', '子', '或', '者', '两', '指', '在', '触', '屏', '上', '滑', '动', '能', '够', '自', '动', '缩', '放'];
    var data = turnover//[220, 182, 191, 234, 290, 330, 310, 123, 442, 321, 90, 149, 210, 122, 133, 334, 198, 123, 125, 220];
    var yMax = 300;
    var dataShadow = [];

    for (var i = 0; i < data.length; i++) {
        dataShadow.push(yMax);
    }

    var option = {
        title: {
            text: '',
            subtext: ''
        },
        xAxis: {
            data: dataAxis,
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#fff'
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 10
        },
        yAxis: {
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#999'
                }
            }
        },
        dataZoom: [
            {
                type: 'inside'
            }
        ],
        series: [
            { // For shadow
                type: 'bar',
                itemStyle: {
                    normal: {color: 'rgba(0,0,0,0.05)'}
                },
                barGap:'-100%',
                barCategoryGap:'40%',
                data: dataShadow,
                animation: false
            },
            {
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: data
            }
        ]
    };

    // Enable data zoom when user click bar.
    var zoomSize = 6;
    myChart.on('click', function (params) {
        console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
        myChart.dispatchAction({
            type: 'dataZoom',
            startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
            endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
        });
    });

    myChart.setOption(option);
</script>
<%
    Map<String, ArrayList<Float>> resultMap2 = brd.countTimesByFilm2(cinema.getId());
    size = Math.min(resultMap2.size(), 10);
    ArrayList<String> filmArray = new ArrayList<>();
    ArrayList<Integer> timeArray = new ArrayList<>();
    ArrayList<Double> statArray = new ArrayList<>();
    for (Map.Entry<String, ArrayList<Float>> entry : resultMap2.entrySet()) {
        filmArray.add(entry.getKey());
        timeArray.add(Math.round(entry.getValue().get(0)));
        statArray.add(Double.parseDouble(entry.getValue().get(1).toString()));
    }
%>
<script type="text/javascript">
    var myChart2 = echarts.init(document.getElementById('chart2'));
    var chart2Data = [['score', 'amount','name']];
    <%for(int i = 0; i < size; i++){%>
        var temp = new Array()
        temp.push(<%=statArray.get(i)%>)  //star
        temp.push(<%=timeArray.get(i)%>)
        temp.push('<%=filmArray.get(i)%>')

        chart2Data.push(temp)
    <%}%>
    var option2 = {
        dataset: {
            // source: [
            //     ,
            //     [89.3, 58212, 'Matcha Latte'],
            //     [57.1, 78254, 'Milk Tea'],
            //     [74.4, 41032, 'Cheese Cocoa'],
            //     [50.1, 12755, 'Cheese Brownie'],
            //     [89.7, 20145, 'Matcha Cocoa'],
            //     [68.1, 79146, 'Tea'],
            //     [19.6, 91852, 'Orange Juice'],
            //     [10.6, 101852, 'Lemon Juice'],
            //     [32.7, 20112, 'Walnut Brownie']
            // ]
            source: chart2Data
        },
        grid: {containLabel: true},
        xAxis: {name: 'amount'},
        yAxis: {type: 'category'},
        visualMap: {
            orient: 'horizontal',
            left: 'center',
            min: 0,
            max: 5,
            text: ['5.0', '0.0'],
            // Map the score column to color
            dimension: 0,
            inRange: {
                color: ['#D7DA8B', '#E15457']
            }
        },
        series: [
            {
                type: 'bar',
                encode: {
                    // Map the "amount" column to X axis.
                    x: 'amount',
                    // Map the "film" column to Y axis
                    y: 'name'
                }
            }
        ]
    };
    myChart2.setOption(option2);
</script>
</html>