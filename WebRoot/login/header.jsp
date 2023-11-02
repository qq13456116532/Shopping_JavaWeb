<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.twy.com/jsp/jstl/myfn" prefix="myfn" %>
<html>
<head>

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"></link>
</head>

<body>
	${message}
	<br/>
	<h1>后台管理</h1><br/>
	<br/><br/>

	<a href="${pageContext.request.contextPath}/manager/addCategory.jsp">添加分类</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showAllCategories">查询分类</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showAddBook">添加产品</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showBooks">查看产品</a>
	<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=showPayedOrders">订单查询</a>

<%--	 <c:forEach items="${applicationScope.menus}" var="m">--%>
<%--	 	<a href="${pageContext.request.contextPath}${m.uri}">${m.name}</a>--%>
<%--	 </c:forEach>--%>
	<br/><br/><br/>
	
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		padding: 20px;
	}
	h1 {
		color: #333;
		text-align: center;
	}
	a {
		display: inline-block;
		margin: 10px;
		padding: 10px 15px;
		background-color: #007bff;
		color: #fff;
		border-radius: 4px;
		text-decoration: none;
		transition: background-color 0.3s ease;
	}
	a:hover {
		background-color: #0056b3;
	}
</style>