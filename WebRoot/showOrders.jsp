<html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body>
<%@include file="/header.jsp"%>
	<br/>
	<h3>您的订单信息如下</h3>
	
	<c:if test="${empty os}">
		<h4>您还没有下过任何订单</h4>
	</c:if>
    <c:if test="${!empty os}">
    	<table style="font-size: 12px" width="68%" border="1">
	    	<tr>
	    		<th>订单号</th>
	    		<th>数量</th>
	    		<th>订单金额</th>
	    		<th>订单状态</th>
	    		<th>操作</th>
	    	</tr>
	    	<c:forEach items="${os}" var="o" varStatus="vs">
	    		<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
		    		<td><a href="${pageContext.request.contextPath}/client/ClientServlet?operation=showOrdersDetail&ordersId=${o.id}">${o.ordersnum}</a></td>
		    		<td>${o.num}</td>
		    		<td>${o.money}</td>
		    		<td>${o.status==0?'未付款':(o.status==1?'已付款':'已发货')}</td>
		    		<td>
		    			[<a href="#">修改</a>]
		    			[<a href="#">删除</a>]
		    			[<a href="http://localhost:8080/day21_onlinepay/pay.jsp?ordersnum=${o.ordersnum}&money=0.01">付款</a>]
		    		</td>
		    	</tr>
	    	</c:forEach>
	    </table>
    </c:if>
  </body>
</html>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 20px;
		background-color: #f4f4f4;
		color: #333;
	}

	h3 {
		color: #333;
		margin-bottom: 20px;
	}

	h4 {
		color: #666;
	}

	table {
		width: 68%; /* 调整宽度 */
		margin: 0 auto; /* 居中显示 */
		border-collapse: collapse; /* 边框合并 */
		background-color: #fff;
	}

	th, td {
		padding: 8px; /* 单元格填充 */
		text-align: left; /* 文本对齐 */
		border-bottom: 1px solid #ddd; /* 底部边框 */
	}

	th {
		background-color: #4CAF50; /* 标题背景颜色 */
		color: white;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2; /* 交替行背景颜色 */
	}

	tr:hover {
		background-color: #ddd; /* 鼠标悬停行背景颜色 */
	}

	a {
		color: #0275d8;
		text-decoration: none;
	}

	a:hover {
		text-decoration: underline;
	}

	/* 特定于操作列的样式 */
	td:last-child {
		text-align: center; /* 操作列居中对齐 */
	}

</style>