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
    Film film = new Film();
    Cinema cinema = new Cinema();
    HashMap<String, Object> filmShowMap;
    FilmShow selectedShow = new FilmShow();
    FilmOffice filmOffice = new FilmOffice();
%>
<%

    Customer currentUser = (Customer) session.getAttribute("currentUser");
    filmShowMap = (HashMap<String, Object>)session.getAttribute("filmShowMap");
    selectedShow = (FilmShow) filmShowMap.get("filmShow");
    filmOffice = (FilmOffice) filmShowMap.get("office");
    cinema = (Cinema) filmShowMap.get("cinema");
    film = (Film) filmShowMap.get("film");

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

<%--页面--%>

<br><br>
<div class="sui-steps-round">
    <div class="finished">
        <div class="wrap" >
            <div class="round" style="margin-left:250px">1</div>
            <div class="bar" style="margin-left:250px"></div>
        </div>
        <label style="margin-left:250px">选择影片场次</label>
    </div>
    <div class="current">
        <div class="wrap">
            <div class="round" >2</div>
            <div class="bar"></div>
        </div>
        <label>选择座位</label>
    </div>
    <div class="todo">
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
<br><br>

<%--<% if(list != null){%>--%>

<div align="center">
<div style="background-color: #ffffff;" align="center">

    <div class="layui-row">
        <div class="layui-col-md1" style="margin-left:530px">
            <div class="grid-demo grid-demo-bg1"><img src="/FilmSystem/img/ableseat.png"width=50px height=50px>可选座位</div>
        </div>
        <div class="layui-col-md1">
            <div class="grid-demo"><img src="/FilmSystem/img/noseat.png"width=55px height=55px>已售座位</div>
        </div>
        <div class="layui-col-md1">
            <div class="grid-demo grid-demo-bg1"><img src="/FilmSystem/img/selseat.png"width=50px height=50px>已选座位</div>
        </div>
    </div>
    <br>
    <br>
    <p class="sui-text-xxlarge" align="center"><%=filmOffice.getOfficeId() %>号厅银幕中央</p>
    <br>
    <div align="center">
<table class="sui-table table-nobordered">


    <tbody>
    <%--<%--%>
    <%--for(int i = 0; i < list.size(); i++){--%>
    <%--%>--%>
    <%
        String seat = selectedShow.getSeat();
        for(int i = 1,k = -1; i <= filmOffice.getRowNum(); i++){
    %>
    <tr>
        <td width="50px"></td>
        <td ><span class="sui-text-disabled"><%=i%></span></td>
        <td width="30px"><p style="color:#ffffff">占位符</p></td>
            <%
                for(int j = 1; j <= filmOffice.getCol(); j++){
                    k++;
                    if (seat.charAt(k)=='0'){
        %>
        <td>
            <button value="myValue" id="mySeat" data-toggle="modal" data-target="#myModal<%=k%>" data-keyboard="false" class="sui-btn btn-bordered btn-large btn-info" width="15px"><i class="sui-icon icon-location"></i>☆</button>
            <!-- Modal-->
            <div id="myModal<%=k%>" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog" id="myDialog" >
                    <div class="modal-content" id="myContent">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel<%=k%>" class="modal-title">选座</h4>
                        </div>
                        <h3 class="modal-body">请确认您选择的座位</h3>
                        <h2 class="modal-body" ><span id="MyNum" class="sui-text-danger" style="margin-left:160px"><%=i%> 排 <%=j%> 座</span></h2>
                        <div class="modal-footer">
                            <button type="button" data-ok="modal" class="sui-btn btn-primary btn-large" onclick="doSelect(<%=i%>, <%=j%>)">确定</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <%
        }
            else{   // 该座位已售出
        %>
        <td>
            <button class="sui-btn btn-danger">☆</button>
        </td>
        <%
            }
        }
        %>

    </tr>
    <%}%>

    </tbody>
</table>
        <br><br>
        <%--<button class="sui-btn btn-block btn-xlarge btn-danger" align="center" ><h3>确  定  选  座</h3></button>--%>
        <br><br><br><br><br>
    </div>
<%--<%}--%>
<%--}--%>
<%--//  else{%>--%>
<%--//  <tr align="center">--%>
<%--//    <th> <p><%="数据库无记录！"%></p></th>--%>
<%--//  </tr>--%>

<%--<%}%>--%>

</div>
</div>
</body>
</html>
<script type="text/javascript">
    window.onload = function () {
        if((<%=session.getAttribute("currentUser") == null ? "0" : "1"%>) == "0"){
            alert("请先登录！")
            location.replace("<%=basePath%>/firstPage.jsp")
        }
        else{
            $.ajax({
                type: "GET",
                url: '<%=basePath%>/api/filmshow/' + <%=selectedShow.getId()%>,
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
    function doSelect(i,j) {
        $.ajax({
            type: "POST",
            url: '<%=basePath%>/api/ticket/createOrder?userId=' + <%=currentUser.getId()%> + "&showId=" + <%=selectedShow.getId()%> + "&row=" + i + "&col=" + j,
            success: function (res) {
                if (res == "SUCCESS")
                    location.replace("buyTicket.jsp")
                else if (res == "FAIL")
                    alert("选座失败！")
                else if (res == "DB_ERROR")
                    alert("数据库出错！")
            },
            error: function () {
                alert("操作失败！")

            }
        })
    };
</script>