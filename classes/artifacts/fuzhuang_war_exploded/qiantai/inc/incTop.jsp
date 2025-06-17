<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" href="<%=path%>/css/common.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path%>/css/index.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/fadebanner.js"></script>


<script type="text/javascript">
	        function search1111()
	        {
		         document.chaxun.submit();
	   
	        }
	</script>
  </head>
  
  <body>

<body bgcolor="#e0d6df">
  <div id="header">

    <div class="header-top">
    <div class="logo-container"><img src="<%=path%>/img/logo-fujia.png" width="197" height="51" alt="logo" /></div>
    <div class="header-nav">
      <ul>
        <li><a href="<%=path%>/index">首页</a></li>
        <li><a href="<%=path%>/qiantai/yonghu/yonghuReg.jsp">用户注册</a></li>
        <li>
          <a href="<%=path %>/goods?type=goodsList" class="dropdown">所有服装</a>
      
        </li>
        <li><a href="<%=path %>/qiantai/cart/mycart.jsp">购物车</a></li>
        <li><a href="<%=path %>/buy?type=myorder">用户中心</a></li>
        <li><a href="login.jsp">管理员登录</a></li>

        <li class="clear"></li>
      </ul>
    </div>
    </div>
    <div class="header-bottom">
      <ul class="hot-search">
 		   <c:forEach items="${sessionScope.catelogList}" var="catelog">
        <li><a href="<%=path %>/goods?type=goodsByCatelog&catelog_id=${catelog.id}">${catelog.name}</a></li>
           </c:forEach>

      </ul>
      <div class="search-container">
      <form action="<%=path %>/goods?type=goodsBymingcheng" name="chaxun" method="post">
        <input type="text"  id="mingcheng" name="mingcheng" onfocus="this.value='';$(this).css('color','#313131');" value="请输入商品名称或输入关键字" />
        <a id="LikBasket" title="查询" href="javascript:void(0);" onclick="search1111()" >      	
        <img src="<%=path %>/img/ico-search.gif" alt="搜索" width="64" height="23" /></a>
        </form>
      </div>
    </div>
  </div>
            
  </body>
</html>
