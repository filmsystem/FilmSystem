<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="filmsystem.Model.*" %>
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
    Film film;
    ArrayList<HashMap<String, Object>> commentMapList = new ArrayList<>();
    Customer currentUser;
%>
<%
    int filmId = Integer.parseInt(request.getParameter("id"));
    film = (Film) session.getAttribute("filmFound");
    commentMapList = (ArrayList<HashMap<String, Object>>)session.getAttribute("filmCommentMapList");
    currentUser = (Customer) session.getAttribute("currentUser");

    if(film == null)
        film = new Film();

    if(commentMapList == null)
        commentMapList = new ArrayList<>();

    if(currentUser == null)
        currentUser = new Customer();

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
            <li><a href="<%=basePath%>/api/logout">退出登录</a></li>
        </ul>
    </div></div>
<br><br>
<%--</div>--%>

<%--页面--%><div style="padding: 20px; background-color: RGB(80,56,88);">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="color:#ffffff;margin-left:160px"><%=film.getName()%></legend>
    </fieldset>
    <div class="layui-row">
        <div class="layui-col-md4">
            <div class="grid-demo grid-demo-bg1">
                <img src="/FilmSystem/img/<%=film.getImg()%>.png"width=220px height=600px style="margin-left:180px">
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="grid-demo">
                <table>
                    <tbody>
                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;">导演: <%=film.getDirectors()%></p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;">主演：<%=film.getCasts()%></p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;">国家：<%=film.getCountries()%></p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;">类型: <%=film.getType()%></p></td>
                    </tr>
                    <%--<tr>--%>
                    <%--<td><p style="color:#ffffff; min-height: 30px;"><%=film.getSummary()%></p></td>--%>
                    <%--</tr>--%>

                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;">评分：<%=film.getStar()%> / 5</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff; min-height: 30px;"><%=film.getYear()%> 年上映</p></td>
                    </tr>
                    <br/><br/>

                    <%--<tr>--%>
                        <%--<td><button data-toggle="modal" data-target="#myModal" data-keyboard="false" class="layui-btn layui-btn-primary" style="width:180px">☆☆☆☆☆评分</button>--%>
                            <%--<div id="myModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">--%>
                                <%--<div class="modal-dialog">--%>
                                    <%--<div class="modal-content">--%>
                                        <%--<div class="modal-header">--%>
                                            <%--<button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>--%>
                                            <%--<h4 id="myModalLabel" class="modal-title">写评论</h4>--%>
                                        <%--</div>--%>
                                        <%--<div id="test6" style="margin-left:150px"></div>--%>
                                        <%--<div class="layui-input-block" style="margin-left:10px">--%>
                                            <%--<textarea placeholder="快来说说你的看法吧" class="layui-textarea"></textarea>--%>
                                        <%--</div>--%>
                                        <%--<div class="modal-footer">--%>
                                            <%--<button type="button" data-ok="modal" class="sui-btn btn-large btn-danger">发布</button>--%>
                                            <%--<button type="button" data-dismiss="modal" class="sui-btn btn-large">取消</button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</td>--%>
                    <%--</tr>--%>

<%--                    <tr>--%>
<%--                        <td><p style="color:RGB(80,56,88)">导演</p></td>--%>
<%--                    </tr>--%>
                    </tbody>
                </table>
            </div>
            </td>
            </tr>
            <tr>
                <td><p style="color:RGB(80,56,88)">导演</p></td>
            </tr>
            <tr>
                <td><button id="buyBtn" class="layui-btn layui-btn-danger" style="width:180px">购  买</button></td>
            </tr>
        </div>
    </div>

</div>
</div>
<br><br>
<div class="layui-row">
    <div class="layui-col-md4 layui-col-md-offset1" >
        <div class="grid-demo grid-demo-bg1"><h2><span class="sui-text-danger">剧情详情</span></h2></div>
    </div>
</div>
<br>
<div class="layui-row">
    <div class="layui-col-md10 layui-col-md-offset1">
        <div class="grid-demo grid-demo-bg1"> <%=film.getSummary()%> </div>
    </div>
