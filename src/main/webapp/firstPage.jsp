<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="filmsystem.Model.Film" %>
<%@ page import="filmsystem.Service.Impi.FilmServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">其他 <i
                    class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="aboutUs.jsp">项目组成员</a></li>
                </ul>
            </li>
            <li></li>
        </ul>


        <ul class="sui-nav pull-right">
            <button data-toggle="modal" data-target="#myModal" data-keyboard="false"
                    class="sui-btn btn-bordered btn-large">登录
            </button>
            <div id="myModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>

                            <p class="sui-text-xlarge" id="myModalLabel" class="modal-title" align="center">账号登录</p>
                        </div>
                        <br><br>
                        <form class="sui-form form-horizontal" style="margin-left:48px" id="loginForm">
                            <div class="control-group">
                                <label for="inputEmail" class="control-label">用户：</label>
                                <div class="controls">
                                    <input type="text" id="inputEmail" placeholder="" class="input-large" name="username">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputPassword" class="control-label">密码：</label>
                                <div class="controls">
                                    <input type="password" id="inputPassword" placeholder="" class="input-large" name="password">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"></label>
                                <div class="controls">
                                    <label data-toggle="checkbox" class="checkbox-pretty inline">
                                        <input type="checkbox" name="remember-me"><span>记住我</span>
                                    </label>
                                </div>
                            </div>

                            <label class="radio-pretty inline checked" style="margin-left:88px">
                                <input type="radio" checked="checked" name="identity" id="loginType1"
                                       value=1><span>用户</span>
                            </label>
                            <label class="radio-pretty inline">
                                <input type="radio" name="identity" id="loginType2" value=2><span>影院方</span>
                            </label>
                            <label class="radio-pretty inline">
                                <input type="radio" name="identity" id="loginType3" value=3><span>管理员</span>
                            </label>

                            <div class="control-group">
                                <label class="control-label"></label>
                                <div class="modal-footer">
                                    <button type="submit" data-ok="modal" id="loginBtn"
                                            class="sui-btn btn-primary btn-large">登录
                                    </button>
                                    <button type="submit" data-dismiss="modal" class="sui-btn btn-default btn-large">
                                        取消
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <button data-toggle="modal" data-target="#myModal2" data-keyboard="false"
                    class="sui-btn btn-bordered btn-large">注册
            </button>
            <div id="myModal2" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>

                            <p class="sui-text-xlarge" id="myModalLabel2" class="modal-title" align="center">账号注册</p>
                        </div>
                        <br><br>
                        <form class="sui-form form-horizontal" style="margin-left:48px" id="registerForm">
                            <div class="control-group">
                                <label for="inputNick" class="control-label">用户名：</label>
                                <div class="controls">
                                    <input type="text" id="inputNick" name="name" placeholder=""
                                           data-rules="required|minlength=2|maxlength=6" data-error-msg="昵称必须是2-6位"
                                           data-empty-msg="亲，昵称别忘记填了">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputPassword" class="control-label">密码：</label>
                                <div class="controls">
                                    <input type="password" id="inputPassword3" name="password" placeholder=""
                                           data-rules="required" title="密码">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputRepassword" class="control-label">重复密码：</label>
                                <div class="controls">
                                    <input type="password" id="inputRepassword" name="repassword" placeholder=""
                                           data-rules="required|match=password">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputNick" class="control-label">性别：</label>
                                <div class="controls">
                                    <label data-toggle="radio" class="radio-pretty inline">
                                        <input type="radio" name="gender" value="1" data-rules="required"><span>男</span>
                                    </label>
                                    <label data-toggle="radio" class="radio-pretty inline">
                                        <input type="radio" name="gender" value="2" data-rules="required"><span>女</span>
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="mobile" class="control-label">手机号码：</label>
                                <div class="controls">
                                    <input type="text" id="mobile" placeholder="" data-rules="required|mobile"
                                           name="phonenum">
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="mobile" class="control-label">城市：</label>
                                <div class="controls">
                                    <input id="autocomplete" type="text" name="city" placeholder=""
                                           autocomplete="off">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"></label>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"></label>
                    <div class="controls">
                        <button type="submit" class="sui-btn btn-primary" style="margin-left:180px" id="registerBtn">立即注册</button>
                        <%--<button type="reset" class="sui-btn btn-primary" style="margin-left:180px"> 重 置 </button>--%>
                    </div>
                    <br><br>
                </div>
            </div>
        </ul>

    </div>
</div>


