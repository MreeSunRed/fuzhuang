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
   
<link rel="stylesheet" href="<%=path%>/css/common.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%=path %>/css/regist.css" type="text/css" media="all" />
     		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
   <script language="javascript">
        
		    function checkyonghu()
		    {   
		        if(document.form111.loginname.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form111.loginpw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
              if(document.form111.name.value=="")
              {
                alert("请输入用户姓名");
                return false;
              }
              if(document.form111.tel.value=="")
              {
                alert("请输入联系电话");
                return false;
              }
		        if(document.form111.address.value=="")
		        {
		            alert("请输入收货地址");
		            return false;
		        }

		          if(document.form111.email.value=="")
		        {
		            alert("请输入电子邮箱");
		            return false;
		        }
		        if(document.form111.loginpw.value!=document.form111.loginpw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
                var temp = document.form111.email.value;
          //对电子邮件的验证
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test(temp))
           {
                alert('提示\n\n请输入有效的E_mail！');
                myreg.focus();
                return false;
           }
            if(!(/^1\d{10}$/.test(document.form111.tel.value))){
              alert("联系方式码有误，请重新填写");
              return false;
    }
            loginService.login(document.form111.loginname.value,"",2,callback11);
            }
		 function callback11(data)
		{
		    if(data=="no")
		    {
		       document.form111.submit();
		    }
		    if(data=="yes")
		    {
		        alert("用户名已经存在，不能重复注册");

		    }    
		}
        </script>
  </head>
  
  <BODY>
	 			    <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> 

		
     <div id="container">
    <div class="regist-con">
      <form action="<%=path %>/yonghu?type=userReg" name="form111" method="post">
        <fieldset>
          <legend>用户注册</legend>
          <ul class="regist-cont">
            <li>
              <dl>
                <dt>用户名：</dt>
                <dd><input type="text" name="loginname" id="loginname"/></dd>
              </dl>
              <span>*</span>
            </li>
            <li>
              <dl>
                <dt>密码：</dt>
                <dd class="regist-password"><input type="password" name="loginpw" size="100"/></dd>
              </dl>
              <span>*</span>
            </li>
            <li>
              <dl>
                <dt>确认密码：</dt>
                <dd class="insure-password"><input type="password" name="loginpw1"/></dd>
              </dl>
              <span>*</span>
            </li>
            <li>
              <dl>
                <dt>用户姓名：</dt>
                <dd><input type="text" name="name"/></dd>
              </dl>
              <span>*</span>
            </li>
            <li>
              <dl>
                <dt>联系电话：</dt>
                <dd><input type="text" name="tel"/></dd>
              </dl>
              <span>*</span>
            </li>
             <li>
              <dl>
                <dt>收货地址：</dt>
                <dd><input type="text" name="address"/></dd>
              </dl>
              <span>*</span>
            </li>
             <li>
              <dl>
                <dt>电子邮箱：</dt>
                <dd><input type="text" name="email"/></dd>
              </dl>
              <span>*</span>
            </li>
          </ul>
          <p class="btn-regist"><a href="javascript:;" onclick="checkyonghu();" ><img src="<%=path %>/img/btn-regist02.gif" width="223" height="30" alt="注册" /></a></p>
  		</fieldset>
      </form>
    </div>
  </div>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
  </BODY>
</html>
