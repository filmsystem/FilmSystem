<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="filmsystem.Tools.PrintTimestamp" %>
<%@ page import="filmsystem.Model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><html>
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
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

    %>
</head>
<%!
    ArrayList<HashMap<String,Object>> bookingRecordMapList;

%>
<%
    bookingRecordMapList = (ArrayList<HashMap<String,Object>>)session.getAttribute("bookingRecordMapList");

    if(bookingRecordMapList == null)
        bookingRecordMapList = new ArrayList<>();
%>
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
<blockquote class="layui-elem-quote"><h1>我的电影</h1></blockquote>
<br><br>
<table class="layui-table" lay-even="" lay-skin="nob">
    <%
        for(int i = 0; i < bookingRecordMapList.size(); i++){
            Cinema cinema = (Cinema)bookingRecordMapList.get(i).get("cinema");
            FilmShow filmShow = (FilmShow)bookingRecordMapList.get(i).get("filmShow");
            Film film = (Film)bookingRecordMapList.get(i).get("film");
            BookingRecord bookingRecord = (BookingRecord)bookingRecordMapList.get(i).get("bookingRecord");
    %>
    <tbody>
    <tr>
        <td><img src="/FilmSystem/img/noseat.png"width=50px height=50px style="margin-left:50px"/></td>
        <td>
            <li><span class="sui-text-xlarge"><%=film.getName()%></span></li>
            <li><p class="sui-text-large"><span class="sui-text-disabled"><%=PrintTimestamp.printToSecond(filmShow.getBeginTime())%></span></p></li>
            <li><p class="sui-text-large"><span class="sui-text-disabled"><%=cinema.getUsername()%></span></p></li>
        </td>
        <td></td>
        <td text-align="right">
            <button data-toggle="modal" data-target="#myModal3" data-keyboard="false" class="sui-btn btn-bordered btn-large">二维码</button>
            <div id="myModal3" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel3" class="modal-title">二维码</h4>
                        </div>
                        <br><br>
                        <div><h3 align="center">二维码</h3></div>
                        <br>
                        <div align="center"><img src="/FilmSystem/img/QR.png" width=170px height=170px /></div>
                        <br>
                        <div class="sui-msg msg-large msg-block msg-success" align="center">
                            <div class="msg-con">取票号: <%=bookingRecord.getCollectingString() == null ? "" : bookingRecord.getCollectingString()%></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-ok="modal" class="sui-btn btn-large btn-danger">确认</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-large">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <%--<td><button data-toggle="modal" data-target="#myModal" data-keyboard="false"  class="sui-btn btn-bordered btn-large btn-warning">评分</button>--%>
            <div id="myModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel" class="modal-title">写评论</h4>
                        </div>
                        <div id="test6" style="margin-left:150px"></div>
                        <div class="layui-input-block" style="margin-left:10px">
                            <textarea placeholder="快来说说你的看法吧" class="layui-textarea"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-ok="modal" class="sui-btn btn-large btn-danger">发布</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-large">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td></td>

    </tr>
    <tr></tr>
    <tr>
        <td><hr class="layui-bg-gray"></td>
    </tr>
    <tr></tr>
    </tbody>
<%
    }
%>
</table>
<script type="text/javascript">
    window.onload = function () {
        if((<%=session.getAttribute("currentUser") == null ? "0" : "1"%>) == "0"){
            alert("请先登录！")
            location.replace("<%=basePath%>/firstPage.jsp")
        }
        else{
            $.ajax({
                type: "GET",
                url: '<%=basePath%>/api/bookingrecord?userId=' + <%=((Customer)session.getAttribute("currentUser")).getId()%>,
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
        }
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
</body>
</html>