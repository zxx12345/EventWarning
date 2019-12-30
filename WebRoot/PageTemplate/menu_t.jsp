<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<div class="header-top">
  <div class="wrap">
    <div class="logo"> <a href="IndexServlet"><img src="logo1.gif" alt=""/></a> </div>
    <div class="cssmenu">
      <nav id="nav" role="navigation"> <a href="#nav" title="Show navigation">Show navigation</a> <a href="#" title="Hide navigation">Hide navigation</a>
        <ul class="clearfix">
          <li><a href="IndexServlet"><span>首页</span></a></li>
          <li><a href="hotmap.jsp"><span>热点分布</span></a></li>
          <li><a href="wordcloud.jsp"><span>热词分析</span></a></li>
          <li><a href="eventlist.jsp"><span>事件中心</span></a></li>
          <li><a href="search.jsp"><span>联动查询</span></a></li>
          <div class="clear"></div>
        </ul>
      </nav>
    </div>
	<jsp:include   page="search_t.jsp"/>
    <div class="clear"></div>
    <h2 class="head">Find the <span class="m_1">hot events </span>You'll want <span class="m_1">to know</span></h2>
  </div>
</div>
</html>