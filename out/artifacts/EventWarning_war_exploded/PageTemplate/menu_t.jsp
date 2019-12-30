<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<style type="text/css">
  header {
    padding: 0;
    z-index: 50;
  }
  .row-nav {
    margin-bottom: 20px;
    margin-top: 20px;
  }
  .navbar-inner {
    background: #4383c2;
    min-height: 50px;
    border: 0;
    padding-left: 0;
    padding-right: 0;
  }
  .brandlogo {
    float: left;
    font-size: 0px;
    font-weight: 0;
    margin: 36px 0 0;
    padding: 0;
    text-shadow: none;
    display: inline-block;
  }
  .navbar .nav>li>a, .navbar .nav>li>a:focus, .navbar .nav>li>a:hover {
    color: #fff;
    padding: 10px 20px 10px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
  }
  .navbar .divider-vertical {
    height: 50px;
    border-left: 1px solid #4b8bcb;
    border-right: 1px solid #2966a2;
    margin: 0;
  }
  .navbar .nav>li {
    line-height: 30px;
    display:inline-block;
  }
  .navbar .nav>li>a:focus, .navbar .nav>li>a:hover, .navbar .nav>.active>a, .navbar .nav>.active>a:hover, .navbar .nav>.active>a:focus {
    color: #fff;
    text-decoration: none;
    background-color: #b9bce7;
  }
  .navbar .nav {
    margin: 0;
  }
  .navbar .nav li.dropdown.open>.dropdown-toggle, .navbar .nav li.dropdown.active>.dropdown-toggle, .navbar .nav li.dropdown.open.active>.dropdown-toggle {
    background-color: #b9bce7;
    color: #fff;
  }
  .topinfo {
    overflow: hidden;
    text-align: right;
  }
  .list-soc {
    overflow: hidden;
    margin-bottom: 5px;
    margin-top: 25px;
  }
  .list-soc li {
    float: right;
    margin-left: 3px;
  }
  .list-soc li a {
    opacity: 1;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
  }
  ul {
    list-style: none outside none;
    margin: 0;
  }
  .infophone {
    text-align: right;
    font-size: 16px;
    line-height: 26px;
    color: #333333;
    text-transform: uppercase;
    padding-bottom: 4px;
  }
  .infoaddress {
    text-align: right;
    color: #333;
    font-size: 12px;
    line-height: 16px;
    text-transform: uppercase;
  }
  #search {
    margin: 0;
    overflow: hidden;
    position: relative;
    float: right;
    padding: 0;
  }
  #search input {
    background: #06335f;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    color: #4383c2;
    margin: 0;
    padding: 10px;
    height: 50px;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    float: left;
    font-size: 12px;
  }
  #search input:focus {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
  }
  #search a {
    display: inline-block;
    float: left;
    background:   url("../images/part-btn-search.png") no-repeat center center;
    width: 50px;
    height: 50px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
  }
  .navbar .nav .dropdown-toggle .caret {
    margin-top: 13px;
  }
  .navbar .nav li.dropdown>.dropdown-toggle .caret, .navbar .nav li.dropdown>a:hover .caret, .navbar .nav li.dropdown>a:focus .caret:hover, .navbar .nav li.dropdown.open>.dropdown-toggle .caret, .navbar .nav li.dropdown.active>.dropdown-toggle .caret, .navbar .nav li.dropdown.open.active>.dropdown-toggle .caret {
    border-top-color: #fff;
    border-bottom-color: #fff;
  }
  .dropdown-menu {
    border: 0px;
    background-color: #222;
  }
  .navbar .nav>li>.dropdown-menu:before {
    border-bottom: 7px solid transparent;
  }
  .navbar .nav>li>.dropdown-menu:after {
    border-bottom: 6px solid transparent;
  }
  .dropdown-menu>li>a {
    -webkit-transition: all 0.3s ease-in;
    -moz-transition: all 0.3s ease-in;
    -ms-transition: all 0.3s ease-in;
    -o-transition: all 0.3s ease-in;
    transition: all 0.3s ease-in;
    color: #fff;
    border-top: 1px solid #2f2f2f;
    border-bottom: 1px solid #111;
    padding: 8px 20px;
  }
  .dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus, .dropdown-submenu:hover>a, .dropdown-submenu:focus>a {
    -webkit-transition: all 0.3s ease-in;
    -moz-transition: all 0.3s ease-in;
    -ms-transition: all 0.3s ease-in;
    -o-transition: all 0.3s ease-in;
    transition: all 0.3s ease-in;
    background-color: #e7402f;
  }
  .dropdown-menu {
    padding: 0px;
    margin-left: -2px;
    margin-top: 0px;
  }
  ul.social-icons li {
    display: inline-block;
    float: none;
    padding: 13px;
    width: 0;
    height: 0;
    position: relative;
    background-color: #333;
    margin-right: 5px;
  }
  ul.social-icons li i {
    position: absolute;
    font-size: 14px;
    width: 20px;
    height: 20px;
    text-align: center;
    line-height: 20px;
    left: 50%;
    top: 50%;
    margin-left: -10px;
    margin-top: -10px;
  }
  ul.social-icons li a {
    color: #fff;
  }
  ul.social-icons li a i {
    -webkit-transition-duration: 0.8s;
    -moz-transition-duration: 0.8s;
    -o-transition-duration: 0.8s;
    transition-duration: 0.8s;
    -webkit-transition-property: -webkit-transform;
    -moz-transition-property: -moz-transform;
    -o-transition-property: -o-transform;
    transition-property: transform;
    overflow: hidden;
  }
  ul.social-icons li a i:hover {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -o-transform: rotate(360deg);
  }
  ul.social-icons li a:hover {
    text-decoration: none;
    color: #fff;
  }
</style>
<header>
  <div class="container clearfix">
    <div class="row-fluid">
      <div class="span12">
        <h1 class="brandlogo"><a href="/"><img src="images/logo1.jpg" alt=""></a></h1>
        <div class="topinfo">
          <div class="infoaddress"> <a href="#">中文</a> | <a href="#">EN</a></div>
          <ul class="social-icons list-soc">
            <p>
              <!-- <li><a href="#"><i class="icon-facebook"></i></a></li>
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-linkedin"></i></a></li>
              <li><a href="#"><i class="icon-google-plus"></i></a></li>
              <li><a href="#"><i class="icon-pinterest"></i></a></li>-->
          </ul>
          <div class="infophone"> <img src="images/123.png" width="24" height="24"><i class="icon-phone"></i> Tel: +17000000000 </div>
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
  <div class="row-nav navbar">
    <div class="navbar-inner">
      <ul id="nav" class="nav">
        <li><a href="IndexServlet"><span>新闻展示</span></a></li>
        <li><a href="hotmap.jsp"><span>热点分布</span></a></li>
        <li><a href="wordcloud.jsp"><span>热词分析</span></a></li>
        <li><a href="eventlist.jsp"><span>事件中心</span></a></li>
        <li><a href="search.jsp"><span>联动查询</span></a></li>
      </ul>
      <form action="search.jsp" name="formsearch" method="post" id="search">
        <input type="hidden" name="kwtype" value="0" />
        <input name="q" type="text" class="text-search" id="search-keyword" value="键入关键词以搜索" onBlur="if(this.value == '') { this.value = '键入关键词以搜索'; }"
               onfocus="if(this.value == '键入关键词以搜索') { this.value = ''; }" />
        <input type="submit" name="submit" value="" />
        <a href="/plus/search.jsp"></a>
      </form>
    </div>
  </div>
</header>

</html>