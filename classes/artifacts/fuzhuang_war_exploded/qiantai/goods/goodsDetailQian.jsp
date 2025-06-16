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
<link rel="stylesheet" href="<%=path %>/css/product.css" type="text/css" media="all" />
<script type="text/javascript">
	        function buy1(kucun)
	        {
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	              <c:if test="${sessionScope.userType==1}">
		            if(document.buy.quantity.value=="")
		            {
		                alert("请输入购买数量");
		                return false;
		            }
		              if(document.buy.quantity.value>kucun)
		            {
		                alert("购买数量不能大于库存数量");
		                return false;
		            }
		            document.buy.submit();
	            </c:if>
	        }
	</script>
  <script>
  $(".fade-banner").fadeBanner();//轮播图插件初始化，注意control-fade，contrl-tab两个属性规定是否有小圆点控制按钮和tab切换的按钮
  $(".dropdown").click(function(){
	$(this).parent().css("position","relative");
	var getTar = $(this).attr("href");
	$(getTar).slideToggle();
	return false;
  });
  $(window).scroll(function(){
	var getSpace = $(window).scrollTop();
	$(".online-service").stop().animate({"top" : getSpace+250}, "linear");
  })
</script>
  </head>
  
  <BODY>

					    <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 

		
		  <div id="container">
    <div id="nav-side">
     <c:if test="${sessionScope.user==null}">
      <div class="login-container">
        <p class="login-title"><img src="<%=path %>/img/title-login.gif" alt="会员登入" width="147" height="23" /></p>
        <form>
          <ul class="login-input">
            <li>
              <label>账号：</label>
              <input type="text" />
            </li>
            <li>
              <label>密码：</label>
              <input type="password" />
            </li>
          </ul>

          <p class="login-btn">
            <a href="javascript:;"><img src="<%=path %>/img/btn-login.gif" width="61" height="19" alt="登录" /></a>
            <a href="regist.html"><img src="<%=path %>/img/btn-regist.gif" width="61" height="19" alt="注册" /></a>
          </p>
        </form>
      </div>
      </c:if>
      <c:if test="${sessionScope.user!=null}">
      <div class="login-container">
        <dl class="login-suc">
          <dt><img src="<%=path %>/img/img-photo.jpg" width="62" height="62" alt="头像" /></dt>
          <dd>
            <p class="user-name">张三丰</p>
            <p>您好！</p>
          </dd>
        </dl>
        <p class="my-fujia"><a href="person/record.html"><img src="<%=path %>/img/btn-personal.gif" width="89" height="21" alt="" /></a></p>
      </div>
  </c:if>
      <div class="hot-sale">
        <h1 class="hot-tit">热卖服装</h1>
        <div class="hot-cont">
          <ul class="hot-list">
          	<c:forEach items="${sessionScope.paihangList}" var="goods" varStatus="sta">
            <li>
              <p>
              	<a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><img src="<%=path %>/${goods.fujian }" width="136" height="112"/></a>
</p>
              <p class="hot-name"><a href="product/details.html"> ${goods.mingcheng }<span>(¥${goods.shichangjia })</span></a></p>
               <p class="hot-name"><span>销量：${goods.kucun }</span></a></p>
            </li>
             </c:forEach>
           
          </ul>
        </div>
      </div>
    </div>
      <div id="content">
    <div class="pro-detail">
      <div class="pro-img">
      <div id="tsShopContainer">
                    <div id="tsImgS">
                        <a href="<%=path %>/${requestScope.goods.fujian }" title="Images" class="MagicZoom" id="MagicZoom"><img width="300" height="300" src="<%=path %>/${requestScope.goods.fujian }" /></a>
                    </div>
                   
                       
                </div>
                
 
      </div>
 <div class="text-container">
 <form action="<%=path %>/buy?type=addToCart" method="post" name="buy">
        <h1> ${requestScope.goods.mingcheng }</h1>
             <div class="pro-price">
     
          <dl>
            <dt>价格</dt>
            <dd><span>${requestScope.goods.shichangjia }</span></dd>
          </dl>
        </div>
     
        <script>
		  $(".fre-target").click(function(){
			$(this).find("ul").toggle();
			$(this).find("li").click(function(){
			  $(".fre-target > a").text($(this).text());
			});
		  })
        </script>
        <ul class="count-total">
          <li>颜色<span>${requestScope.goods.yanse }</span></li>
          <li>尺寸<span>${requestScope.goods.chicun }</span></li>
      
        </ul>
        <dl class="pro-stock">
          <dt>数量</dt>
          <dd>
            <input class="pro-number" id="quantity" name="quantity"  type="text" value="1" />
            <span class="cho-number"> <span class="pro-add"><img src="<%=path %>/img/detail/ico-add-number.gif" width="19" height="13" alt="" /></span> <span class="pro-red"><img src="<%=path %>/img/detail/ico-red-number.gif" width="19" height="13" alt="" /></span> </span> 件 <span class="stock-total">库存${requestScope.goods.kucun }件</span> </dd>
        </dl>
        <script>
		    $(document).ready(function(){
			  $(".pro-add").click(function(){
				var getVal = parseInt($(this).parent().prev().val());
				$(this).parent().prev().val(getVal + 1);
			  });
			  $(".pro-red").click(function(){
				var getVal = $(this).parent().prev().val();
				if(getVal > 1){
			      $(this).parent().prev().val(getVal - 1);
				}
			  });
			})
          </script>
        <div class="buy-cart">
          <input type="hidden" name="goods_id" value="${requestScope.goods.id }"/>
 <a class="cart" href="javascript:;" onclick="buy1(${requestScope.goods.kucun })" >加入购物车</a>
        </div>
 </form>
      </div>
      <div style="clear: both;"></div>
    </div>
    <div class="goods-evaluation">
      <h1><a href=".goods-details" class="tab-detail active">商品详情</a></h1>
      <script>
	      $(".goods-evaluation h1 a").click(function(){
		    $(this).addClass("active").siblings().removeClass("active");
			$(this).parent().siblings().css("display","none");
			var getTarget = $(this).attr("href");
			$(getTarget).css("display","block");
			return false;
	   	  })
        </script>
      <div class="goods-details">
   ${requestScope.goods.jieshao }

      </div>
   
    </div>
           </div>
         
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

  </BODY>
</html>
