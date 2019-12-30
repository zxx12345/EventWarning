<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.eventwarning.bean.*" %>
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
    <base href="<%=basePath%>">
    
    <title>事件列表</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
	<script src="js/jquery.min.js"></script>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
	</script>
	  <link style="text/css" rel="stylesheet" href="css/bootstrap.css">
	  <!--导入基本样式的压缩-->
	  <link style="text/css" rel="stylesheet" href="css/bootstrap.min.css">
	  <!--导入主题样式  注意：顺序 不可变-->
	  <link style="text/css" rel="stylesheet" href="css/bootstrap-theme.css">
  </head>
  
<body>
	<jsp:include   page="PageTemplate/menu_t.jsp"/>
	
<% 
	int tg1 = 0, tg2 = 0, tg3 = 0;
	if(request.getParameter("tg1")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg1"));
	if(request.getParameter("tg")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg"));
	if(request.getParameter("tg2")!=null)
		tg2 = Integer.parseInt(request.getParameter("tg2"));
	if(request.getParameter("tg3")!=null)
		tg3 = Integer.parseInt(request.getParameter("tg3"));
	//String skey = request.getParameter("skey");
	int curPage = 1;
	if(request.getParameter("curPage")!=null)
		curPage = Integer.parseInt(request.getParameter("curPage"));
	String skey1 = "", skey2="", skey3="";
	if(request.getParameter("skey1")!=null)
		skey1 = request.getParameter("skey1");
	if(request.getParameter("skey")!=null)
		skey1 = request.getParameter("skey");
	if(request.getParameter("skey2")!=null)
		skey2 = request.getParameter("skey2");
	if(request.getParameter("skey3")!=null)
		skey3 = request.getParameter("skey3");
%>
<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a id="showLabel">事件中心</a></li>
	      <li><a href="javascript:GetEvents(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>',<%=curPage %>)">刷新</a></li>
	      <li><a id="curPage" hidden="true">1</a></li>
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
      <div class="cont span_2_of_blog" >
      <div id="eventlist"></div>
		  <ul class="nav nav-tabs">
			  <li><a href="javascript:FirstPage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>')" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1" data-toggle=tab">首页</a></li>
			  <li><a href="javascript:PrePage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1" data-toggle=tab">上页</a></li>
			  <li><a href="javascript:NextPage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1" data-toggle=tab">下页</a></li>
		  </ul>
     </div>
	<script type="text/javascript">
	$(document).ready(function(){
		GetEvents(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>);
		GetKeyWordList(10);
		GetCategoryList(10);
	});
	function FirstPage(tg1, skey1, tg2, skey2,tg3, skey3){
		document.getElementById('curPage').innerHTML = (1).toString();
		GetEvents(tg1, skey1, tg2, skey2,tg3, skey3,1);
	}
	function NextPage(tg1, skey1, tg2, skey2,tg3, skey3){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		document.getElementById('curPage').innerHTML = (curPage+1).toString();
		GetEvents(tg1, skey1, tg2, skey2,tg3, skey3,curPage+1);
	}
	function PrePage(tg1, skey1, tg2, skey2,tg3, skey3,curPage){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		if(curPage<=1){
			alert('已经是第一页了');
			return ;
		}
		document.getElementById('curPage').innerHTML = (curPage-1).toString();
		GetEvents(tg1, skey1, tg2, skey2,tg3, skey3,curPage-1);
	}
	function GetEvents(tg1, skey1,tg2, skey2,tg3, skey3, curPage){
		$('#eventlist').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		var text = '';
		if(tg1>0)
			text += skey1 + ' ';
		if(tg2>0)
			text += skey2 + ' ';
		if(tg3>0)
			text += skey3 + ' ';
		if(text=='')
			text = '事件列表'
		$('#showLabel').html(text);      
		var url = "<%=basePath%>" + "GetEventServlet";
		$.ajax({
			type : "post",
			url : url,
			data:{tg1:tg1, skey1:skey1, tg2:tg2, skey2:skey2,tg3:tg3, skey3:skey3,curPage:curPage},
			dataType:"json",
			success:function(data){
				var html = ''; 
                var eventlist = data[0]['eventlist'];
                if(eventlist.length != 0){
	                curPage = data[0]['curPage'];
	                $.each(eventlist, function(commentIndex, comment){
	                	var event = comment;
	                    html += '<div class="blog-left">';
						html += '<div class="item_published"> <span>' + event['eventID'] + '</span></div>';
						html += '<div class="item_head">';
						html += '<h5 class="item_title"> <a href="EventServlet?eid=' + event['eventID'] + '">';
						html += '[类别：'+ event['category'] +'] ' + event['location'];
						html += '</a></h5></div><div class="info"><dl class="info_dl"><dd><div class="item-head">';
						html += event['startTime']+'</a></div></dd><div class="clear"></div></dl></div>';
						if(event['centuralArticle'])
							html += '<p class="f-text1">'+event['centuralArticle']['article_abstract']+'</p>';
						else
							html += '<p class="f-text1">暂无详情</p>';
						html += '<a href="EventServlet?eid='+event['eventID']+'" class="link">事件追踪</a></div>';
	                });
	                $('#eventlist').html(html);
	            }
	            else{
	            	$('#eventlist').html('<p class="f-text1">无相关事件数据</p>');
	            }
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            },
            complete: function(XMLHttpRequest, textStatus) {
                this; // 调用本次AJAX请求时传递的options参数
            }
		});
	};
	function GetKeyWordList(num){
		$('#keywordlist').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		$.ajax({
			type:"post",
			url:"GetKeyWordServlet",
			data:{num:num},
			dataType:"json",
			success:function(data){
				var html = '';
				for(var i=0; i<num; i++){
					html += '<li><a href="javascript:GetEvents(3,\''+data[i]+'\',0,\'\',0,\'\',1)"';
					html += '>' + data[i] + '</a></li>';
				}
				$('#keywordlist').html(html);
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
				for(var i=0; i<num; i++){
					html += '<li><a href="javascript:GetEvents(2,\''+data[i]+'\',0,\'\',0,\'\',1)"';
					html += '>' + (i+1) +'. '+ data[i] + '</a></li>';
				}
				$('#categorylist').html(html);
			}
		});
	}
	</script>      

      <div class="bsidebar span_1_of_blog">
      
		<h2 class="head4">热点词</h2>
        <ul class="tags" id="keywordlist">
        </ul>
        <div class="clear"></div>
		<br> <br>            
        <h2 class="head4">热门事件类别</h2>
        <ul class="list1" id="categorylist">
        </ul>

      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>
	
</body>
</html>
