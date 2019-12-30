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
    
    <title>联动查询</title>
    
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
	int tg1=-1, tg2=-1,tg3=-1;
	if(request.getParameter("tg")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg"));
	if(request.getParameter("tg1")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg1"));
	if(request.getParameter("tg2")!=null)
		tg2 = Integer.parseInt(request.getParameter("tg2"));
	if(request.getParameter("tg3")!=null)
		tg3 = Integer.parseInt(request.getParameter("tg3"));
	//String skey = request.getParameter("skey");
	int curPage = 1;
	if(request.getParameter("curPage")!=null)
		curPage = Integer.parseInt(request.getParameter("curPage"));
	String skey1 = "",skey2="",skey3="";
	if(request.getParameter("skey")!=null)
		skey1 = request.getParameter("skey");
	if(request.getParameter("skey1")!=null)
		skey1 = request.getParameter("skey1");
	if(request.getParameter("skey2")!=null)
		skey2 = request.getParameter("skey2");
	if(request.getParameter("skey3")!=null)
		skey3 = request.getParameter("skey3");
	int totalPage = 10;
%>
<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a id="showLabel">事件列表</a></li>
	      <li><a href="javascript:GetEvents(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>)">刷新</a></li>
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
      <ul class="pagination">
      	<li><a href="javascript:FirstPage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>')" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">首页</a></li>
		<li><a></a></li>
		<li><a href="javascript:PrePage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">上页</a></li>
		<li><a href="javascript:NextPage(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">下页</a></li>
		</ul>
     </div>
	<script type="text/javascript">
	$(document).ready(function(){
		GetEvents(<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>, '<%=skey3 %>', <%=curPage %>);
		GetUnionData(<%=tg1 %>, '<%=skey1%>','<%=skey2%>','<%=skey3%>');
	});
	function GetUnionData(tg1, skey1,skey2,skey3){
		$('#fsn').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		$('#kms').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		$('#lims').html('<p class="f-text1"> 数据加载中，请稍后...</p>');
		var url = "<%=basePath%>" + "GetUnionResultServlet";
		$.ajax({
			type: "post",
			url: url,
			data:{ tg1:tg1, skey1:skey1,skey2:skey2,skey3:skey3,curPage:1, pageSize:10 },
			dataType:"json",
			success:function(data){
				$('#fsn').html(FsnHtml(data[0]['fsnlist']));
				$('#kms').html(KmsHtml(data[0]['kmslist']));
				$('#lims').html(LimsHtml(data[0]['limslist']));
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert('test ' + textStatus);
            },
            complete: function(XMLHttpRequest, textStatus) {
                this; // 调用本次AJAX请求时传递的options参数
            }
		});
	}
	function ParameterUrl(type){
		var url ='testproductlist.jsp?type=' + type;
		if(<%=tg1 %> >= 0)
			url+= '&tg1='+<%=tg1 %>+'&skey1=<%=skey1 %>';
		if(<%=tg2 %> >= 0)
			url+= '&tg2='+<%=tg2 %>+'&skey2=<%=skey2 %>';
		if(<%=tg3 %> >= 0)
			url+= '&tg3='+<%=tg3 %>+'&skey3=<%=skey3 %>';
		return url;
	}
	function FsnHtml(fsnlist){
		var html = '';
		if(fsnlist.length != 0){
			$.each(fsnlist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<div class="post-meta"> <a href="union.jsp?tg=0&skey='+fsn['productName']+'" class="comments">' 
					+ (i+1)+ '、 ' + fsn['productName'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">检测类型：'+ fsn['testType']+'</span></div>';
				html += '<div class="post-meta"> <a href="union.jsp?tg=2&skey='+fsn['category']+'" class="comments">所属类别：' 
					+ fsn['category'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">规格：'+ fsn['format']+'</span></div>';
				html += '<div class="post-meta"><span class="author">生产日期：' + fsn['production_time'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">保质期：' + fsn['expirationDate'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">生产厂家：' + fsn['producer_name'] + '</span></div>';
				html += '<div class="get_btn1"><a href="producttestdata.jsp?type=0&pid='
					 + fsn['product_id'] +'">查看详情</a></div>';
				html += '</div><div class="clear"></div></ul>';
			});
			html+='<a href="'+ ParameterUrl(0)+ '" class="link">查看全部数据</a>';
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
	function KmsHtml(kmslist){
		var html = '';
		if(kmslist.length != 0){
			$.each(kmslist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<p><span>'	+ (i+1)+ '、 ' + fsn['serial_Number'] + '</span></p>';
				html += '<div class="post-meta"> <a class="comments">' 
					+ fsn['last_modified_time'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">法规名称：'+fsn['serial_Number']+'_' + fsn['name'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">制定时间：' + fsn['create_time'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">更新时间：'+ fsn['last_modified_time']+'</span></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=0&skey='+fsn['name']+'" class="author">检测对象：' + fsn['name'] + '</a></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=2&skey='+fsn['category']+'" class="author">所属分类：'+ fsn['category']+'</a></div>';
				html += '<div class="get_btn1"><a href="producttestdata.jsp?type=1&pid='
					 + fsn['standard_id'] + '" >查看详情</a></div>';
				html += '</div><div class="clear"></div></ul>';
			});
			html+='<a href="'+ ParameterUrl(1)+ '" class="link">查看全部数据</a>';
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
	function LimsHtml(limslist){
		var html = '';
		if(limslist.length != 0){
			$.each(limslist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<p><span>' + (i+1)+ '、 ' + fsn['sampleNo'] + '</span></p>';
				html += '<div class="post-meta"> <a class="comments">' 
					+ fsn['create_time'] + '</a></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=0&skey='+fsn['sample_Name']+'" class="author">产品名称：' + fsn['sample_Name'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">产品状态：' + fsn['status'] + '</span></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=2&skey='+fsn['category']+'" class="author">食品类别：'+ fsn['category']+'</a></div>';
				html += '<div class="post-meta"><span class="author">工作单号：'+ fsn['work_SheetNo']+'</span></div>';
				html += '<div class="post-meta"><span class="author">委托单位：'+ fsn['clent']+'</span></div>';
				html += '<div class="get_btn1"><a href="producttestdata.jsp?type=2&pid='
					 + fsn['sample_id'] + '">查看详情</a></div>';
				html += '</div><div class="clear"></div></ul>';
			});
			html+='<a href="'+ ParameterUrl(2)+ '" class="link">查看全部数据</a>';
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
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
	</script>      

      <div class="bsidebar span_1_of_blog">
      <div class="sap_tabs">
          <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
            <ul class="resp-tabs-list">
              <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>检测数据</span></li>
              <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>法律法规</span></li>
              <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>品控数据</span></li>
              <div class="clear"></div>
            </ul>
            <div class="resp-tabs-container">
              <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                <div class="facts" id="fsn">
                  <ul class="tab-left">
                    <div class="tab-text">
                      <p><a href="#">Lorem ipsum dolor sit amet nibh.</a></p>
                      <div class="post-meta"> <img src="images/comment.png" alt=""><a href="#" class="comments"> 3 Comments</a> <span class="author">Author: <a href="#">Lorem</a></span> </div>
                      <a href="#" class="link1">Read More</a> </div>
                    <div class="clear"></div>
                  </ul>
                </div>
              </div>
              <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                <div class="facts" id="kms">
                 
                </div>
              </div>
              <div class="tab-3 resp-tab-content" aria-labelledby="tab_item-2">
                <div class="facts" id="lims">
                </div>
              </div>
            </div>
          </div>
        </div>
      

      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>
