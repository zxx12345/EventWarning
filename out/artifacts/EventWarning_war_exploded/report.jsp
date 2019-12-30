m<%@page import="com.eventwarning.dbImpl.DBOperation"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
  <title>食品安全举报</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href='http://fonts.useso.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href='http://fonts.useso.com/css?family=Dosis' rel='stylesheet' type='text/css'>
  <script src="js/jquery.min.js"></script>
</head>
<%
  //int eventNum9 = (DBOperation.GetEventList("2015", "09")).size();
  //int eventNum10 = (DBOperation.GetEventList("2015", "10")).size();
%>
<jsp:include   page="PageTemplate/menu_t.jsp"/>

<style type="text/css">
  .Content-Main{
    max-width: 500px;
    margin: auto;
    margin-top: 50px;
    padding: 20px 30px 20px 30px;
    font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
    text-shadow: 1px 1px 1px #FFF;
    border: 1px solid #DDD;
    border-radius: 5px;
    color: #888;
    background: #FFF;
  }
  .Content-Main h1{
    display: block;
    padding: 0px 0px 10px 40px;
    margin: -10px -30px 30px -30px;
    font: 25px "Helvetica Neue", Helvetica, Arial, sans-serif;
    border-bottom: 1px solid #DADADA;
    color: #888;
  }
  .Content-Main h1>span{
    display: block;
    font-size: 11px;
  }
  .Content-Main label{
    display: block;
    margin: 0px 0px 5px;
  }
  .Content-Main label>span{
    float: left;
    width: 20%;
    padding-right: 10px;
    margin-top: 10px;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-weight: bold;
    text-align: right;
    color: #333;
  }
  .Content-Main input[type="text"],.Content-Main textarea{
    width: 70%;
    height: 20px;
    padding: 5px 0px 5px 5px;
    margin-bottom: 16px;
    margin-right: 6px;
    margin-top: 2px;
    line-height: 15px;
    border-radius: 4px;
    border: 1px solid #CCC;
    color: #888;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  }
  .select1{
    width: 71%;
    height: 35px;
    margin-bottom: 16px;
    margin-right: 6px;
    margin-top: 2px;
    line-height: 15px;
    padding: 5px 0px 5px 5px;
    border-radius: 4px;
    border: 1px solid #CCC;
    color: #888;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  }
  .select2{
    width: 25%;
    height: auto;
    padding-top: 1px;
    padding-bottom: 3px;
    padding-left: 1px;
    margin-top: 5px;
    margin-bottom: 10px;
    border-radius: 4px;
    border: 1px solid #CCC;
    color: #888;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  }
  .Content-Main textarea{
    width: 70%;
    height: 100px;
    padding: 5px 0px 0px 5px;
  }
  #url{
    width: 70%;
    height: auto;
    padding: 5px 0px 25px 5px;
  }
  #describe{
    width: 70%;
    height: auto;
    padding: 5px 0px 80px 5px;
  }
  #email{
    width: 70%;
    height: auto;
    padding: 5px 0px 5px 5px;
  }
  #verifiation code{
    width: 20px;
    height: auto;
  }
  .button{
    padding: 10px 25px 10px 25px;
    margin-left: 111px;
    border-radius: 4px;
    border:1px solid #CCC;
    background: #FFF;
    color: #333;
  }
  .button:hover{
    color: #333;
    background-color: #EBEBEB;
    border-color: #ADADAD;
  }
</style>
</head>
<body>
<div class="Content-Main">
  <div class="Content-Main1">
    <h1>举报</h1>
  </div>
  <form action="" method="post" class="form-report">
    <label>
      <span>Type:</span>
      <select name="select2" class="select2">
        <option value="">涉及诈骗</option>
        <option value="">涉及侵权</option>
        <option value="">虚假内容</option>
        <option value="">垃圾信息</option>
      </select>
    </label>
    <label>
      <span>URL:</span>
      <textarea id="url" name="url" placeholder="请在此填写主题"></textarea>
    </label>
    <label>
      <span>Describe:</span>
      <textarea id="describe" name="describe" placeholder="详细填写举报理由，有利于审核，不得少于8个字"></textarea>
    </label>

    <label>
      <span>Email:</span>
      <textarea id="email" name="email" placeholder="请务必填写正确的邮箱地址"></textarea>
    </label>
    <label>
      <span>备注：</span>
      <input type="text" id="verifiation code">
    </label>
    <label>
      <input type="button" class="button" value="Send">
    </label>
  </form>
</div>
  <jsp:include   page="PageTemplate/copyright_t.jsp"/>

</body>
</html>