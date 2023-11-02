<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/login/header.jsp"%>
	<table frame="border" width="68%">
		<tr>
			<th>产品名</th>
			<th>产地</th>
			<th>单价</th>
			<th>描述</th>
			<th>所属分类</th>
			<th>图片</th>
			<th>操作</th>
		</tr>
		 <c:forEach items="${page.records}" var="b" varStatus="vs">
	    	<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
				<td nowrap="nowrap"><c:choose>
					<c:when test="${fn:length(b.name) > 5}">
						${fn:substring(b.name, 0, 5)}...
					</c:when>
					<c:otherwise>
						${b.name}
					</c:otherwise>
				</c:choose><br/></td>
				<td nowrap="nowrap">${b.author}</td>
				<td nowrap="nowrap">${b.price}</td>
				<td nowrap="nowrap">${b.description}</td>
				<td nowrap="nowrap">${myfn:showCategoryName(b.categoryId)}</td>
				<td nowrap="nowrap">
<%--					<a href="${pageContext.request.contextPath}/images/${b.photo}">查看图片</a>--%>
	<img src="${pageContext.request.contextPath}/images/${b.photo}" alt="图片不可见">
				</td>
				<td nowrap="nowrap">
					[<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=SingleBooks&bookid=${b.id}">修改</a>]
					[<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=DeleteBook&bookid=${b.id}">删除</a>]
				</td>
			</tr>
    	</c:forEach>
	</table>
    <%@include file="/commons/page.jsp" %>
  </body>
</html>
<style>
	img {
		width: 150px; /* 调整图片大小 */
		height: auto;
		border-radius: 5px;
		margin-bottom: 15px;
	}
	table {
		width: 68%;
		border-collapse: collapse;
		margin: auto;
	}
	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}
	th {
		background-color: #4CAF50;
		color: white;
	}
	tr:nth-child(even) {
		background-color: #f2f2f2;
	}
	tr:hover {
		background-color: #ddd;
	}
	a {
		color: #ffffff;
		text-decoration: none;
	}
	a:hover {
		text-decoration: underline;
	}
</style>