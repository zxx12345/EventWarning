<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>数据报告</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>	<script type="text/javascript">
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
	int id = 0, type = 0;
	if(request.getParameter("id")!=null)
		id = Integer.parseInt(request.getParameter("id"));
	if(request.getParameter("type")!=null)
		type = Integer.parseInt(request.getParameter("type"));
 %>
 
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		LoadData(<%=type %>, <%=id %>);
	});
	function LoadFSN(data){
		var html = '';
		html += ' <li class="plan"><ul class="planContainer"><li class="title1">';
		html += '<h3>产品信息</h3></li>';
		html += '<li class="price"><p><a href="union.jsp?tg=2&skey=' + data['productName'] 
			+ '"><span>' + data['productName']+'</span></a></p></li>';
		html += '<li><ul class="options">';
		html += '<li>状态：<span>'+data['status']+'</span></li>';
		html += '<li>规格：<span>'+data['format']+'</span></li>';
		html += '<li>保质期：<span>'+data['expirationDate']+'</span></li>';
		html += '<li>类别：<a href="union.jsp?tg=3&skey=' + data['category'] 
			+ '"><span>'+data['category']+'</span></a></li>';
		html += '<li>生产日期：<span>'+data['production_time']+'</span></li>';
		html += '<li>生产厂家：<span>'+data['producer_name']+'</span></li>';
		html += '<li>组织机构：<span>'+data['organization_name']+'</span></li>';
		//html += '<li>原材料：<span>'+data['ingredient']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		html += ' <li class="plan"><ul class="planContainer"><li class="title">';
		html += '<h2>检测详情</h2></li> <li class="price">';
		html += '<a href="union.jsp?tg=2&skey='+data['name']
			+ '"> <p class="bestPlanPrice">检测项：'+data['name']+'</p></a></li>';
		html += '<li><ul class="options">';
		html += '<li>检测类型：<span>'+data['testType']+'</span></li>';
		html += '<li>检测时间：<span>'+data['test_date']+'</span></li>';
		html += '<li>标准号：<span>'+data['regularity']+'</span></li>';
		html += '<li>检测值：<span>'+data['result']+''+data['unit']+'</span></li>';
		html += '<li>标准值：<span>'+data['techIndicator']+''+data['unit']+'</span></li>';
		html += '<li>判定结果：<span>'+data['assessment']+'</span></li>';
		//html += '<li>返回结果：<span>'+data['back_result']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		$('#dataLabel').html('检测报告');
		$('#plans').html(html);
	}
	function LoadKMS(data){
		var html = '';
		html += ' <li class="plan"><ul class="planContainer"><li class="title1">';
		html += '<h3>'+data['serial_Number']+'</h3></li>';
		html += '<li class="price"><p><a href="union.jsp?tg=2&skey=' + data['name'].split('.')[0] 
			+ '"><span>'+data['name'].split('.')[0]+'</span></a></p></li>';
		html += '<li><ul class="options">';
		html += '<li>国标码：<span>'+data['srName'].split('_')[0]+'</span></li>';
		html += '<li>制定时间：<span>'+data['create_time']+'</span></li>';
		html += '<li>更新时间：<span>'+data['last_modified_time']+'</span></li>';
		html += '<li>类别：<a href="union.jsp?tg=3&skey=' + data['category'] 
			+ '"><span>'+data['category']+'</span></a></li>';
		//html += '<li>原材料：<span>'+data['ingredient']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		html += ' <li class="plan"><ul class="planContainer"><li class="title">';
		html += '<h2>检测详情</h2></li> <li class="price">';
		html += '<p class="bestPlanPrice">检测方法：'+data['amName']+'</p></li>';
		html += '<li><ul class="options">';
		html += '<li><a href="union.jsp?tg=2&skey='+data['itemName']
			+ '"> 检测项：<span>'+data['itemName']+'</span></a></li>';
		html += '<li>状态：<span>'+data['state']+'</span></li>';
		if(data['boolean_value']!=null &&data['boolean_value']!=''){
			html += '<li>标准值：<span>'+data['relName']+' '
			+data['boolean_value'];
			 if(data['vuName']!='' && data['vuName']!='无')
			 	html += ' ' + data['vuName']; 
			 html += '</span></li>';
		}
		else if(data['text_value']!=null &&data['text_value']!='')
			html += '<li>标准值：<span>'+data['text_value']+'</span></li>';
		else{
			html += '<li>标准值：<span>' + data['double_low_value']
				+' ~ ' + data['double_high_value'];
			 if(data['vuName']!='' || data['vuName']!='无')
			 	html += ' ' + data['vuName']; 
			 html += '</span></li>';
		}
		
		//html += '<li>返回结果：<span>'+data['back_result']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		$('#dataLabel').html('法规数据');
		$('#plans').html(html);
	}
	function LoadLIMS(data){
		var html = '';
		html += ' <li class="plan"><ul class="planContainer"><li class="title1">';
		html += '<h3>产品信息</h3></li>';
		html += '<li class="price"><p><a href="union.jsp?tg=2&skey=' + data['sample_Name']
			+ '"><span>'+data['sample_Name']+'</span></a></p></li>';
		html += '<li><ul class="options">';
		html += '<li>状态：<span>'+data['status']+'</span></li>';
		html += '<li>类别：<a href="union.jsp?tg=3&skey=' + data['category'] 
			+ '"><span>'+data['category']+'</span></a></li>';
		html += '<li>产品号：<span>'+data['sampleNo']+'</span></li>';
		html += '<li>工作单号：<span>'+data['work_SheetNo']+'</span></li>';
		html += '<li>委托单位：<span>'+data['clent']+'</span></li>';
		//html += '<li>原材料：<span>'+data['ingredient']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		html += ' <li class="plan"><ul class="planContainer"><li class="title">';
		html += '<h2>检测详情</h2></li> <li class="price">';
		html += '<a href="union.jsp?tg=2&skey='+data['test_itemname']
			+ '"><p class="bestPlanPrice">检测项：'+data['test_itemname']+'</p></a></li>';
		html += '<li><ul class="options">';
		html += '<li>标准要求：<span>'+data['qualification']+'</span></li>';
		html += '<li>检测结果：<span>'+data['value_result']+' '+data['measurement_unit']+'</span></li>';
		html += '<li>判定结果：<span>'+data['individual_evaluation']+'</span></li>';
		html += '<li>检测时间：<span>'+data['end_time']+'</span></li>';
		html += '</ul></li></ul></li>';
		
		$('#plans').html(html);
		$('#dataLabel').html('品控数据');
	}
	
	
	function LoadData(type, id){
		$('#dataLabel').html('数据加载中...');
		var url = "<%=basePath%>" + "GetDataDetailServlet";
		$.ajax({
			type : "post",
			url : url,
			data:{type:type, id:id},
			dataType:"json",
			success:function(backdata){
				var data = backdata[0]['data'];
				switch(type){
					case 0:
						LoadFSN(data);
						break;
					case 1:
						LoadKMS(data);
						break;
					case 2:
						LoadLIMS(data);
						break;
				}
			}
		});
	}
