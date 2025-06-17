<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="<%=path %>/commutil.js"></script>    
<STYLE type=text/css>
BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/login_style.css"/>
		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
		
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
		}
		function callback(data)
		{	
		    
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		}
	    </script>
  </head>
  <body>
   <FORM name="ThisForm" action="<%=path %>/adminLogin.action" method=post>
	<div id="mian">
			<div class="main">
				<div class="login">
					<span>账号 <input type="text" class="text" id="userName" name="userName" /></span>
					<span>密码 <input type="text" class="text" id="userPw" type="password" name="userPw"> </span>
					<input type="button" class="button" value="" onClick="check1()"/>
				</div>
				<div class="bottom">
					Copyright©2021 服装销售管理系统
				</div>
			</div>
		</div>
</form>
  </body>
</html>