</div>
<br><br>
<div class="layui-row">
    <div class="layui-col-md4 layui-col-md-offset1" >
        <div class="grid-demo grid-demo-bg1"><h2><span class="sui-text-danger">热门评论</span></h2></div>
    </div>
    <div class="layui-col-md1 layui-col-md-offset5" >
        <div class="grid-demo grid-demo-bg1"><button class="layui-btn layui-btn-danger layui-btn-radius" data-toggle="modal" data-target="#myModal2" data-keyboard="false">写评论</button></div>
        <form id="commentForm">
            <div id="myModal2" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel2" class="modal-title">写评论</h4>
                        </div>
                        <div id="test7" style="margin-left:150px"></div>
                        <div class="layui-input-block" style="margin-left:10px">
                            <textarea name="comment" placeholder="快来说说你的看法吧" class="layui-textarea"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button id="commentSubmitBtn" type="button" data-ok="modal" class="sui-btn btn-large btn-danger">发布</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-large">取消</button>
                        </div>
                        <input type="hidden" name="userId" value="<%=currentUser.getId()%>">
                        <input type="hidden" name="filmId" value="<%=filmId%>">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<br>
<%--<%--%>
<%--    for(int i=0;i<10;i++){--%>
<%--%>--%>
<%--<table class="layui-table" lay-even="" lay-skin="nob">--%>
<%--    <tbody>--%>
<%--    <td width="260px"></td>--%>
<%--    <li>--%>
<%--        <td><img src="/FilmSystem/img/2.png"width=60px height=60px></td>--%>
<%--    <td>--%>
<%--     <li><h3>balabalab</h3></li>--%>
<%--     <li><p class="sui-text-large"><span class="sui-text-disabled">balabalab</span></p></li>--%>
<%--    </td>--%>


<%--    <li><p>balabala</p></li>--%>
<%--    </tbody>--%>
<%--    <br>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>

<%--</table>--%>

<%
    for(int i = 0; i < commentMapList.size(); i++){
        HashMap<String,Object> map = commentMapList.get(i);
        FilmComment comment = (FilmComment) map.get("filmComment");
        Customer customer = (Customer) map.get("customer");
%>
<div class="layui-row layui-col-md-offset1">

    <div class="layui-col-md1"  style="height:50px">
        <div class="grid-demo grid-demo-bg1"><img src="/FilmSystem/img/<%=customer.getImg()%>.png"width=70px height=70px style="border-radius:50%"></div>
    </div>
    <div class="layui-col-md1">
        <li><h3><%=customer.getUsername()%></h3></li>
        <li><p class="sui-text-large"><span class="sui-text-disabled">评分：<%=comment.getFilmStar()%></span></p></li>
    </div>
</div>
<br>
<div class="layui-row">
    <div class="layui-col-md9 layui-col-md-offset2" >
        <div class="grid-demo grid-demo-bg1" ><p style="font-size:16px"> <%=comment.getComment()%></p></div>
    </div>
</div>
<br>
<%--<div class="layui-row">--%>
    <%--<div class="layui-col-md6 layui-col-md-offset2" >--%>
        <%--<div class="grid-demo grid-demo-bg1" >balabala</div>--%>
    <%--</div>--%>
<%--</div>--%>
<br>
<hr class="layui-bg-gray">
<br>

<%
    }
%>



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
            ,value: 5
            ,half: true
            ,text: true
            ,setText: function(value){
                this.span.text(value+'分');
            }
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
<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/film/' + <%=filmId%>,
            success: function (res) {
                if (res != "SUCCESS")
                    alert("数据获取出错！")
                // if(location.href.indexOf("#reloaded")==-1){
                //     location.href=location.href+"#reloaded";
                //     location.reload();
                // }
            },
            error: function () {
                alert("操作失败！")
            }
        })
        $.ajax({
            type: "GET",
            url: '<%=basePath%>/api/filmcomment?filmId=' + <%=filmId%>,
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
        $("#buyBtn").on('click', function () {
            $.ajax({
                type: "GET",
                url: '<%=basePath%>/api/film_cinema/' + <%=filmId%>,
                success: function (res) {
                    if (res == "SUCCESS")
                        location.replace("selectCinema.jsp")
                    else if(res == "DB_ERROR")
                        alert("数据获取出错！")
                },
                error: function () {
                    alert("操作失败！")
                }
            })
        });
    });
    $(function () { //TODO: 提取评分
        $("#commentSubmitBtn").on('click', function () {
            var params = $('#commentForm').serialize();
            $.ajax({
                type: "POST",
                url: '<%=basePath%>/api/filmcomment?' + params,
                success: function (res) {
                    if (res == "SUCCESS")
                        location.replace("selectCinema.jsp")
                    else if(res == "DB_ERROR")
                        alert("数据获取出错！")
                },
                error: function () {
                    alert("操作失败！")
                }
            })
        });
    });
</script>
</body>
</html>