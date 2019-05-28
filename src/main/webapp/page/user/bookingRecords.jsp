<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><html>
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
<blockquote class="layui-elem-quote"><h1>我的电影</h1></blockquote>
<br><br>
<table class="layui-table" lay-even="" lay-skin="nob">
    <%
        for(int i=0;i<8;i++){
    %>
    <tbody>
    <tr>
        <td><img src="/FilmSystem/img/noseat.png"width=50px height=50px style="margin-left:50px"/></td>
        <td>
            <li><span class="sui-text-xlarge">复仇者联盟（电影名字）</span></li>
            <li><p class="sui-text-large"><span class="sui-text-disabled">2019-05-22 13:00（场次）</span></p></li>
            <li><p class="sui-text-large"><span class="sui-text-disabled">万达影院（影院）</span></p></li>
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
                        <div align="center"><img src="/FilmSystem/img/2.jpg" width=170px height=170px /></div>
                        <br>
                        <div class="sui-msg msg-large msg-block msg-success" align="center">
                            <div class="msg-con">取票号:2374899227744</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-ok="modal" class="sui-btn btn-large btn-danger">确认</button>
                            <button type="button" data-dismiss="modal" class="sui-btn btn-large">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td><button data-toggle="modal" data-target="#myModal" data-keyboard="false"  class="sui-btn btn-bordered btn-large btn-warning">评分</button>
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