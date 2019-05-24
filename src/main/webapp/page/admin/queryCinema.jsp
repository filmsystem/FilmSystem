<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
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
    </head>
</head>
<body>

<div class="sui-navbar navbar-inverse">
    <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
        <ul class="sui-nav">

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影院管理      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addCinema.jsp">增加影院</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryCinema.jsp">查询影院</a></li>
                </ul>
            </li>

            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影片管理      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addFilm.jsp">增加影片</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryFilm.jsp">查询影片</a></li>
                </ul>
            </li>


            <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">管理员      <i class="caret"></i></a>
                <ul role="menu" class="sui-dropdown-menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="addAdmin.jsp">增加管理员</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="queryAdmin.jsp">查询管理员</a></li>
                </ul>
            </li>
        </ul>


        <ul class="sui-nav pull-right">
            <li><a href="adminInfo.jsp">个人中心</a></li>
            <li><a href="/FilmSystem/firstPage.jsp">退出登录</a></li>
        </ul>



    </div>
</div>

<blockquote class="layui-elem-quote"><h1>影院查询</h1></blockquote>




    <%!
  ArrayList<Administrator> list;
%>
    <%
  list = (ArrayList<Administrator>) session.getAttribute("administratorList");
%>
<%--<% if(list != null){%>--%>
<table class="layui-table" lay-even="" lay-skin="nob">
    <thead>
    <tr>
        <th width="300px" ></th>
        <th width="200px" ><h3>影院名</h3></th>
        <th width="200px"><h3>城市</h3></th>
        <th width="300px"><h3>地址</h3></th>
        <th width="100px"><h3>修改</h3></th>
        <th width="100px"><h3>删除</h3></th>
        <th width="200px" ></th>






    </tr>
    </thead>

    <%--<%--%>
    <%--for(int i = 0; i < list.size(); i++){--%>
    <%--%>--%>

    <%
        for(int i = 0; i < 10; i++){
    %>

    <tbody>

    <tr>
        <%--<td><input type="text" name="username"  value= "<%=list.get(i).getUsername()%>" /></td>--%>
        <%--<td> <p> <%=list.get(i).getId()%> </p> </td>--%>
        <%--<td> <p> <%=list.get(i).getUsername()%> </p> </td>--%>
        <td width="300px"></td>
        <td width="100px"><p class="sui-text-large">万达</p></td>
            <td width="200px"><p class="sui-text-large">上海</p></td>
            <td width="300px"><p class="sui-text-large">聚丰园路88号</p></td>
            <td width="200px"><button id="J_addsuppliers" data-toggle="modal" data-target="#J_addsuppliersDialog" data-width="large" data-backdrop="static" class="sui-btn btn-primary">添加供应商</button></td><div id="J_addsuppliersDialog" tabindex="-1" role="dialog" class="sui-modal hide fade" data-addsupplierurl="http://" data-getsuppliersurl="http://xxx">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel" class="modal-title">供应商收编</h4>
                        </div>
                        <div class="modal-body sui-form form-horizontal">
                            <div class="sui-msg msg-block msg-default msg-tips">
                                <div class="msg-con">以下为供销平台上已经获得小二授权经营您的品牌但还未被您进行收编的供应商</div>
                                <s class="msg-icon"></s>
                            </div>
                            <table class="sui-table table-bordered-simple">
                                <thead>
                                <tr>
                                    <th>供应商昵称</th>
                                    <th>公司名称</th>
                                    <th>供应商类型</th>
                                    <th>分销商数量</th>
                                    <th>授权品牌</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><span>only淘宝商城官方旗舰店</span></td>
                                    <td><span>九牧官方旗舰店</span></td>
                                    <td><span>企业</span></td>
                                    <td><span class="distributor-num">432</span></td>
                                    <td>
                                        <ul class="authorize-brand">
                                            <li>海尔</li>
                                            <li>统帅</li>
                                        </ul>
                                    </td>
                                    <td data-supplierid="111">
                                        <button class="sui-btn btn-small J_addOneSupplier">添加</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        <td width="100px"><button class="sui-btn btn-bordered btn-large btn-danger">删除</button></td>
        <td width="200px"></td>


    </tr>
    <%}%>
    <%--<%}--%>
    <%--}--%>
    <%--//  else{%>--%>
    <%--//  <tr align="center">--%>
    <%--//    <th> <p><%="数据库无记录！"%></p></th>--%>
    <%--//  </tr>--%>
    </tbody>
</table>
<%--<%}%>--%>

</table>

<script>
    $supDialog = $('#J_addsuppliersDialog')
    $supDialog.on('click', '.J_addOneSupplier', function(e) {
        $supDialog.modal('shadeIn');
        return $.confirm({
            title: '确认',
            body: '您确认添加该供应商吗？',
            backdrop: false,
            okHide: function() {
                $.alert({
                    hasfoot: false,
                    backdrop: false,
                    title: '不管发生了什么，总之成功了',
                    body: 'msg-large msg-block msg-',
                    timeout: 1000
                });
            },
            hide: function() {
                return $supDialog.modal('shadeOut');
            }
        });
    });


</script>

</html>