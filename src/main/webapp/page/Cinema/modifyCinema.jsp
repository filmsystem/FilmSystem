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
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui.min.css" rel="stylesheet">
  <link href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css" rel="stylesheet">
  <%--<link href="/FilmSystem/image/favicon.ico" rel="shortcut icon">--%>
  <link href="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js" rel="stylesheet">
  <link href="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js" rel="stylesheet">
  <script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
  <link rel="stylesheet" href="/FilmSystem/layui/css/layui.css">
  <link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css" >
    </head>

	<body>
	
     
<div class="sui-navbar">
  <div class="navbar-inner"><a href="#" class="sui-brand">SHU-MOVIE</a>
    <ul class="sui-nav">

      <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影院管理      <i class="caret"></i></a>
        <ul role="menu" class="sui-dropdown-menu">
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">增加影院</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">修改影院</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">删除影院</a></li>
        </ul>
      </li>
      <li></li>
      <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">影片管理      <i class="caret"></i></a>
        <ul role="menu" class="sui-dropdown-menu">
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">增加影片</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">修改影片</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">删除影片</a></li>
        </ul>
      </li>
      <li></li>
      
      <li class="sui-dropdown"><a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle">管理员      <i class="caret"></i></a>
        <ul role="menu" class="sui-dropdown-menu">
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">修改个人信息</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">添加管理员</a></li>
          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">删除管理员</a></li>
        </ul>
      </li>
      <li></li>
      
    </ul>
    
    </div>
    </div>
    
   
  		
  

   <table class="layui-table" lay-data="{url:'http:://localhost:8080/FilmSystem/api/administrator', id:'test3'}" lay-filter="test3">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox'}">ID</th>
      <th lay-data="{field:'id', width:80, sort: true}">ID</th>
      <th lay-data="{field:'username', width:120, sort: true, edit: 'text'}">用户名</th>
      <%--<th lay-data="{field:'email', edit: 'text', minWidth: 150}">邮箱</th>--%>
      <%--<th lay-data="{field:'sex', width:80, edit: 'text'}">性别</th>--%>
      <%--<th lay-data="{field:'city', edit: 'text', minWidth: 100}">城市</th>--%>
      <%--<th lay-data="{field:'experience', sort: true, edit: 'text'}">积分</th>--%>
    </tr>
  </thead>
</table>
              
          

<script src="/FilmSystem/layui/layui.js" charset="utf-8"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //监听单元格编辑
  table.on('edit(test3)', function(obj){
    var value = obj.value //得到修改后的值
    ,data = obj.data //得到所在行所有键值
    ,field = obj.field; //得到字段
    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
  });
});
</script>
  			
	</body>
</html>