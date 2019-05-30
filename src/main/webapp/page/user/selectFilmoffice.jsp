<%@ page import="java.util.ArrayList" %>
<%@ page import="filmsystem.Model.Film" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="filmsystem.Model.Cinema" %>
<%@ page import="filmsystem.Model.FilmShow" %>
<%@ page import="filmsystem.Model.FilmOffice" %>
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
    Film film = new Film();
    Cinema cinema = new Cinema();
    ArrayList<HashMap<String, Object>> showMapList = new ArrayList<>();
%>
<%
    //    film = (Film) session.getAttribute("filmFound");
    showMapList = (ArrayList<HashMap<String, Object>>)session.getAttribute("filmShowMapList");
    if(showMapList == null)
        showMapList = new ArrayList<>();
    else{
        cinema = (Cinema) showMapList.get(0).get("cinema");
        film = (Film) showMapList.get(0).get("film");
    /**** test data ****/
//    film.setId(26662282);
//    film.setName("复仇者联盟4");
//    film.setCasts("");
//    film.setDirectors("");
//    film.setCountries("中美合拍");
//    film.setType("");
//    film.setYear(2019);
//    film.setSummary("无可奉告");

//    Cinema cinema = new Cinema();
//    cinema.setUsername("bilibili");
//    cinema.setAddress("国正中心");
//    cinema.setId(200);

//    FilmShow filmShow = new FilmShow();
//    filmShow.setId(5);
//    HashMap<String,Object> map = new HashMap<>();
//    map.put("film", film);
////    map.put("filmShow", filmShow);
//    map.put("cinema", cinema);
//    showMapList.add(map);
//
//    for(int i = 0; i < 5; i++){
//        FilmShow show = new FilmShow();
//        show.setFilmId(26835471);
//        show.setCinemaId(202);
//        show.setBeginTime(new Timestamp(System.currentTimeMillis()));
//        show.setPrice(40.5);
//        show.setOfficeId(3);
//        show.setDuration(100);
//        showList.add(show);
//    }

%>
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
            <input type="text" name="info" id="auto-init-1" value="" data-toggle="autocomplete" data-lookup="[&quot;复仇者联盟4&quot;, &quot;复仇者联盟3&quot;, &quot;复仇者联盟2&quot;, &quot;复仇者联盟1&quot;, &quot;edfa&quot;, &quot;wdasda&quot;, &quot;tueiyhgk&quot;, &quot;vjflcjx&quot;]" class="input-large"placeholder="找电影">

            <input type="image" src="/FilmSystem/img/search.png" width=22px height=22px class="btn" />
        </form>
        <ul class="sui-nav pull-right">
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">个人中心      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="userInfo.jsp">我的</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="recordsCount.jsp">我的数据</a></li>
                </ul>
            </li>
            <li><a href="<%=basePath%>/logout.jsp">退出登录</a></li>
        </ul>
    </div></div>
<br><br>
<%--</div>--%>

<%--页面--%>
<div style="padding: 20px; background-color: RGB(80,56,88);">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="color:#ffffff;margin-left:160px"><%=cinema.getUsername()%></legend>
    </fieldset>
    <div class="layui-row">
        <div class="layui-col-md4">
            <div class="grid-demo grid-demo-bg1">
                <img src="/FilmSystem/img/<%=cinema.getImg()%>.png"width=220px height=600px style="margin-left:180px">
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="grid-demo">
                <table>
                    <tbody>
                    <tr>
                        <td><h1 style="color:#ffffff">地址: <%=cinema.getAddress()%></h1></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>

                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>



                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            </td>
            </tr>
            <tr>
                <td><p style="color:RGB(80,56,88)">导演</p></td>
            </tr>
            <tr>
                <td></td>
        </div>
    </div>

</div>
</div>
<br><br>

<div class="layui-row">
    <div class="layui-col-md4 layui-col-md-offset1" >
        <div class="grid-demo grid-demo-bg1"><h2> <%=film.getName()%> </h2></div>
        <div><p class="sui-text-large"><span class="sui-text-disabled">时长：<%=((FilmShow)showMapList.get(0).get("filmShow")).getDuration()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型：<%=film.getType()%></span></p></div>
    </div>
</div>
<br>
<br>
<div class="layui-row">
    <div class="layui-col-md1 layui-col-md-offset1" >
        <div><p class="sui-text-large"><span class="sui-text-disabled">观影时间：</span></p></div>
    </div>
    <div class="layui-col-md1" >
        <div><button class="sui-btn btn-bordered btn-small btn-danger" >今天</button></div>
    </div>
</div>
<br>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <tr>
        <th width="180px"></th>
        <th width="300px"><h3>放映时间</h3></th>
        <th width="300px"><h3>放映厅</h3></th>
        <th width="300px"><h3>票 价</h3></th>
        <th width="300px"><h3>订 票</h3></th>
        <th width="50px"></th>
    </tr>
    </thead>
    <tbody>
    <%--<%--%>
    <%--for(int i = 0; i < list.size(); i++){--%>
    <%--%>--%>

    <%
        for(int i = 0; i < showMapList.size(); i++){
            FilmShow showTemp = (FilmShow)showMapList.get(i).get("filmShow");
            FilmOffice officeTemp = (FilmOffice)showMapList.get(i).get("office");
    %>
    <tr style="margin-left:30px" height="50">
        <td width="140px"></td>
        <td width="180px"><%=PrintTimestamp.printToSecond(showTemp.getBeginTime())%></td>
        <td width="180px"><%=officeTemp.getOfficeId()%> 号放映厅</td>
        <td width="180px"><%=showTemp.getPrice()%></td>
        <td width="180px"><button class="layui-btn layui-btn-danger layui-btn-radius" style="margin-left:6px" onclick="doSelect(<%=((FilmShow)showMapList.get(i).get("filmShow")).getId()%>)">选 座</button></td>
        <td></td>
    </tr>

    <%}
    }%>
    </tbody>
</table>

<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/filmshow?filmId=' + <%=film.getId()%> + '&cinemaId=' + <%=cinema.getId()%>,
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
    function doSelect(id) {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/filmshow/' + id,
            success: function (res) {
                if (res == "SUCCESS")
                    location.replace("selectSeat.jsp")
                else if (res == "NOT_FOUND")
                    alert("无该电影场次！")
                else if (res == "DB_ERROR")
                    alert("数据库出错！")
            },
            error: function () {
                alert("操作失败！")

            }
        })
    };
