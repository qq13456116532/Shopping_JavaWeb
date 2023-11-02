<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.twy.com/jsp/jstl/myfn" prefix="myfn" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>欢迎光临</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f9f9f9;
		}
		.navbar {
			background-color: #333;
			overflow: hidden;
			display: flex;
			justify-content: space-around;
			align-items: center;
			height: 50px;
		}
		.navbar a {
			background-color: #888888;
			color: white;
			padding: 14px 20px;
			text-decoration: none;
			font-size: 16px;
			flex-grow: 1;
			text-align: center;
			line-height: 50px;
			height: 100%;
		}
		.navbar a:hover, .navbar a.active {
			background-color: #555;
			color: white;
		}
		.category-links {
			background-color: white;
			padding: 10px;
		}
		.category-links .category-title {
			font-size: 16px;
			font-weight: bold;
			margin-right: 10px;
			color: #333;
		}
		.category-links a {
			background-color: #f2f2f2;
			color: #333;
			padding: 6px 12px;
			margin: 10px;
			text-decoration: none;
			border: 1px solid #ddd;
			border-radius: 4px;
			font-size: 14px;
			transition: background-color 0.3s, color 0.3s;
		}
		.category-links a:hover {
			background-color: #ddd;
			color: #555;
		}
		@media (max-width: 600px) {
			.navbar {
				flex-direction: column;
				height: auto;
			}
			.navbar a {
				flex-grow: 0;
			}
		}
	</style>
</head>
<body>
${message}
<br/>
<h1 style="text-align: center; font-size: 30px; color: #888888;">欢迎光临光伏商店<c:if test="${sessionScope.user!=null}">，${sessionScope.user.nick}</c:if><c:if test="${sessionScope.user==null}">，请先登录</c:if></h1><br/>
<nav class="navbar">
	<a href="${pageContext.request.contextPath}/index.jsp">首页</a>
	<c:if test="${sessionScope.user==null}">
		<a href="${pageContext.request.contextPath}/regist.jsp">注册</a>
		<a href="${pageContext.request.contextPath}/login.jsp">登陆</a>
	</c:if>
	<c:if test="${sessionScope.user!=null}">
		<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=logout">注销</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=showSelfOrders">我的订单</a>
	<a href="${pageContext.request.contextPath}/showCart.jsp">购物车</a>
</nav>
<section class="category-links">
	<span class="category-title">商品分类：</span>
	<c:forEach items="${applicationScope.cs}" var="c">
		<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=showCategoryBooks&categoryId=${c.id}">${c.name}</a>
	</c:forEach>
</section>
</body>
</html>
