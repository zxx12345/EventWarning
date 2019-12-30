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
    
    <title>报道信息列表</title>
    
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
  
  </head>
  
<body>
	<jsp:include   page="PageTemplate/menu_t.jsp"/>

<% 
	int eid = 0;
	if(request.getParameter("eid")!=null)
		eid = Integer.parseInt(request.getParameter("eid"));
	//String skey = request.getParameter("skey");
	int curPage = 1;
	if(request.getParameter("curPage")!=null)
		curPage = Integer.parseInt(request.getParameter("curPage"));
%>
<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a id="showLabel">报道详情</a></li>
	      <li><a id="curPage">1</a></li>
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
      <ul class="pagination">
      	<li><a href="javascript:FirstPage(<%=eid %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">首页</a></li>
		<li><a href="javascript:PrePage(<%=eid %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">上页</a></li>
		<li><a href="javascript:NextPage(<%=eid %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">下页</a></li>
		</ul>
     </div>
	<script type="text/javascript">
	$(document).ready(function(){
		GetEvents(<%=eid%>,<%=curPage%>);
		GetKeyWordList(10);
		GetCategoryList(10);
	});
	function FirstPage(eid){
		document.getElementById('curPage').innerHTML = (1).toString();
		GetEvents(eid,1);
	}
	function NextPage(eid){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		document.getElementById('curPage').innerHTML = (curPage+1).toString();
		GetEvents(eid,curPage+1);
	}
	function PrePage(eid,curPage){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		if(curPage<=1){
			alert('已经是第一页了');
			return ;
		}
		document.getElementById('curPage').innerHTML = (curPage-1).toString();
		GetEvents(eid,curPage-1);
	}
	function GetEvents(eid, curPage){
		$('#eventlist').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
    
		var url = "<%=basePath%>" + "GetArticlesServlet";
		var totalPage;
		$.ajax({
			type : "post",
			url : url,
			data:{eid:eid, curPage:curPage},
			dataType:"json",
			success:function(data){
				var html = ''; 
                var eventlist = data[0]['articles'];
                if(eventlist.length != 0){
	                curPage = data[0]['curPage'];
	                $.each(eventlist, function(commentIndex, article){
	                	var event = article;
	                    html += '<div class="blog-left">';
						html += '<div class="item_published"> <span>' + (commentIndex+1) + '</span></div>';
						html += '<div class="item_head">';
						html += '<h5 class="item_title"><a>';
						html += event['article_title'];
						html += '</a></h5></div><div class="info"><dl class="info_dl"><dd><div class="item-head">';
						html += event['extracted_time']+'</a></div></dd><div class="clear"></div></dl></div>';
						html += '<p class="f-text1">'+event['article_abstract']+'</p>';
						html += '<a href="'+event['article_url']+'" class="link"  target="_BLANK">追溯源文</a></div>';
	                });
	                $('#eventlist').html(html);
	            }
	            else{
	            	if(curPage>1){
	            		PrePage(eid,curPage);
	            		alert('已经是最后一页了');
	            	}
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
					html += '<li><a href="javascript:GetEvents(2,1,\''+data[i]+'\')"';
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
					html += '<li><a href="javascript:GetEvents(4,1,\''+data[i]+'\')"';
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

<div class="footer">
  <div class="wrap">
    <div class="footer-bottom">
      <div class="copy">
        <p>© 2015 版权所有 <a href="http://www.buct.edu.cn/" target="_blank" title="北京化工大学">北京化工大学</a> - 研究机构： <a href="http://ielab.buct.edu.cn/" title="北化智能工程研究室" target="_blank">智能工程研究室</a></p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
</body>
</body>
</html>
