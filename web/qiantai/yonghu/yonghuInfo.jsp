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
    <title>修改个人信息</title>
    	<link rel="stylesheet" href="<%=path %>/css/common.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/css/address.css" type="text/css" media="all" />
		 <script language="javascript">
   
		    function checkyonghu()
		    {   
		        if(document.form2222.name.value=="")
		        {
		            alert("请输入用户姓名");
		            return false;
		        }
               if(document.form2222.tel.value=="")
		        {
		            alert("请输入联系电话");
		            return false;
		        }
		        if(document.form2222.address.value=="")
		        {
		            alert("请输入用户地址");
		            return false;
		        }
		         if(document.form2222.email.value=="")
		        {
		            alert("请输入电子邮箱");
		            return false;
		        }
		        document.form2222.submit();
		    }
        </script>
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
      <h1 class="title">个人信息修改</h1>
      <div class="new-address">
               <div class="input-address">
               <form  action="<%=path %>/yonghu?type=userEdit" name="form2222" method="post">
                  <ul>
                    <li>
                      <dl>
                        <dt><span class="require">*</span>用户账号：</dt>
                        <dd><input type="text" name="loginname" id="loginname" value="${sessionScope.user.loginname}" readonly="readonly"/>
</dd>
                      </dl>
                    </li>
                    <li>
                      <dl>
                        <dt><span class="require">*</span>用户姓名：</dt>
                        <dd><input type="text" name="name" value="${sessionScope.user.name}" /></dd>
                             </dl>
                    </li>
                    <li>
                      <dl>
                        <dt><span class="require"></span>联系电话：</dt>
                        <dd><input type="text" name="tel" value="${sessionScope.user.tel}" /></dd>
                      </dl>
                    </li>
                    <li>
                      <dl>
                        <dt><span class="require"></span>收货地址：</dt>
                        <dd><input type="text" name="address" value="${sessionScope.user.address}" /></dd>
                      </dl>
                    </li>
                     <li>
                      <dl>
                        <dt><span class="require"></span>电子邮箱：</dt>
                        <dd><input type="text" name="email" value="${sessionScope.user.email}" /></dd>
                      </dl>
                    </li>
                  </ul>
                  <p class="submit-address"><a href="javascript:;" OnClick="checkyonghu()"><img src="<%=path %>/img/cart/btn-save.gif" width="64" height="22" alt="保存" /></a></p>
                </form>
              </div>
            </div>
            </div>
<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</body>

</html>