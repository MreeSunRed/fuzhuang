<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">--%>
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/fadebanner.js"></script>
    	<script type="text/javascript" src="<%=path %>/commutil.js"></script>    
    		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
<script language="javascript">
       
		     function chenyonghu()
			{                                                                                         
			     if(document.form2.loginname.value=="")
				 {
				 	alert("请输入用户名");
					return false;
				 }
				 if(document.form2.loginpw.value=="")
				 {
				 	alert("请输入密码");
					return false;
				 }

				 loginService.login(document.form2.loginname.value,document.form2.loginpw.value,1,callback);
			}
		
			function callback(data)
			{

			    if(data=="no")
			    {
			        alert("用户名或密码错误");
			    }
			    if(data=="yes")
			    {   
			        alert("登陆成功");
			        var url="<%=path %>/index"
                    window.location.href=url;
			    }
			    
			}
        </script>
  </head>
  
  <BODY>

					    <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 

		
		  <div id="container">
    <div id="nav-side">
     <c:if test="${sessionScope.user==null}">
      <div class="login-container">
        <p class="login-title"><img src="<%=path %>/img/title-login.gif" alt="会员登入" width="147" height="23" /></p>
       <form action="<%=path %>/yonghu?type=yonghuReg" name="form2" method="post">
          <ul class="login-input">
            <li>
              <label>账号：</label>
              <input type="text" name="loginname" id="loginname"/>
            </li>
            <li>
              <label>密码：</label>
              <input type="password" name="loginpw"/>
            </li>
          </ul>

          <p class="login-btn">
            <a href="javascript:;" onclick="chenyonghu();"><img src="<%=path %>/img/btn-login.gif" width="61" height="19" alt="登录" /></a>
            <a href="<%=path%>/qiantai/yonghu/yonghuReg.jsp"><img src="<%=path %>/img/btn-regist.gif" width="61" height="19" alt="注册" /></a>
          </p>
        </form>
      </div>
      </c:if>
      <c:if test="${sessionScope.user!=null}">
      <div class="login-container">
        <dl class="login-suc">
          <dt><img src="<%=path %>/img/img-photo.jpg" width="62" height="62" alt="头像" /></dt>
          <dd>
            <p class="user-name">${sessionScope.user.name}</p>
            <p>您好！</p>
          </dd>
        </dl>
        <p class="my-fujia"><a href="<%=path %>/buy?type=myorder"><img src="<%=path %>/img/btn-personal.gif" width="89" height="21" alt="" /></a></p>
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
               <p class="hot-name"><span>销量：${goods.kucun }</span></p>
            </li>
             </c:forEach>
           
          </ul>
        </div>
      </div>
    </div>
    <div id="content">
      <div class="banner-cont">
        <ul class="fade-banner" control-fade="banner-control">
          <li><a href="product/product.html"><img src="<%=path %>/img/Anta.jpg" width="744" height="303" alt="" /></a></li>
          <li><a href="product/product.html"><img src="<%=path %>/img/Nike.jpg" width="744" height="303" alt="" /></a></li>
          <li><a href="product/product.html"><img src="<%=path %>/img/Nike.png" width="744" height="303" alt="" /></a></li>
          <li><a href="product/product.html"><img src="<%=path %>/img/Lining.jpg" width="744" height="303" alt="" /></a></li>
          <li><a href="product/product.html"><img src="<%=path %>/img/06.jpg" width="744" height="303" alt="" /></a></li>
        </ul>
        <ul class="banner-control">
          <li class="active"></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <div class="promotion-area">
        <h1 class="title">新品上架</h1>
        <ul class="promotion-list">
          <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
          <li>
               
            <p>
            <a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><img src="<%=path %>/${goods.fujian }" width="200" height="160"/></a>
  </p>
            <p class="show-name">${goods.mingcheng }</p>
            <p class="show-price"><a href="product/details.html">¥${goods.shichangjia }</a></p>
          </li>
           </c:forEach>
         
        </ul>
      </div>
     
    </div>
  </div>

           
		
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
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
  </BODY>
</html>
