<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>法规数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/gridstyle.css" rel="stylesheet" type="text/css" media="all" />
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

<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a>数据列表</a></li>
	      <li><a id="curPage" hidden="true">1</a></li>
	    </ul>
  	<div class="content-box-right">
      <div class="reservation"></div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<%
	int pid = 0, pageSize = 10, type = 0;
	if(request.getParameter("pid")!=null)
		pid = Integer.parseInt(request.getParameter("pid"));
	if(request.getParameter("type")!=null)
		type = Integer.parseInt(request.getParameter("type"));
 %>
 <script type="text/javascript">
	$(document).ready(function(){
		FirstPage(<%=type %>, <%=pid %>,<%=pageSize %>);
	});
	function FirstPage(type, pid, pageSize){
		document.getElementById('curPage').innerHTML = (1).toString();
		GetData(type, pid,1, pageSize)
	}
	function NextPage(type, pid, pageSize){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		document.getElementById('curPage').innerHTML = (curPage+1).toString();
		GetData(type, pid, curPage+1, pageSize);
	}
	function PrePage(type, pid, pageSize){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		if(curPage<=1){
			alert('已经是第一页了');
			return ;
		}
		document.getElementById('curPage').innerHTML = (curPage-1).toString();
		GetData(type, pid,curPage-1, pageSize);
	}
	function KMSHtml(kmslist){
		var html = '<thead><tr><th>序号</th> <th>检测方法</th><th>检测项</th>'
					+'<th>状态</th><th>标准值</th>'
					+ '</tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="testdetail.jsp?type=<%=type%>&id='+kms['id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['amName'] +'</td>';
            	html += '<td>' + kms['itemName'] +'</td>';
            	html += '<td>' + kms['state'] +'</td>';
            	html += '<td>';
            	if(kms['boolean_value']!=null &&kms['boolean_value']!=''){
            		html += +kms['relName']+' '+kms['boolean_value'];
            		if(kms['vuName']!='' && kms['vuName']!='无')
			 			html += ' ' + kms['vuName'];
            	}
            	else if(kms['text_value']!=null &&kms['text_value']!='')
					html += kms['text_value'];
				else{
					html += kms['double_low_value']
						+' ~ ' + kms['double_high_value'];
					 if(kms['vuName']!='' || kms['vuName']!='无')
					 	html += ' ' + kms['vuName']; 
				}
            	html += '</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function FSNHtml(kmslist){
		var html = '<thead><tr><th>序号</th><th>检测项</th>'
					+'<th>标准号</th><th>标准值值</th><th>检测值</th><th>判定结果</th><th>检测时间</th>'
					+ '</tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="testdetail.jsp?type=<%=type%>&id='+kms['id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['name'] +'</td>';
            	html += '<td>' + kms['regularity'] +'</td>';
            	html += '<td>' + kms['techIndicator'] +''+ kms['unit'] +'</td>';
            	html += '<td>' + kms['result'] +''+ kms['unit'] +'</td>';
            	html += '<td>' + kms['assessment'] +'</td>';
            	html += '<td>' + kms['test_date'] +'</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function LIMSHtml(kmslist){
		var html = '<thead><tr><th>序号</th> <th>检测项</th><th>检测要求</th><th>检测结果</th><th>判定结果</th>'
					+'<th>检测时间</th>'
					+ '</tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="testdetail.jsp?type=<%=type%>&id='+kms['id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['test_itemname'] +'</td>';
            	html += '<td>' + kms['qualification'] +'</td>';
            	html += '<td>' + kms['value_result'] +'</td>';
            	html += '<td>' + kms['individual_evaluation'] +'</td>';
            	html += '<td>' + kms['end_time'] +'</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function GetData(type, pid, curpage, pageSize){
		var url = "<%=basePath%>" + "GetDataServlet";
		$.ajax({
			type : "post",
			url : url,
			data:{type:type, pid:pid, curpage:curpage, pageSize:pageSize},
			dataType:"json",
			success:function(data){
				var datalist;
				var fsnhtml;
				switch(type){
					case 0:
						FSNHtml(data[0]['fsnlist'])
						datalist = data[0]['fsnlist'];
						fsnhtml = FsnHtml(data[0]['fsnlist']);
						break;
					case 1:
						KMSHtml(data[0]['kmslist']);
						datalist = data[0]['kmslist'];
						fsnhtml = KmsHtml(data[0]['kmslist']);
						break;
					case 2:
						LIMSHtml(data[0]['limslist'])
						datalist = data[0]['limslist'];
						fsnhtml = LimsHtml(data[0]['limslist']);
						break;
				}
                if(datalist.length==0 && curpage>1){
                	alert('已经是最后一页');
                	PrePage(type, pid, pageSize);
                }
                else
					$('#fsn').html(fsnhtml);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            },
            complete: function(XMLHttpRequest, textStatus) {
                this; // 调用本次AJAX请求时传递的options参数
            }
		});
	}
		function FsnHtml(fsnlist){
		var html = '';
		if(fsnlist.length != 0){
			var i=0;
			var fsn = fsnlist[0];
			//$.each(fsnlist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<p> <img src="images/comment.png" alt="">' 
					+ ' <a href="producttestdata.jsp?type=0&pid='+fsn['product_id']+'">' 
					+ (i+1)+ ' ' + fsn['product_id'] + '</a></p>';
				html += '<div class="post-meta"> <a href="union.jsp?tg=0&skey='+fsn['productName']+'" class="comments">食品名称：' 
					+ fsn['productName'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">检测类型：'+ fsn['testType']+'</span></div>';
				html += '<div class="post-meta"> <a href="union.jsp?tg=2&skey='+fsn['category']+'" class="comments">所属类别：' 
					+ fsn['category'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">规格：'+ fsn['format']+'</span></div>';
				html += '<div class="post-meta"><span class="author">生产日期：' + fsn['production_time'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">保质期：' + fsn['expirationDate'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">生产厂家：' + fsn['producer_name'] + '</span></div>';
				html += '</div><div class="clear"></div></ul>';
			//});
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
	function KmsHtml(kmslist){
		var html = '';
		if(kmslist.length != 0){
			var i=0;
			var fsn = kmslist[0];
			//$.each(kmslist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<p> <img src="images/comment.png" alt="">' 
					+ ' <a href="producttestdata.jsp?type=1&pid='+fsn['standard_id']+'">' 
					+ (i+1)+ ' ' + fsn['standard_id'] + '</a></p>';
				html += '<div class="post-meta"> <a class="comments">' 
					+ fsn['last_modified_time'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">法规名称：'+fsn['serial_Number']+'_' + fsn['name'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">制定时间：' + fsn['create_time'] + '</span></div>';
				html += '<div class="post-meta"><span class="author">更新时间：'+ fsn['last_modified_time']+'</span></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=0&skey='+fsn['name']+'" class="author">检测对象：' + fsn['name'] + '</a></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=2&skey='+fsn['category']+'" class="author">所属分类：'+ fsn['category']+'</a></div>';
				html += '</div><div class="clear"></div></ul>';
			//});
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
	function LimsHtml(limslist){
		var html = '';
		if(limslist.length != 0){
			var i=0;
			var fsn = limslist[0];
			//$.each(limslist, function(i, fsn){
				html += '<ul class="tab-left">';
				html += '<div class="tab-text">';
				html += '<p> <img src="images/comment.png" alt="">' 
					+ ' <a href="producttestdata.jsp?type=2&pid='+fsn['sample_id']+'">' 
					+ (i+1)+ ' ' + fsn['sample_id'] + '</a></p>';
				html += '<div class="post-meta"> <a class="comments">' 
					+ fsn['create_time'] + '</a></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=0&skey='+fsn['sample_Name']+'" class="author">产品名称：' + fsn['sample_Name'] + '</a></div>';
				html += '<div class="post-meta"><span class="author">产品状态：' + fsn['status'] + '</span></div>';
				html += '<div class="post-meta"><a href="union.jsp?tg=2&skey='+fsn['category']+'" class="author">食品类别：'+ fsn['category']+'</a></div>';
				html += '<div class="post-meta"><span class="author">工作单号：'+ fsn['work_SheetNo']+'</span></div>';
				html += '<div class="post-meta"><span class="author">委托单位：'+ fsn['clent']+'</span></div>';
				html += '</div><div class="clear"></div></ul>';
			//});
		}
		else html = '<p class="f-text1"> 无相关数据 </p>';
		return html;
	}
	function GetKMS(pid,curpage, pageSize){
		
	}
</script>
<div class="main">
	<div class="wrap">
	    <div class="section group">
	    	<div class="cont span_1_of_blog">
	    	<div class="sap_tabs">
	    	<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
	    	<ul class="resp-tabs-list">
              <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span id="product_title">数据详情</span></li>
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
            </div>
	    	</div>
	    	</div>
	    	</div>
	    	
	    	<div class="bsidebar span_2_of_blog" >
		    	<div><table class="bordered" id="kmslist">  
							<thead>
								<tr>  
									<th>检测名称</th>  
									<th>标准号</th>  
									<th>颁布时间</th>
									<th>更新时间</th>
									<th>检测项目</th>
									<th>检测成分</th>
									<th>分析方法</th>
									<th>判定标准</th>
									<th>机构</th>
								</tr>
							</thead>  
							<tr>  
									<td>检测名称</td>  
									<td>标准号</td>  
									<td>颁布时间</td>
									<td>更新时间</td>
									<td>检测项目</td>
									<td>检测成分</td>
									<td>分析方法</td>
									<td>判定标准</td>
									<td>机构</td>  
							</tr>  
			  	</table></div>
	    	  	<ul class="pagination">
		      	<li><a></a></li>
				<li><a href="javascript:history.go(-1);" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">返回</a></li>
				<li><a href="javascript:FirstPage(<%=type %>,<%=pid %>,<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">首页</a></li>
				<li><a></a></li>
				<li><a href="javascript:PrePage(<%=type %>,<%=pid %>,<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">上页</a></li>
				<li><a href="javascript:NextPage(<%=type %>,<%=pid %>,<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">下页</a></li>
				</ul>
	    	</div>
	    	<div class="clear"></div>
	    </div>  
 		

  	</div>

</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>