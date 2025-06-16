<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   

	<link rel="stylesheet" href="<%=path %>/css/common.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/css/settlement.css" type="text/css" media="all" />
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/slider.js"></script>
   
  </head>
  
  <BODY>
      <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 

		 <div id="container">
    <div id="content">
      <div class="settlement-message">
        <h1 class="title">订单提交成功</h1>
        <div class="receive-container">
          <h2>你的订单编号：${requestScope.order.bianhao }</h2>
          
        </div>
      
      </div>
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

  </BODY>
</html>
