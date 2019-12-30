<%@page import="com.eventwarning.dbImpl.DBOperation"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>联动查询</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
	<style>
		.yongyin {
			width:100px;
			text-align:center;
			line-height:100%;
			padding:0.3em;
			font:16px Arial,sans-serif bold;
			font-style:normal;
			text-decoration:none;
			margin:2px;
			vertical-align:text-bottom;
			zoom:1;
			outline:none;
			font-size-adjust:none;
			font-stretch:normal;
			border-radius:50px;
			box-shadow:0px 1px 2px rgba(0,0,0,0.2);
			text-shadow:0px 1px 1px rgba(0,0,0,0.3);
			color:#fefee9;
			border:0.2px solid #2299ff;
			background-repeat:repeat;
			background-size:auto;
			background-origin:padding-box;
			background-clip:padding-box;
			background-color:#3399ff;
			background: linear-gradient(to bottom, #eeeff9 0%,#3399ff 100%);
		}

		.yongyin:hover {
			background: #07f3ed;
		}
	</style>
</head>
<body>
<%
	//int eventNum9 = (DBOperation.GetEventList("2015", "09")).size();
	//int eventNum10 = (DBOperation.GetEventList("2015", "10")).size();
 %>
	<jsp:include   page="PageTemplate/menu_t.jsp"/>

<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a>组合查询</a></li>
	    </ul>
  	<div class="content-box-right">
      <div class="reservation"></div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<script type="text/javascript">
 	$(document).ready(function(){
		AddSearch();
	});
	function AddSearch(){
		var searchNum = parseInt(document.getElementById('searchNum').innerHTML, 10);
		if(searchNum >= 3){
			alert('最多设置3个查询条件');
			return ;	
		}
		var key = '';
		for(var i=0;i<3;i++){
			key = 'search' + (i+1);
			if(i>searchNum)
				document.getElementById(key).style.display = 'none';
			else
				document.getElementById(key).style.display = '';
		}	
		document.getElementById('searchNum').innerHTML = (searchNum+1).toString(); 	
	}
	function Search(type){
		var searchNum = parseInt(document.getElementById('searchNum').innerHTML, 10);
		var url;
		if(type==1)
			url = 'eventlist.jsp?';
		else
			url = 'union.jsp?';
		for(var i=1; i<=searchNum; i++){
			var key = 'tg'+i;
			var value = $('#'+key +' option:selected').val();
			url += key + '=' + value + '&';
			key = 'skey'+i;
			value = document.getElementById(''+key).value;
			if(value=='Search....')
				value='';
			url += key + '=' + value + '&';
		}
		window.location.href=url;
	}
</script>
<div class="main">
  <div class="wrap">
	<div class="section group">
  		 <div class="cont span_1_of_blog">
	     	<div id="eventsbar" height="400"></div>
	     </div>
  			<div class="cont span_1_of_blog" >
	  			<ul>
		      		<li><a href="javascript:AddSearch(1);">增加检索条件</a></li>
		      		<li><a id="searchNum" hidden="true">0</a></li>
		     	</ul>
	    	<div id="searchs">
    		<div class="search" id="search1">
	          <form>
		        <select id="tg1">
	            <option value="0">食品</option>
	            <option value="1">地区</option>
	            <option value="2">类别</option>
		        </select>
	            <input type="text" id="skey1" value="Search...." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
	          </form>
        	</div>
    		<div class="search" id="search2">
	          <form>
		        <select id="tg2">
	            <option value="0">食品</option>
	            <option value="1">地区</option>
	            <option value="2">类别</option>
		        </select>
	            <input type="text" id="skey2" value="Search...." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
	          </form>
        	</div>
    		<div class="search" id="search3">
	          <form>
		        <select id="tg3">
	            <option value="0">食品</option>
	            <option value="1">地区</option>
	            <option value="2">类别</option>
		        </select>
	            <input type="text" id="skey3" value="Search...." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
	          </form>
        	</div>
        	</div>
        	<div class="buttons">
	          <button style="width:80px; height:40px; "
	          	type="button" class="yongyin" onclick="javascript:Search(0);">联动查询</button>
        	</div>
        	<div class="buttons">
	          <button style="width:80px; height:40px;"
				type="button" class="yongyin" onclick="javascript:Search(1);">事件查询</button>
        	</div>
  		</div>
	</div>
    <div class="clear"></div>
	</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>
	
</body>
</html>