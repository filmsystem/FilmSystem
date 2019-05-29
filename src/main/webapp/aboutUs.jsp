<%@ page import="filmsystem.Model.Film" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

    <div class="sui-navbar navbar-inverse">
      <div class="navbar-inner"><a href="index.jsp" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">
          <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">其他      <i class="caret"></i></a>
            <ul role="menu" class="sui-dropdown-menu">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="aboutUs.jsp">关于我们</a></li>
            </ul>
          </li>
          <li></li>
        </ul>
        <ul class="sui-nav pull-right">
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="userInfo.jsp">我的</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="recordsCount.jsp">我的数据</a></li>
                </ul>
            </li>
          <li><a href="../../firstPage.jsp">退出登录</a></li>
        </ul>
      </div></div>
        <br><br>
    <div style="background-color: #c9302c;width:1150px;margin-left:10%" >
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend style="color:#ffffff" style="margin-left: 250px;"><h1>SHU-MOVIE介绍</h1></legend>
        </fieldset>
    </div>
    <p style="margin-left:10%;width:1100px;"  class="sui-text-xlarge"><a class="sui-text-disabled">此电影线上售票系统主要为用户提供丰富的正在热映和即将上映的电影资讯信息，用户可通过此系统选择影院、观影时间、座位，并进行在线支付，通过获得的电子兑换码到线下影院换取电影票进行观影体验。此外，用户还可以在平台中自由发表有关电影的评论，电影的评分及推荐都由用户产生和决定。
    </a></p>
    <br>
    <div style="background-color: #c9302c;width:1150px;margin-left:10%" >
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend style="color:#ffffff" style="margin-left: 250px;"><h1>管理团队</h1></legend>
        </fieldset>
    </div>
    <ul>
        <li><p style="margin-left:10%;width:1100px;"  class="sui-text-xlarge"><a class="sui-text-disabled">·16122497 徐晓敏</a></p></li>
        <li><p style="margin-left:10%;width:1100px;"  class="sui-text-xlarge"><a class="sui-text-disabled">·16122460 彭凯龙</a></p></li>
        <li><p style="margin-left:10%;width:1100px;"  class="sui-text-xlarge"><a class="sui-text-disabled">·16122224 沈宇琪</a></p></li>
    </ul>

    <input type="text" class="layui-input" id="test1" value="2099-01-01 00:00:00">
    <div><input type="text" value="" size="15" id="homecity_name" name="homecity_name" mod="address|notice" mod_address_source="hotel" mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@" mod_address_reference="cityid" mod_notice_tip="中文/拼音" />
        <input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
    </div>
    <div id="jsContainer" class="jsContainer" style="height:0">
        <div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
        <div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
    </div>
	</body>
    <script type="text/javascript">
        $(function () {
            $("#submitBtn").on('click', function () {
                var params = $("#searchFilm").serialize();
                $.ajax({
                    type: "GET",
                    url: '<%=basePath%>/api/film',
                    // dataType: "json",
                    data: params,
                    success: function (res) {
                        if (res == "SUCCESS")
                            alert("插入成功！")
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

    <script src="/FilmSystem/layui/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        layui.use(['util', 'laydate', 'layer'], function(){
            var util = layui.util2·
                ,laydate = layui.laydate
                ,layer = layui.layer;

            //倒计时
            var thisTimer, setCountdown = function(y, M, d, H, m, s){
                var endTime = new Date(y, M||0, d||1, H||0, m||0, s||0) //结束日期
                    ,serverTime = new Date(); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

                clearTimeout(thisTimer);
                util.countdown(endTime, serverTime, function(date, serverTime, timer){
                    var str = date[0] + '天' + date[1] + '时' +  date[2] + '分' + date[3] + '秒';
                    lay('#test2').html(str);
                    thisTimer = timer;
                });
            };
            setCountdown(2019,5,30);

            laydate.render({
                elem: '#test1'
                ,type: 'datetime'
                ,done: function(value, date){
                    setCountdown(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
                }
            });

        });
    </script>

    <script src="../../cityJs/fixdiv.js"></script>
    <script src="../../cityJs/address.js"></script>
</html>