<div id="myCarousel2" class="sui-carousel slide" align="center" width="800px">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel2" data-slide-to="1"></li>
        <li data-target="#myCarousel2" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="active item"><img src="/FilmSystem/img/1.png" width="650" height="100">
            <div class="carousel-caption">

                <p>大侦探皮卡丘 (2019)</p>
            </div>
        </div>
        <div class="item"><img src="/FilmSystem/img/2.png" width="650" height="100">
            <div class="carousel-caption">

                <p>企鹅公路 (2019)</p>
            </div>
        </div>
        <div class="item"><img src="/FilmSystem/img/3.png" width="650" height="100">
            <div class="carousel-caption">

                <p>一条狗的使命2 (2019)</p>
            </div>
        </div>
    </div>
    <a href="#myCarousel2" data-slide="prev" class="carousel-control left">‹</a>
    <a href="#myCarousel2" data-slide="next" class="carousel-control right">›</a>
</div>

<script>
    var $carousel = $("#myCarousel2").carousel({
        interval: 2000
    });

    $("#btn-cycle").click(function () {
        $carousel.carousel('cycle');
    });
    $("#btn-pause").click(function () {
        $carousel.carousel('pause');
    });
    $("#btn-slide2").click(function () {
        $carousel.carousel(1);
    });
    $("#btn-slide-prev").click(function () {
        $carousel.carousel('prev');
    });
    $("#btn-slide-next").click(function () {
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
    FilmServiceImpl filmService = new FilmServiceImpl();
    list.clear();
    list.add(filmService.findFilmById(26835471));
    list.add(filmService.findFilmById(26891256));
    list.add(filmService.findFilmById(27074316));
    list.add(filmService.findFilmById(30464313));
    list.add(filmService.findFilmById(33434703));
    list.add(filmService.findFilmById(26731376));
    list.add(filmService.findFilmById(26879542));
    list.add(filmService.findFilmById(27042544));
    list.add(filmService.findFilmById(30158971));
    list.add(filmService.findFilmById(30467175));
%>
<%--<% if(list != null){%>--%>
<table class="sui-table table-nobordered">

    <tbody>
    <%
        for(int i = 0; i < list.size(); i += 5){
    %>
    <tr style="margin-left:30px">
        <td width="140px"></td>
        <% for(int j = 0; j < 5 && (i + j) < list.size(); j++){ %>
        <form>
            <td width="180px" height="300px">
                <a onclick="doAlert()"> <img src="/FilmSystem/img/<%=list.get(i + j).getImg() + ".png"%>" style="width:180px;height:270px"/></a>
            </td>
        </form>
        <%} %>
        <td></td>
    </tr>
    <tr style="margin-left:20px;height:20px" >
        <td></td>

        <% for(int j = 0; j < 5 && (i + j) < list.size(); j++){ %>
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

</body>
</html>
<script>
    $(function () {
        $("#loginBtn").on('click', function () {
            var identity = $('input:radio[name="identity"]:checked').val();
            var params = $("#loginForm").serialize();
            $.ajax({
                type: "POST",
                url: '<%=basePath%>/api/login',
                // dataType: "json",
                data: params,
                success: function (res) {
                    if (res == "SUCCESS") {
                        if (identity == 1) {
                            window.location.href = "<%=basePath%>/page/user/index.jsp"
                        } else if (identity == 2) {
                            window.location.href = "<%=basePath%>/page/cinema/index.jsp"
                        } else {
                            window.location.href = "<%=basePath%>/page/admin/adminInfo.jsp"
                        }
                    }else if (res == "FAIL")
                        alert("登录失败！")
                    else if(res="EMPTY"){
                        alert("您有必填项未填写！")
                    }
                    else if (res == "DB_ERROR")
                        alert("数据库出错！")
                },
                error: function () {
                    alert("操作失败！")
                }
            })
        });
    });

    $(function () {
        $("#registerBtn").on('click', function () {
            var gender = $('input:radio[name="gender"]:checked').val();
            var params = $("#registerForm").serialize();
            if( $('input:password[name="password"]').val() != $('input:password[name="repassword"]').val()){
                alert("请输入一致的密码！")
            }
            else if(gender != 1 && gender != 2){
                alert("请选择性别！")
            }
            else{
                $.ajax({
                    type: "POST",
                    url: '<%=basePath%>/api/registerCustomer',
                    // dataType: "json",
                    data: params,
                    success: function (res) {
                        if (res == "SUCCESS")
                            alert("注册成功！")
                        else if (res == "EMPTY")
                            alert("您有必填项未填写！")
                        else if (res == "FAIL")
                            alert("注册失败！")
                        else if (res == "DB_ERROR")
                            alert("数据库出错！")
                    },
                    error: function () {
                        alert("操作失败！")
                    }
                })
            }
        });
    });

    function doAlert(){
        alert("请先登录！")
    }
</script>