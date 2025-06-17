<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <LINK href="<%=path %>/css/css.css" type=text/css rel=stylesheet>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
  </head>
  
 <FRAMESET 
frameSpacing=0 rows=80,* frameBorder=0><FRAME name=top 
src="top.jsp" frameBorder=0 noResize 
scrolling=no><FRAMESET frameSpacing=0 frameBorder=0 cols=220,*><FRAME name=menu 
src="menu.jsp" frameBorder=0 noResize><FRAME name=I2 
src="<%=path %>/admin/index/sysPro.jsp" 
frameBorder=0></FRAMESET><NOFRAMES>
        <p>
            This page requires frames, but your browser does not support them.</p>
    </NOFRAMES></FRAMESET>
</html>