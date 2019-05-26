<%@ page import="filmsystem.Model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
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

    </div>
</div>
<div style="padding: 20px; background-color: RGB(80,56,88);">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="color:#ffffff;margin-left:160px">反贪风暴</legend>
    </fieldset>
    <div class="layui-row">
        <div class="layui-col-md4">
            <div class="grid-demo grid-demo-bg1">
                <img src="/FilmSystem/img/2.png"width=220px height=600px style="margin-left:180px">
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="grid-demo">
                <table>
                    <tbody>
                    <tr>
                        <td><p style="color:#ffffff">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:#ffffff">导演</p></td>
                    </tr>

                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>
                    <tr>
                        <td><p style="color:RGB(80,56,88)">导演</p></td>
                    </tr>

                    <tr>
                        <td><button data-toggle="modal" data-target="#myModal" data-keyboard="false" class="layui-btn layui-btn-primary" style="width:180px">☆☆☆☆☆评分</button>
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
                    </tr>

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
                <td><button class="layui-btn layui-btn-danger" style="width:180px">购  买</button></td>
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
    <div class="layui-col-md4 layui-col-md-offset1">
        <div class="grid-demo grid-demo-bg1">balabala</div>
    </div>
</div>
<br><br>
<div class="layui-row">
    <div class="layui-col-md4 layui-col-md-offset1" >
        <div class="grid-demo grid-demo-bg1"><h2><span class="sui-text-danger">热门评论</span></h2></div>
    </div>
    <div class="layui-col-md1 layui-col-md-offset3" >
        <div class="grid-demo grid-demo-bg1"><button class="layui-btn layui-btn-danger layui-btn-radius" data-toggle="modal" data-target="#myModal2" data-keyboard="false">写评论</button></div>
        <div id="myModal2" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                        <h4 id="myModalLabel2" class="modal-title">写评论</h4>
                    </div>
                    <div id="test7" style="margin-left:150px"></div>
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
    for(int i=0;i<10;i++){
%>
<div class="layui-row layui-col-md-offset1">

    <div class="layui-col-md1">
        <div class="grid-demo grid-demo-bg1"><img src="/FilmSystem/img/2.png"width=60px height=60px></div>
    </div>
    <div class="layui-col-md1">
        <li><h3>balabalab</h3></li>
        <li><p class="sui-text-large"><span class="sui-text-disabled">balabalab</span></p></li>
    </div>
</div>
<br>
<div class="layui-row">
    <div class="layui-col-md6 layui-col-md-offset2" >
        <div class="grid-demo grid-demo-bg1" >balabala</div>
    </div>
</div>
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

</body>
</html>