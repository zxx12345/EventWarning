<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML>
<html>
<head>
<title>热点地图</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
</head>

<%
	//String hotmap = (String)request.getAttribute("hotmapoption");
 %>

<body>

	<jsp:include   page="PageTemplate/menu_t.jsp"/>

<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active" id="skeylabel"><a>热点事件地理位置分布</a></li>
	      <li id="urllabel"><a></a></li>
	    </ul>
    <div class="clear"><script type="text/javascript" src="./js/esl.js"></script></div>
  </div>
</div>

<div class="main">
  <div class="wrap">
  	<div class="section group">
      <div class="cont span_2_of_blog" >
     	 <div id="hoteventsmap" style="height:400px;"></div>
      </div>
      <div class="bsidebar span_1_of_blog">
      	<h2 class="head4">选择数据源类别</h2>
        <ul class="list1" id="categorylist">
        </ul>
      </div>
      <div class="clear"></div>
      </div>    
  </div>
</div>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		GetCategoryList(10);
	});
// 路径配置
require.config({
     paths: {
         'echarts' : '.js/echarts',
         'echarts/chart/map' : './js/echarts-map',
     }
});
var myChart;        
  // 使用
  require(
      [
          'echarts',
          'echarts/chart/map', // 使用柱状图就加载bar模块，按需加
          
      ],
	 function (ec){
		// 基于准备好的dom，初始化echarts图表
		myChart = ec.init(document.getElementById('hoteventsmap'));
		drawMap('');
	}
);
	function drawMap(skey){
		$('#skeylabel').html('<p class="f-text1"> 数据加载中...</p>');
		var option, province = '';
		$.ajax({
				type:"post",
				url:"HotMapServlet",
				data:{skey:skey},
				dataType:"json",
				success:function(data){
					option = data;//绑定鼠标点击事件
					var eConfig = require('echarts/config');
					myChart.on(eConfig.EVENT.MAP_SELECTED, function(param){
						var selected = param.selected;
						var mapSeries = option.series[0];
						var name, location='null';
						for(var i=0,l=mapSeries.data.length; i<l; i++){
							name = mapSeries.data[i].name;
							mapSeries.data[i].selected = selected[name];
							if(selected[name]){
								url = 'eventlist.jsp?tg1=1&skey1='+name;
								if(skey!='' && skey!='全部类别')
									url +='&tg2=2&skey2='+skey;
								$('#urllabel').html('<a href='+url+'>全省</a>');
								if(option.series[0].mapType == 'china')
									option.series[0].mapType = name;
								else
									location = name;
							}
						}
						var url = '';
						if(location != 'null'){
							url += 'eventlist.jsp?tg=1&skey='+location;
							if(skey != '' && skey!='全部类别')
								url += '&tg2=2&skey2='+skey;
							window.location.href = url;
						}
						myChart.setOption(option, true);
					});
					// 为echarts对象加载数据 
					myChart.setOption(option);
					if(skey=='')
						skey = '全部类别';
					$('#skeylabel').html('<p class="f-text1">'+skey+'</p>');
				}
		});
	}
	
function GetCategoryList(num){
	$('#categorylist').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
	$.ajax({
		type:"post",
		url:"GetCategoryServlet",
		data:{num:num},
		dataType:"json",
		success:function(data){
			var html = '';
			html += '<li><a href="javascript:drawMap(\'\')"';
			html += '><B>0. 全部类别 </B></a></li>';
			for(var i=0; i<num; i++){
				var skeys = data[i].split(',');
				var skey = skeys[0];
				if(skeys.length>1)
					skey = skeys[1];
				html += '<li><a href="javascript:drawMap(\'' + skey +'\')"';
				html += '>' + (i+1) +'. '+ skey + '</a></li>';
			}
			$('#categorylist').html(html);
		}
	});
}
</script>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>
	
</body>
</html>