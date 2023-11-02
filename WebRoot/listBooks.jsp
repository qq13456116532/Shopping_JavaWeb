<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
    <table style="font-size: 12px">
    	<tr>
    		<c:forEach items="${page.records}" var="b">
	    		<td>
	    			<img src="${pageContext.request.contextPath}/images/${b.photo}" alt="${b.name}"></img><br/>
					产品名：
					<c:choose>
						<c:when test="${fn:length(b.name) > 5}">
							${fn:substring(b.name, 0, 5)}...
						</c:when>
						<c:otherwise>
							${b.name}
						</c:otherwise>
					</c:choose><br/>

					产地：${b.author}<br/>
	    			原价：<strike>${b.price+888}</strike><br/>
	    			跳楼价：${b.price}<br/>
	    			<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=buy&bookId=${b.id}">购买</a>
	    		</td>
    		</c:forEach>
    	</tr>
    </table>
	<div style="text-align: center">
    <%@include file="/commons/page.jsp"%>
	</div>
  </body>
</html>
<style>
	/* styles.css */

	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		color: #333;
		margin: 0;
		padding: 20px;
	}

	table {
		width: 80%; /* 宽度调整为80% */
		margin: 20px auto; /* 水平居中并添加一些外边距 */
		border-collapse: collapse;
	}

	td {
		border: 1px solid #ddd;
		padding: 20px; /* 增加内边距 */
		text-align: center; /* 文本左对齐 */
		vertical-align: top;
	}

	img {
		width: 150px; /* 调整图片大小 */
		height: auto;
		border-radius: 5px;
		margin-bottom: 15px;
	}

	strike {
		color: #888;
	}

	a {
		display: inline-block;
		background-color: #28a745;
		color: white;
		padding: 10px 15px; /* 增加按钮的填充 */
		text-decoration: none;
		border-radius: 5px;
		margin-top: 10px;
	}

	a:hover {
		background-color: #218838;
	}

</style>
