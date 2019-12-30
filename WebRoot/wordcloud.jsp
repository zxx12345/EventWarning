<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.eventwarning.bean.*" %>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>热点词云</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">

<link rel="stylesheet" type="text/css" href="./css/jqcloud.css" />

</head>
<body>
	<jsp:include   page="PageTemplate/menu_t.jsp"/>

<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a>词性类别</a></li>
	      <li><a href="javascript:drawword(0)">不限</a></li>
	    </ul>
	    <ul class="events">
	      <li><a href="javascript:drawword(0)">地区</a></li>
	      <li><a href="javascript:drawword(1)">食品</a></li>
	      <li><a href="javascript:drawword(2)">情感</a></li>
	    </ul>
  	<div class="content-box-right">
      <div class="reservation"></div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<div class="main">
  <div class="wrap">
  
	<div class="section group">
      <div class="cont span_2_of_blog"  id="wordcloud" style="height:400px"></div>
  	  <div class="bsidebar span_1_of_blog">        
        <h2 class="head4">相关事件</h2>
        <ul class="list1" id="eventlist">
        </ul>

      </div>
  	  
  	</div>  
	<div class="clear"></div>
 </div>
</div>
<%
	int tg=-1;
	if(request.getParameter("tg")!=null)
		tg = Integer.parseInt(request.getParameter("tg"));
 %>

<script type="text/javascript" src="./js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="./js/jqcloud-1.0.4.js"></script>
<script type="text/javascript">
    $(document).ready(drawword(<%=tg %>));
    function drawword(tg) {
    	$('#wordcloud').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
    	$('#eventlist').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		var url = "<%=basePath%>" + "WordCloudServlet";
	    $.ajax( { //ajax异步获取后台动态数据
	        type : "POST",
	        url : url,
	        data:{tg:tg},
	        dataType : "json",//此处要设置成json 
	        success : function(result){
	        	var word_array = result[0]['wordlist'];
	        	var id_array = result[0]['ids'];
	        	var key_array = result[0]['keys'];
	        	document.getElementById("wordcloud").innerHTML='';
	        	$("#wordcloud").jQCloud(word_array,{
            				shape :"rectangular", //形状样式
	        	});
	        	var html = '';
	        	for(var i=0; i<id_array.length && i<10; i++){
	        		html += '<li><a href=\'EventServlet?eid='+id_array[i];
	        		html += '\'>【'+word_array[i]['text']+'】'+key_array[i]+'</a></li>';
	        	}
	        	$('#eventlist').html(html);
	        }
	    });
	};
</script>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>