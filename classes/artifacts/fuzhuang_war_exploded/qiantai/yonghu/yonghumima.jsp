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
    <title>修改登录密码</title>
    	<link rel="stylesheet" href="<%=path %>/css/common.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/css/address.css" type="text/css" media="all" />
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script language="javascript">
		    function checkyonghu()
		    {       
		         var userPwReal="${sessionScope.user.loginpw}";
                 if(document.formPw.mima.value !=userPwReal)
                 {
                     alert("原密码不正确");
                     return ;
                 }
                 if(document.formPw.mima1.valuee =="")
                 {
                     alert("新密码不能空");
                     return ;
                 }
                 if(document.formPw.mima1.value != document.formPw.mima2.value)
                 {
                     alert("两次输入的密码不一致");
                     return ;
                 }
                 loginService.yonghuPwEdit(document.formPw.mima1.value,callback);
            }
            function callback(data)
            {
                alert("修改成功");
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
      <h1 class="title">修改登录密码</h1>
      <div class="new-address">
               <div class="input-address">
                	  <form  action="<%=path %>/yonghu?type=userEdit" name="formPw" method="post">
                  <ul>
                    <li>
                      <dl>
                        <dt><span class="require">*</span>原密码：</dt>
                        <dd>
                          <input type="password" name="mima" id="mima">
</dd>
                      </dl>
                    </li>
                    <li>
                      <dl>
                        <dt><span class="require">*</span>新密码：</dt>
                        <dd><input type="password" name="mima1" id="mima1">
                        </dd>
                             </dl>
                    </li>
                    <li>
                      <dl>
                        <dt><span class="require"></span>确认密码：</dt>
                        <dd>
                        <input type="password" name="mima2" id="mima2">
                        </dd>
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