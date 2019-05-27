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
      <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">
          <li class="sui-nav"><a href="#">首页</a></li>
          <li><a href="#">电影</a></li>
          <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">其他      <i class="caret"></i></a>
            <ul role="menu" class="sui-dropdown-menu">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">关于</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">项目组成员</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">版权</a></li>
            </ul>
          </li>
          <li></li>
        </ul>
          <form class="sui-form sui-form pull-left" id="searchFilm">
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
              <input type="text" id="auto-init-1" value="" data-toggle="autocomplete" data-lookup="[&quot;复仇者联盟4&quot;, &quot;复仇者联盟3&quot;, &quot;复仇者联盟2&quot;, &quot;复仇者联盟1&quot;, &quot;edfa&quot;, &quot;wdasda&quot;, &quot;tueiyhgk&quot;, &quot;vjflcjx&quot;]" class="input-large"placeholder="找电影">

              <a href="#"><img src="/FilmSystem/img/search.png" width=22px height=22px  /></a>
          </form>
        <ul class="sui-nav pull-right">
          <li><a href="#">个人中心</a></li>
          <li><a href="#">退出登录</a></li>
        </ul>
      </div></div>
        <br><br>
    </div>


    <%!
      ArrayList<Film> list;
    %>
    <%
      list = (ArrayList<Film>) session.getAttribute("filmList");
    %>
    <%--<% if(list != null){%>--%>
    <table class="sui-table table-nobordered">

      <tbody>
      <%--<%--%>
      <%--for(int i = 0; i < list.size(); i++){--%>
      <%--%>--%>

      <%
          for (int i = 0; list != null && i < list.size()/2; i=i+2) {
              Film temp = list.get(i);
              Film temp2 = list.get(i++);
      %>
      <tr style="margin-left:30px">
        <td width="280px"></td>
        <form>
        <td width="180px">
            <input name="" type="image" src="URI.create(<%=temp.getImg()%>)" width="170px" height="240px" class="btn" />
        </td>
            <td width="280px">
                <li><h1 style="color:#000000;margin-top:1px" align="left"><%=temp.getName()%></h1></li>
                <br>
                <li><strong><h1 style="color:#FFCC00;margin-top:1px" align="left"><%=temp.getStar()%></h1></strong></li>
                <br>
                <li><h4 style="color:#000000;margin-top:1px" align="left">导演:<%=temp.getDirectors()%></h4></li>
                <li><h4 style="color:#000000;margin-top:1px" align="left">主演:<%=temp.getCasts()%></h4></li>
                <li><h4 style="color:#000000;margin-top:1px" align="left">类型：<%=temp.getType()%></h4></li>
                <li><h4 style="color:#888888;margin-top:1px" align="left"><%=temp.getYear()%>上映</h4></li>
            </td>
        </form>
<%--        <td width="180px" height="5px"><img src="/FilmSystem/img/1.png" width="150px" height="200px" /></td>--%>
        <form>
          <td width="180px">
            <input name="" type="image" src="URI.create(<%=temp2.getImg()%>)" width="170px" height="240px" class="btn" />
          </td>
            <td width="150px">
                <li><h1 style="color:#000000;margin-top:1px" align="left"><%=temp2.getName()%></h1></li>
                <br>
                <li><strong><h1 style="color:#FFCC00;margin-top:1px" align="left"><%=temp2.getStar()%></h1></strong></li>
                <br>
                <li><h4 style="color:#000000;margin-top:1px" align="left">导演:<%=temp2.getDirectors()%></h4></li>
                <li><h4 style="color:#000000;margin-top:1px" align="left">主演:<%=temp2.getCasts()%></h4></li>
                <li><h4 style="color:#000000;margin-top:1px" align="left">类型：<%=temp2.getType()%></h4></li>
                <li><h4 style="color:#888888;margin-top:1px" align="left"><%=temp2.getYear()%>上映</h4></li>
            </td>
        </form>

        <td width="280px"></td>
      </tr>
      <tr style="margin-left:20px;height:20px">
        <td></td>
        <td><p class="sui-text-large" style="margin-top:1px;margin-left:60px"></p></td>
        <td><p class="sui-text-large" style="margin-top:1px;margin-left:60px"></p></td>
        <td></td>

      </tr>
      <tr>
        <td></td>
      </tr>
      <%}%>
      </tbody>
    </table>
        <%--<%}--%>
        <%--}--%>
        <%--//  else{%>--%>
        <%--//  <tr align="center">--%>
        <%--//    <th> <p><%="数据库无记录！"%></p></th>--%>
        <%--//  </tr>--%>

    <%--<%}%>--%>

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
</html>