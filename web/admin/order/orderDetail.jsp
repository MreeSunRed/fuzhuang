<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table cellspacing="1" cellpadding="0" width="100%" border="0" bgcolor="#F7F3F7">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;订单明细&nbsp;</td>
				</tr>
          <tr height="26">
              <td class="blackTitle" align="center">服装名称</td>
              <td class="blackTitle" align="center">购买数量</td>
              <td class="blackTitle" align="center">购买价格</td>
          </tr>
		  <c:forEach items="${requestScope.orderItemList}" var="orderItem">
		  <tr class="text" align="center" bgcolor="#FFFFFF">
			  <td>${orderItem.goods.mingcheng}</td>
			  <td>${orderItem.goods_quantity}</td>
			  <td>${orderItem.goods.shichangjia}</td>
		  </tr>
		  </c:forEach>
  	</table>
	</body>
</html>