</script>

<script src="/FilmSystem/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['rate'], function(){
        var rate = layui.rate;
        //基础效果
        rate.render({
            elem: '#test1'
        })

        //显示文字
        rate.render({
            elem: '#test2'
            ,value: 2 //初始值
            ,text: true //开启文本
        });

        //半星效果
        rate.render({
            elem: '#test3'
            ,value: 2.5 //初始值
            ,half: true //开启半星
        })
        rate.render({
            elem: '#test4'
            ,value: 3.5
            ,half: true
            ,text: true
        })

        //自定义文本
        rate.render({
            elem: '#test5'
            ,value: 3
            ,text: true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
        })
        rate.render({
            elem: '#test6'
            ,value: 5
            ,half: true
            ,text: true
            ,setText: function(value){
                this.span.text(value+'分');
            }
        })

        //自定义长度
        rate.render({
            elem: '#test7'
            ,length: 3
        });
        rate.render({
            elem: '#test8'
            ,length: 10
            ,value: 8 //初始值
        });

        //只读
        rate.render({
            elem: '#test9'
            ,value: 4
            ,readonly: true
        });

        //主题色
        rate.render({
            elem: '#test10'
            ,value: 3
            ,theme: '#FF8000' //自定义主题色
        });
        rate.render({
            elem: '#test11'
            ,value: 3
            ,theme: '#009688'
        });

        rate.render({
            elem: '#test12'
            ,value: 2.5
            ,half: true
            ,theme: '#1E9FFF'
        })
        rate.render({
            elem: '#test13'
            ,value: 2.5
            ,half: true
            ,theme: '#2F4056'
        });
        rate.render({
            elem: '#test14'
            ,value: 2.5
            ,half: true
            ,theme: '#FE0000'
        })
    });
</script>

</body>
</html>