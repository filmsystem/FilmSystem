<%@ page import="java.util.HashMap" %>
<%@ page import="filmsystem.Model.*" %>
<%@ page import="filmsystem.Tools.PrintTimestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>SHU-MOVIE</title>
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet">
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css" rel="stylesheet">
    <link href="../image/favicon.ico" rel="shortcut icon">
    <link href="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js" rel="stylesheet">
    <link href="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js" rel="stylesheet">
    <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
    <link rel="stylesheet" href="/FilmSystem/layui/css/layui.css">
    <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css" >
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

    %>
</head>
<body>
<%!
    long currentOrderId;
    HashMap<String, Object> bookingRecordMap = new HashMap<>();
%>
<%
    currentOrderId = (long)session.getAttribute("currentOrderId");
    bookingRecordMap = (HashMap<String, Object>) session.getAttribute("bookingRecordMap");

    if(bookingRecordMap == null)
        bookingRecordMap = new HashMap<>();

    Film film = (Film) bookingRecordMap.get("film");
    FilmShow filmShow = (FilmShow) bookingRecordMap.get("filmShow");
    Cinema cinema = (Cinema) bookingRecordMap.get("cinema");
    BookingRecord record = (BookingRecord) bookingRecordMap.get("bookingRecord");

    if(film == null)
        film = new Film();

    if(filmShow == null)
        filmShow = new FilmShow();

    if(cinema == null)
        cinema = new Cinema();

    if(record == null)
        record = new BookingRecord();
%>
<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="javascript:void(0);" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav pull-right">
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">我的</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">我的数据</a></li>
                </ul>
            </li>
            <li><a href="../../firstPage.jsp">退出登录</a></li>
        </ul>
    </div></div>
<br><br>

<br><br>
<div class="sui-steps-round">
    <div class="finished">
        <div class="wrap" >
            <div class="round" style="margin-left:250px">1</div>
            <div class="bar" style="margin-left:250px"></div>
        </div>
        <label style="margin-left:250px">选择影片场次</label>
    </div>
    <div class="finished">
        <div class="wrap">
            <div class="round" >2</div>
            <div class="bar"></div>
        </div>
        <label>选择座位</label>
    </div>
    <div class="current">
        <div class="wrap">
            <div class="round">3</div>
            <div class="bar"></div>
        </div>
        <label>15分钟内付款</label>
    </div>
    <div class="todo last">
        <div class="wrap">
            <div class="round">4</div>
        </div>
        <label>影院取票观影</label>
    </div>
</div>
<%--<% if(list != null){%>--%>

<div align="center" >
    <div style="background-color: #FFCCFF;width:1150px" align="center" >
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend style="color:#ffffff" style="margin-left: 250px;"><h1>倒计时</h1></legend>
        </fieldset>
        <h2 class="sui-text-danger" style="margin-left:20px"><div id="test2"></div></h2>
        <br>
            <div><h4 style="margin-left:20px">超时订单会自动取消</h4></div>
        <br>
    </div>
</div>
<br><br>
<div class="sui-msg msg-tips">
    <div class="msg-con" style="margin-left:220px">请仔细核对场次信息，出票后将无法退票和改签</div>
    <s class="msg-icon"style="margin-left:219px"></s>
</div>
<br><br>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <th width="200px"></th>
    <th><h3>影片</h3></th>
    <th><h3>时间</h3></th>
    <th><h3>影院</h3></th>
    <th><h3>座位</h3></th>
    </thead>
    <tbody>
    <tr>
        <td ></td>
        <td ><span class="sui-text-xlarge"><%=film.getName()%></span></td>
        <td ><span class="sui-text-xlarge"><%=PrintTimestamp.printToSecond(filmShow.getBeginTime())%></span></td>
        <td ><span class="sui-text-xlarge"><%=cinema.getUsername()%></span></td>
        <td ><span class="sui-text-xlarge"><%=record.getRowNum()%> 排 <%=record.getCol()%> 座</span></td>

    </tr>
    </tbody>
</table>
<br>
<span class="sui-text-xlarge" style="margin-left:1050px">实际支付：<%=filmShow.getPrice()%>元</span>
<br>
<br>
<button id="payBtn" class="layui-btn layui-btn-danger layui-btn-radius" style="margin-left:1060px;text-align:center" width="260px"><h3>确 认 支 付</h3></button>
<br><br><br><br>

<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/bookingrecord/' + <%=currentOrderId%>,
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

    $(function () {
        $("#payBtn").on('click', function () {
            $.ajax({
                type: "PUT",
                url: '<%=basePath%>/api/ticket/payOrder/' + <%=currentOrderId%>,
                success: function (res) {
                    console.log("trying……")
                    if (res == "SUCCESS")
                        location.replace("buySuccess.jsp")
                    else if (res == "FAIL")
                        alert("支付失败！")
                    else if (res == "NOT_FOUND")
                        alert("未找到该订单！")
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




<script src="/FilmSystem/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['util', 'laydate', 'layer'], function(){
        var util = layui.util
            ,laydate = layui.laydate
            ,layer = layui.layer;
        //固定块

        //倒计时
        var thisTimer, setCountdown = function(y, M, d, H, m, s){
            var endTime = new Date(0, 0, 0, 0, 14, 59) //结束日期
                ,serverTime = new Date(0, 0, 0, 0, 0, 0); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

            clearTimeout(thisTimer);
            util.countdown(endTime, serverTime, function(date, serverTime, timer){
                var str = '请在' + date[2] + '分钟' + date[3] + '秒内完成支付';
                lay('#test2').html(str);
                thisTimer = timer;
            });
        };
        setCountdown(2099,1,1);

        laydate.render({
            elem: '#test1'
            ,type: 'datetime'
            ,done: function(value, date){
                setCountdown(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });


        //某个时间在当前时间的多久前
        var setTimeAgo = function(y, M, d, H, m, s){
            var str = util.timeAgo(new Date(y, M||0, d||1, H||0, m||0, s||0));
            lay('#test4').html(str);
        };

        laydate.render({
            elem: '#test3'
            ,type: 'datetime'
            ,done: function(value, date){
                setTimeAgo(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });

    });
</script>

</body>
</html>