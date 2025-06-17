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
   

<link rel="stylesheet" type="text/css" href="<%=path %>/css/modal.css" media="all" />
<link rel="stylesheet" href="<%=path %>/css/cart.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/slider.js"></script>
<script type="text/javascript" src="<%=path %>/js/modal.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script type="text/javascript">
            function delGoodsFromCart(goodsId)
	        {
	          
	            cartService.delGoodsFromCart(goodsId,callback111);
	        }
           
            function clearCart()
	        {
	       
	            cartService.clearCart(callback111);
	        }
           
            function modiNum(goodsId,quantity)
	        {
	        var r1 = /^[_0-9]{0,20}$/
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	         
	                cartService.modiNum(goodsId,quantity,callback111);
	            }
	        }
	        
	        function callback111(data)
	        {
	         
	            if(data=="no")
			    {
			        alert("库存不足");
			    }
			    if(data=="yes")
			    {
			        document.location.reload(true);
			    }
	        }
    </script>
  </head>
  
  <BODY>
      <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 
<div id="container">
    <div id="content">
      <div class="cart-message">
        <h1 class="title">购物车</h1>
        <ul class="cart-nav">
         
          <li class="name">服装名</li>
<li class="name">服装属性</li>
          <li class="price">单价</li>
          <li class="count">数量</li>
          <li class="operation">操作</li>
        </ul>
        	<c:forEach items="${sessionScope.cart.items}" var="item">
        <ul class="shopping-message">
       
           <li class="name"><img src="<%=path %>/${item.value.goods.fujian }" width="80" height="80" alt="" />${item.value.goods.mingcheng}</li>
           <li class="message">颜色：${item.value.goods.yanse}
           </br>
           尺寸：${item.value.goods.chicun}</li>
           <li class="price">${item.value.goods.shichangjia}</li>
          <li class="count">

            <span class="count-number"><input type="text" onChange="modiNum(${item.value.goods.id},this.value)" value="${item.value.goods_quantity}"  /></span>
          
          </li>
          <li class="operation">
       
          <a href="javascript:;" class="del-operation" onClick="delGoodsFromCart(${item.value.goods.id})" data-title="删除">删除</a></li>
  
        </ul>
       </c:forEach>
        <div class="cart-operation">
          <div class="del-clear">
          
            <span class="clear"><a href="javascript:;" onClick="clearCart()">清空购物车</a></span>
          </div>
          <div class="cart-total">
          <% int i=0; %>
                      <c:forEach items="${sessionScope.cart.items}" var="item">
                        <% i=i+1; %>
   	</c:forEach>
          
          <span><%=i %></span>件商品</span>

          </div>
        </div>
        <div class="cart-all">
          <span>总计：</span>
          <span class="cash-total">￥${sessionScope.cart.totalPrice}</span>
        </div>
        <div class="contiue-pay">
          <a href="<%=path %>/index" class="contiue">继续购物</a>
          <a href="<%=path%>/qiantai/cart/mycart1.jsp" class="pay">结 算</a>
        </div>
      </div>
           
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

  </BODY>
</html>
