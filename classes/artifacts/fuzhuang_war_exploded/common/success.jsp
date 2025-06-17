<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String path = request.getAttribute("path").toString();
	String message = request.getAttribute("message").toString();
	System.out.println(message);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<html>

<script language="javascript" charset="UTF-8">
	<%--console.log("<%=message%>");--%>
    <% if(message != null) { %>
		alert("用户注册成功");
	<% } %>
	<% if(path != null) { %>
		document.location.href = "<%=path%>";
	<% } else {%>
		window.history.back();
	<% } %>
</script>
<body>
<%--<h1><%=message%></h1>--%>
</body> 
</html>
