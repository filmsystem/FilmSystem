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

<%!
    ArrayList<Administrator> list;
%>
<%
    list = (ArrayList<Administrator>) session.getAttribute("administratorList");
%>
<%--<% if(list != null){%>--%>
<div style="padding: 20px; background-color: #ffffff;width:70%;margin:80px">
<table class="sui-table table-nobordered" style="left:50%">


    <tbody>
    <%--<%--%>
    <%--for(int i = 0; i < list.size(); i++){--%>
    <%--%>--%>
    <%
        for(int i = 0,k=-1; i < 10; i++){
    %>

    <tr style="margin-left:30px" height="50">
        <%
            for(int j = 0; j < 18; j++){k++;
                System.out.println(k);
        %>
        <td><button value="myValue"+<%=k%> id="mySeat"+<%=k%> data-toggle="modal" data-target="#myModal"+<%=k%> data-keyboard="false" class="layui-btn layui-btn-primary" width="15px"><i class="layui-icon icon-location"></i></button>
            <!-- Modal-->
            <div id="myModal"+<%=k%> tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                            <h4 id="myModalLabel"+<%=k%> class="modal-title">选座</h4>
                        </div>
                        <h3 class="modal-body">请确认您选择的座位</h3>
                        <h2 class="modal-body" ><span class="sui-text-danger" style="margin-left:140px"><%=(new Double(Math.floor(k%10))).intValue()%>排<%=(k%18+1)%>座<%=k%></span></h2>
                        <div class="modal-footer">
                            <button type="button" data-ok="modal" class="sui-btn btn-primary btn-large">确定</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                        </div>
                    </div>
                </div>
            </div>

        </td>
        <%}%>
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

</div>
</body>
</html>