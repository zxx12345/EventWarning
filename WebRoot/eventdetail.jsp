<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.eventwarning.bean.*" %>
<%@ page language="java" import="com.github.abel533.echarts.Option" %>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>事件追踪</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
	<script src="js/jquery.min.js"></script>
  </head>
  
  <body>
  	<jsp:include   page="PageTemplate/menu_t.jsp"/>
  
  <% 
  	Event event = null;
  	int eid = 0;
  	if(request.getAttribute("event")!=null)
  		event = (Event)request.getAttribute("event");
  	else
  		event = new Event();
  	eid = event.eventID;
  	String optionbar = (String)request.getAttribute("keywordbar");
  	String hotline = (String)request.getAttribute("hotline");
  	String sentimentpie = (String)request.getAttribute("sentimentpie");
  	String warningbar = (String)request.getAttribute("warningbar");
  	String testdatabar = (String)request.getAttribute("testdatabar");
  	int warningd = (Integer)request.getAttribute("warningd");
  	if(event.getCenturalArticle()==null)
  		event.centuralArticle = new Article();

  %>

<div class="main">
  <div class="wrap">
    <div class="feature-desc">      
      <h5 class="m_1"><a>核心报道</a></h5>
      <h5 class="m_1"><a><B><%= event.getCenturalArticle().getArticle_title() %></B></a></h5>
      <p class="m_13"><%= event.getCenturalArticle().getArticle_abstract() %></p>
      
      <div class="links">
          <ul>
            <li><a><img src="images/blog-icon1.png" title="date"><span>时间：<%=event.startTime %></span></a></li>
            <li><a><img src="images/blog-icon2.png" title="Comments"><span>地点：<%=event.location %></span></a></li>
            <!--  <li><a><img src="images/blog-icon2.png" title="Comments"><span>关键词：<%=event.getKeyWord() %></span></a></li>
            -->
            <li><a><img src="images/blog-icon4.png" title="Lables"><span>类别：<%=event.category %></span></a></li>
          	<li><a href="articlelist.jsp?eid=<%=event.eventID %>"><img src="images/blog-icon5.png" title="permalink"><span>报道详情</span></a></li>
          </ul>
        </div>
    	</div>
 		<div class="feature-desc"> 
      		<div id="keywordbar" style="height:300px;"></div>
    		<div class="clear"></div>
      		<div id="testdatabar" style="height:300px;"></div>
    		<div class="clear"></div>
      	</div>
    <div class="feature-desc">
      <div class="post_meta"><span class="post_author"><em> 动态追踪 </em></span> </div>
      <div id="hotline" style="height:300px"></div>
    <div class="clear"></div>
    <div class="clear"></div>
      <div id="sentimentpie" style="height:300px"></div>
    </div>
    
    
    <div class="feature-desc">
      <div class="post_meta"><span class="post_author"><em> 预警分析 </em></span> </div>
      <h5 class="m_1"><a href="#">预警等级：</a> 
      <c:forEach begin="1" end="<%=warningd%>" step="1">
      	<image src="./images/warning_star.png" style="height:30px; width:30px;"></image>
      </c:forEach>
      </h5>
      <div id="warndetail"> </div>	
	     <ul id="showornot">
	      	<li><a href="javascript:ShowWarnDetail(1);">显示指标说明</a></li>
	     </ul>
    </div>
  </div>
</div>

<script src="./echarts-2.2.2/build/dist/echarts.js"></script>
<script src="./echarts-2.2.2/build/dist/echarts-all.js"></script>
<script type="text/javascript">
      // 路径配置
        require.config({
            paths: {
                echarts: './echarts-2.2.2/build/dist/'
            }
        });
        
	  // 使用
	  require(
	      [
	          'echarts',
	          'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/treemap', // 使用柱状图就加载bar模块，按需加载
	          
	      ],
	 function (ec){
	 	DrawKeywordBar(ec);
	 	DrawHotLine(ec);
	 	DrawSentimentPie(ec);
	 	DrawTestDataBar(ec);
	 }
	);
function DrawKeywordBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('keywordbar')); 
   	var option = <%=optionbar%>;
   	option.series[0].type='treemap';
	myChart.setOption(option); 
	var ecConfig = require('echarts/config'); 
	myChart.on(ecConfig.EVENT.CLICK,function(param){
		if(typeof param.name != 'undefined'){
			//alert(param.name);
			window.location.href = 'union.jsp?tg=0&skey='+param.data.name;
		}
	});
};
function DrawHotLine(ec) {
   // 基于准备好的dom，初始化echarts图表
   var myChart = ec.init(document.getElementById('hotline')); 
   var option = <%=hotline%>;
   myChart.setOption(option);
};
function DrawSentimentPie(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('sentimentpie')); 
	var option = <%=sentimentpie%>;           
	// 为echarts对象加载数据 
	myChart.setOption(option); 
};
function DrawTestDataBar(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('testdatabar')); 
	var option = <%=testdatabar%>;           
	// 为echarts对象加载数据 
	myChart.setOption(option); 
	var ecConfig = require('echarts/config'); 
	myChart.on(ecConfig.EVENT.CLICK,function(param){
		if(typeof param.dataIndex != 'undefined'){
			window.location.href = 'testdatalist.jsp?type='+param.dataIndex+'&eid='+<%=eid %>;
		}
	});
}; 
function DrawWarningBar(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('warningbar')); 
	var option = <%=warningbar%>;           
	// 为echarts对象加载数据 
	myChart.setOption(option); 
};
function ShowWarnDetail(tg){
	if(tg==1){
		var html = '';
		html +='<div id="warningbar" style="height:300px"></div>';
	    html +='<div class="clear"></div>';    
	    html +='<h5 class="m_1"><a>事件热度</a></h5>';
	    html +='<p class="m_13">该指标表明事件在网络中参与程度</p>';      
	    html +='<h5 class="m_1"><a>情感指数</a></h5>';
	    html +='<p class="m_13">该指标表明事件参与用户的情感态度</p>';      
	    html +='<h5 class="m_1"><a>舆情强度</a></h5>';
	    html +='<p class="m_13">该指标表明事件中用户的影响力、报道来源的可靠性</p>';      
	    html +='<h5 class="m_1"><a>讨论活度</a></h5>';
	    html +='<p class="m_13">该指标表明事件中用户参与讨论的激烈程度</p>';
      	 $('#warndetail').html(html);
      	 require(
		      [
		          'echarts',
		          'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
		          'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
		          'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
		          
		      ],
			 function (ec){
			 	DrawWarningBar(ec);
			 }
		);
		$('#showornot').html('<li><a href="javascript:ShowWarnDetail(0);">收起指标说明</a></li>');
	}
	else{
		$('#warndetail').empty();
		$('#showornot').html('<li><a href="javascript:ShowWarnDetail(1);">显示指标说明</a></li>');
	}
};
</script>

	<jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>