</script>


<div class="content-box">
	<div class="wrap">
	  	<ul class="events">
	      <li class="active"><a id="dataLabel">检测报告</a></li>
	    </ul>
  	<div class="content-box-right">
      <div class="reservation"></div>
    </div>
    <div class="clear"></div>
  </div>
</div>


<div class="main">
  <div class="wrap">
       <section id="pricePlans">
      <ul id="plans">
        <li class="plan">
          <ul class="planContainer">
            <li class="title1">
              <h3>Plan 1</h3>
            </li>
            <li class="price">
              <p>$10/<span>month</span></p>
            </li>
            <li>
              <ul class="options">
                <li>2x <span>option 1</span></li>
                <li>Free <span>option 2</span></li>
                <li>Unlimited <span>option 3</span></li>
                <li>Unlimited <span>option 4</span></li>
                <li>1x <span>option 5</span></li>
              </ul>
            </li>
            <li class="button"><a href="#">Purchase</a></li>
          </ul>
        </li>
        <li class="plan">
          <ul class="planContainer">
            <div class="plan-text">
              <li class="title">
                <h2 class="bestPlanTitle">Plan 2</h2>
              </li>
              <li class="price">
                <p class="bestPlanPrice">$20/month</p>
              </li>
              <li>
                <ul class="options">
                  <li>2x <span>option 1</span></li>
                  <li>Free <span>option 2</span></li>
                  <li>Unlimited <span>option 3</span></li>
                  <li>Unlimited <span>option 4</span></li>
                  <li>1x <span>option 5</span></li>
                </ul>
              </li>
              <li class="button"><a class="bestPlanButton" href="#">Purchase</a></li>
            </div>
          </ul>
        </li>
        <li class="plan">
          <ul class="planContainer">
            <li class="title1">
              <h3>Plan 3</h3>
            </li>
            <li class="price">
              <p>$30/<span>month</span></p>
            </li>
            <li>
              <ul class="options">
                <li>2x <span>option 1</span></li>
                <li>Free <span>option 2</span></li>
                <li>Unlimited <span>option 3</span></li>
                <li>Unlimited <span>option 4</span></li>
                <li>1x <span>option 5</span></li>
              </ul>
            </li>
            <li class="button"><a href="#">Purchase</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <ul class="pagination">
      	<li><a></a></li>
		<li><a href="javascript:history.go(-1);" class="border skin-border-color4 skin-font-color13 skin-color-hover3 skin-background-hover1">返回</a></li>
		</ul>
  </div>
</div>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>