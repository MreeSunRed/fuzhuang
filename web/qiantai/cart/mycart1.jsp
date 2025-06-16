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
        <h1 class="title">订单确认</h1>
        <div class="receive-container">
          <h2>收货人</h2>
          <div class="address-container">
            <dl class="address-content">
              <dt>${sessionScope.user.name} </dt>
              <dd>${sessionScope.user.address}<span class="telephone">${sessionScope.user.tel}</span></dd>
            </dl>
          
           
          </div>
        </div>
        <div class="confirm-form">
          <h2>确认订单信息</h2>
          <ul class="confirm-nav">
            <li class="name">服装</li>
            <li class="price">单价</li>
            <li class="count">数量</li>
            <li class="total">小计</li>
          </ul>
          	<c:forEach items="${sessionScope.cart.items}" var="item">
          <ul class="confirm-content">
                      <li class="name"><img src="<%=path %>/${item.value.goods.fujian }" width="80" height="80" alt="" />${item.value.goods.mingcheng}
           </br>颜色：${item.value.goods.yanse}
           </br>
           尺寸：${item.value.goods.chicun}</li>
            <li class="price">${item.value.goods.shichangjia}</li>
            <li class="count">${item.value.goods_quantity}</li>
            <li class="total">${item.value.goods.shichangjia * item.value.goods_quantity}</li>
          </ul>
          </c:forEach>
          <p class="form-price">
         <% int i=0; %>
                      <c:forEach items="${sessionScope.cart.items}" var="item">
                        <% i=i+1; %>
   	</c:forEach>    <span><%=i %>件商品</span>
            <span>总计：￥${sessionScope.cart.totalPrice}</span>
          </p>
         
          <p class="need-pay">
            实付：<span>￥${sessionScope.cart.totalPrice}</span>
          </p>
          <p class="cart-pay">
            <a href="<%=path %>/qiantai/cart/mycart.jsp" class="re-cart">返回购物车</a>
            <a href="<%=path%>/buy?type=orderSubmit"" class="go-pay">确认下单</a>
          </p>
        </div>
      </div>
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

  </BODY>
</html>
