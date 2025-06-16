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
    	<link href="<%=path %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path %>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path %>/css/bilstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path %>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path %>/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

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
      <h1 class="title">订单详情</h1>
      <div class="record-con">
       
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="record-cont">
        <thead>
          <tr>
            <td width="300" align="center">服装名称</td>
             <td width="300" align="center">服装属性</td>
            <td width="200" align="center">购买数量</td>
            <td width="300" align="center">价格</td>
           
          
          </tr>
        
        </thead>
        
  <tbody class="record-tb-bo">
  <c:forEach items="${requestScope.orderItemList}" var="orderItem">
  <tr class="record-tit">
    <td   align="center">
   ${orderItem.goods.mingcheng}</td>
       <td   align="center">
   ${orderItem.goods.yanse}:
   ${orderItem.goods.chicun}
   </td>
    <td align="center">${orderItem.goods_quantity}</td>
       <td align="center">${orderItem.goods.shichangjia}</td>
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