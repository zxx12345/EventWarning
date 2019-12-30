<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
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
	int eid = 0, curPage = 1, pageSize = 10, type = 0;
	if(request.getParameter("type")!=null)
		type = Integer.parseInt(request.getParameter("type"));	
	
	int tg1=-1, tg2=-1,tg3=-1;
	if(request.getParameter("tg")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg"));
	if(request.getParameter("tg1")!=null)
		tg1 = Integer.parseInt(request.getParameter("tg1"));
	if(request.getParameter("tg2")!=null)
		tg2 = Integer.parseInt(request.getParameter("tg2"));
	if(request.getParameter("tg3")!=null)
		tg3 = Integer.parseInt(request.getParameter("tg3"));

	String skey1 = "",skey2="",skey3="";
	if(request.getParameter("skey")!=null)
		skey1 = request.getParameter("skey");
	if(request.getParameter("skey1")!=null)
		skey1 = request.getParameter("skey1");
	if(request.getParameter("skey2")!=null)
		skey2 = request.getParameter("skey2");
	if(request.getParameter("skey3")!=null)
		skey3 = request.getParameter("skey3");
 %>
 <script type="text/javascript">
	$(document).ready(function(){
		FirstPage(<%=type %>,<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>,'<%=skey3 %>',<%=pageSize %>);
	});
	function FirstPage(type, tg1,skey1,tg2,skey2,tg3,skey3, pageSize){
		document.getElementById('curPage').innerHTML = (1).toString();
		GetData(type, tg1,skey1,tg2,skey2,tg3,skey3,1, pageSize)
	}
	function NextPage(type, tg1,skey1,tg2,skey2,tg3,skey3, pageSize){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		document.getElementById('curPage').innerHTML = (curPage+1).toString();
		GetData(type, tg1,skey1,tg2,skey2,tg3,skey3, curPage+1, pageSize);
	}
	function PrePage(type, tg1,skey1,tg2,skey2,tg3,skey3, pageSize){
		var curPage = parseInt(document.getElementById('curPage').innerHTML, 10);
		if(curPage<=1){
			alert('已经是第一页了');
			return ;
		}
		document.getElementById('curPage').innerHTML = (curPage-1).toString();
		GetData(type, tg1,skey1,tg2,skey2,tg3,skey3,curPage-1, pageSize);
	}
	function KMSHtml(kmslist){
		var html = '<thead><tr><th>序号</th> <th>标准号</th><th>颁布时间</th>'
					+'<th>修订时间</th><th>检测对象</th><th>所属分类</th>'
					+ '</tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="producttestdata.jsp?type=<%=type%>&pid='+kms['standard_id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['serial_Number'] +'</td>';
            	html += '<td>' + kms['create_time'] +'</td>';
            	//html += '<td>' + kms['name'] +'</td>';
            	html += '<td>' + kms['last_modified_time'] +'</td>';
            	html += '<td>' + kms['name'] +'</td>';
            	html += '<td>' + kms['category'] +'</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function FSNHtml(kmslist){
		var html = '<thead><tr><th>序号</th><th>食品名称</th><th>检测类型</th>'
					+'<th>所属类别</th><th>规格</th><th>生日期</th><th>保质期</th>'
					+ '<th>生产厂家</th></tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="producttestdata.jsp?type=<%=type%>&pid='+kms['product_id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['productName'] +'</td>';
            	html += '<td>' + kms['testType'] +'</td>';
            	html += '<td>' + kms['category'] +'</td>';
            	html += '<td>' + kms['format'] +'</td>';
            	html += '<td>' + kms['production_time'] +'</td>';
            	html += '<td>' + kms['expirationDate'] +'</td>';
            	html += '<td>' + kms['producer_name'] +'</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function LIMSHtml(kmslist){
		var html = '<thead><tr><th>序号</th> <th>样例编号</th><th>产品名称</th><th>产品状态</th><th>产品类别</th>'
					+'<th>工作单号</th><th>委托单位</th>'
					+ '</tr></thead>'; 
		if(kmslist.length != 0){
            $.each(kmslist, function(idx, kms){
            	html += '<tr><td><a href="producttestdata.jsp?type=<%=type%>&pid='+kms['sample_id']+'">'+(idx+1)+'</a></td>';
            	html += '<td>' + kms['sampleNo'] +'</td>';
            	html += '<td>' + kms['sample_Name'] +'</td>';
            	html += '<td>' + kms['status'] +'</td>';
            	html += '<td>' + kms['category'] +'</td>';
            	html += '<td>' + kms['work_SheetNo'] +'</td>';
            	html += '<td>' + kms['clent'] +'</td>';
            	html += '</tr>';
            });
            $('#kmslist').html(html);
        }
        else{
        	$('#kmslist').html('<p class="f-text1">无相关事件数据</p>');
        }
	}
	function GetData(type, tg1,skey1,tg2,skey2,tg3,skey3, curPage, pageSize){
		var url = "<%=basePath%>" + "GetUnionResultServlet";
		$.ajax({
			type : "post",
			url : url,
			data:{type:type, tg1:tg1,tg2:tg2,tg3:tg3,skey1:skey1,skey2:skey2,skey3:skey3, curPage:curPage, pageSize:pageSize},
			dataType:"json",
			success:function(data){
				var datalist;
				switch(type){
					case 0:
						FSNHtml(data[0]['fsnlist']);
						datalist = data[0]['fsnlist'];
						break;
					case 1:
						KMSHtml(data[0]['kmslist']);
						datalist = data[0]['kmslist'];
						break;
					case 2:
						LIMSHtml(data[0]['limslist'])
						datalist = data[0]['limslist'];
						break;
				}
                if(datalist.length==0 && curPage>1){
                	alert('已经是最后一页');
                	PrePage(type, tg1,skey1,tg2,skey2,tg3,skey3, pageSize);
                }
                
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            },
            complete: function(XMLHttpRequest, textStatus) {
                this; // 调用本次AJAX请求时传递的options参数
            }
		});
	}
	function GetKMS(eid,curpage, pageSize){
		
	}
</script>
<div class="main">
	<div class="wrap">  
 		<div>
			<table class="bordered" id="kmslist">  
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
  			</table>  
  		</div>
  		<ul class="pagination">
      	<li><a></a></li>
		<li><a href="javascript:history.go(-1);" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">返回</a></li>
		<li><a href="javascript:FirstPage(<%=type %>,<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>,'<%=skey3 %>',<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">首页</a></li>
		<li><a></a></li>
		<li><a href="javascript:PrePage(<%=type %>,<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>,'<%=skey3 %>',<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">上页</a></li>
		<li><a href="javascript:NextPage(<%=type %>,<%=tg1 %>,'<%=skey1 %>',<%=tg2 %>,'<%=skey2 %>',<%=tg3 %>,'<%=skey3 %>',<%=pageSize %>)" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">下页</a></li>
		</ul>
  		<div class="clear"></div>
  	</div>

</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>