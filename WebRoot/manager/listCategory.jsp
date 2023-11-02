<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/login/header.jsp"%>

	<table frame="border" width="68%">
		<tr>
			<th>选择</th>
			<th>序号</th>
			<th>分类名称</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
		 <c:forEach items="${applicationScope.cs}" var="c" varStatus="vs">
	    	<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
				<td>
					<input type="checkbox" name="ids" value="${c.id}"/>
				</td>
				<td>${vs.count}</td>
				<td>${c.name}</td>
				<td>${c.description}</td>
				<td>
<%--					[<a href="#">修改</a>]--%>
					[<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=DeleteCategory&id=${c.id}">删除</a>]
				</td>
			</tr>
    	</c:forEach>
	</table>
  </body>
</html>
<style>
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