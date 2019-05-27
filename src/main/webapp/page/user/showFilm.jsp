<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="filmsystem.Service.Impi.FilmServiceImpl" %>
<%@ page import="filmsystem.Model.Film" %>
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
  <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

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
      <ul class="sui-nav pull-right">
        <li><a href="#">个人中心</a></li>
        <li><a href="#">退出登录</a></li>
      </ul>
    </div></div>


  <div id="myCarousel2" class="sui-carousel slide" align="center" width="800px">
    <ol class="carousel-indicators" >
      <li data-target="#myCarousel2" data-slide-to="0" class="active" ></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" >
      <div class="active item"><img src="/FilmSystem/img/2.png" width="850" height="120" >
        <div class="carousel-caption">

          <p>内容内容内容内容内容内容内容内容内容内容内容内容</p>
        </div>
      </div>
      <div class="item"><img src="/FilmSystem/img/2.png" width="850" height="120">
        <div class="carousel-caption">

          <p>内容内容内容内容内容内容内容内容内容内容内容内容</p>
        </div>
      </div>
      <div class="item"><img src="/FilmSystem/img/2.png" width="850" height="120">
        <div class="carousel-caption" >

          <p>内容内容内容内容内容内容内容内容内容内容内容内容</p>
        </div>
      </div>
    </div><a href="#myCarousel2" data-slide="prev" class="carousel-control left">‹</a>
    <a href="#myCarousel2" data-slide="next" class="carousel-control right">›</a>
  </div>
   
  <script>
    var $carousel = $("#myCarousel2").carousel({
      interval: 2000
    });

    $("#btn-cycle").click(function() {
      $carousel.carousel('cycle');
    });
    $("#btn-pause").click(function() {
      $carousel.carousel('pause');
    });
    $("#btn-slide2").click(function() {
      $carousel.carousel(1);
    });
    $("#btn-slide-prev").click(function() {
      $carousel.carousel('prev');
    });
    $("#btn-slide-next").click(function() {
      $carousel.carousel('next');
    });
      
      
  </script>

  <br>
  <h1><span class="sui-text-danger" style="margin-left:160px">正在热映</span></h1>
  <br>

    <%!
      ArrayList<Film> list = new ArrayList<>();
    %>
    <%
//      list = (ArrayList<Administrator>) session.getAttribute("administratorList");
      FilmServiceImpl filmService = new FilmServiceImpl();
      list.add(filmService.findFilmById(26835471));
      list.add(filmService.findFilmById(26891256));
      list.add(filmService.findFilmById(27074316));
      list.add(filmService.findFilmById(30464313));
      list.add(filmService.findFilmById(33434703));
    %>
    <%--<% if(list != null){%>--%>
    <table class="sui-table table-nobordered">

      <tbody>
      <%
        for(int i = 0; i < list.size(); i+=5){
      %>
      <tr style="margin-left:30px">
        <td width="140px"></td>
        <% for(int j = 0; j < 5; j++){ %>
          <form>
          <td width="180px">
            <a href="showFilmInfo.jsp?id=<%=list.get(i+j).getId()%>"> <img src="<%=list.get(i + j).getImg()%>"/></a>
          </td>
          </form>
        <%} %>
        <td></td>
      </tr>
      <tr style="margin-left:20px;height:20px" >
        <td></td>

        <% for(int j = 0; j < 5; j++){ %>
          <td><p class="sui-text-large" style="margin-top:1px;margin-left:60px"><%=list.get(i+j).getName()%></p></td>
        <%} %>

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
</html>