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
    <title>我的订单</title>
    	
		<link href="<%=path %>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/bilstyle.css" rel="stylesheet" type="text/css">

	

  </head>
	<body>
	  <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 
		<div id="container">
    <div id="nav-side">
      <div class="person-container">
        <div class="person-message">
          <p class="person-photo"><img src="<%=path %>/img/img-person.jpg" width="87" height="87" alt="张三丰" /></p>
          <p class="person-name">${sessionScope.user.name}，您好！</p>
      
        </div>
        <div class="my-message">
           <p class="my-address">
            <a href="<%=path %>/buy?type=myorder">我的订单</a>
          </p>
         <p class="my-address">
            <a href="<%=path %>/qiantai/yonghu/yonghuInfo.jsp">个人信息修改</a>
          </p>
           <p class="my-address">
            <a href="<%=path %>/qiantai/yonghu/yonghumima.jsp">修改登录密码</a>
          </p>
          <p class="my-address">
            <a href="<%=path %>/yonghu?type=userLogout">安全退出</a>
          </p>
        </div>
      </div>
    </div>
    <div id="content">
      <h1 class="title">我的订单</h1>
      <div class="record-con">
       
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="record-cont">
        <thead>
          <tr>
            <td width="300" align="center">订单编号</td>
            <td width="200" align="center">订单时间</td>
            <td width="300" align="center">订单状态</td>
            <td width="100" align="center">总金额</td>
          
          </tr>
        
        </thead>
        
  <tbody class="record-tb-bo">
  	<c:forEach items="${requestScope.orderList}" var="order">
  <tr class="record-tit">
    <td height="38"  align="left">
      <span class="record-num"><a href="<%=path %>/buy?type=orderDetail&order_id=${order.id}">${order.bianhao}</a></span></td>
    <td align="center">${order.shijian}</td>
    <td align="center"><c:if test="${order.zhuangtai=='no'}">
												         未发货
												     </c:if>
												     <c:if test="${order.zhuangtai=='yes'}">
												        已发货
												     </c:if></td>
       <td align="center">${order.jine}</td>
  </tr>
   </c:forEach>
  </tbody>
 
</table>
      </div>

    </div>
  </div>
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>

</html>