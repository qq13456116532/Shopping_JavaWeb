<html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body>
<%@include file="/header.jsp"%>
	<br/>
	<h3 style="text-align: center">您购买的光伏产品如下</h3>
	
	<c:if test="${empty sessionScope.cart.items}">
		<h4 style="text-align: center">您还没有购买任何光伏产品</h4>
	</c:if>
	<c:if test="${!empty sessionScope.cart.items}">
	    <table style="font-size: 12px" width="68%" border="1">
	    	<tr>
	    		<th>产品名</th>
	    		<th>产地</th>
	    		<th>单价</th>
	    		<th>数量</th>
	    		<th>小计</th>
	    		<th>操作</th>
	    	</tr>
	    	<c:forEach items="${sessionScope.cart.items}" var="me" varStatus="vs">
	    		<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
		    		<td>${me.value.book.name}</td>
		    		<td>${me.value.book.author}</td>
		    		<td>${me.value.book.price}</td>
		    		<td>${me.value.num}</td>
		    		<td>${me.value.price}</td>
		    		<td>
		    			[<a href="#">删除</a>]
		    		</td>
		    	</tr>
	    	</c:forEach>
	    	<tr>
	    		<td colspan="6">
	    			总计数量：${sessionScope.cart.totalNum}&nbsp;&nbsp;
	    			应付款：${sessionScope.cart.totalPrice}&nbsp;&nbsp;
	    			<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=genOrders">生成订单</a>
	    		</td>
	    	</tr>
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
a{
	background-color: #dddddd;
}
	h3 {
		color: #333;
		margin-bottom: 20px;
	}

	h4 {
		color: #666;
	}

	table {
		width: 68%;
		margin: 0 auto;
		border-collapse: collapse;
		background-color: #fff;
	}

	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}

	th {
		background-color: #333333;
		color: white;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	tr:hover {
		background-color: #ddd;
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
		text-align: center;
	}

	/* 总计行的样式 */
	table tr:last-child {
		background-color: #888888;
		color: white;
		font-weight: bold;
	}

</style>