
<html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body>
<%@include file="/header.jsp"%>
	<br/>
    <form action="${pageContext.request.contextPath}/client/ClientServlet?operation=regist" method="post">
    	*用户名：<input type="text" name="username"/><br/>
    	*昵称：<input type="text" name="nick"/><br/>
    	*密码：<input type="password" name="password"/><br/>
    	*电话：<input type="text" name="phonenum"/><br/>
    	*邮寄地址：<input type="text" name="address"/><br/>
    	*邮箱：<input type="text" name="email"/><br/>
    	<input type="submit" value="注册"/>
    </form>
  </body>
</html>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		color: #333;
		margin: 0;
		padding: 20px;
	}
	body {
		text-align: center; /* 让内容居中 */
		font-family: Arial, sans-serif;
	}

	form {
		display: inline-block; /* 使表单垂直居中 */
		margin: 0 auto; /* 水平居中 */
		padding: 20px;
		border: 1px solid #ddd; /* 边框样式 */
		border-radius: 8px; /* 圆角边框 */
		background-color: #f9f9f9; /* 背景色 */
	}

	input[type="text"],
	input[type="password"],
	input[type="email"] {
		width: 200px; /* 输入框宽度 */
		padding: 10px; /* 填充 */
		margin: 10px 0; /* 外边距 */
		border: 1px solid #ddd; /* 边框 */
		border-radius: 4px; /* 圆角 */
	}

	input[type="submit"] {
		width: 220px;
		padding: 10px;
		margin-top: 20px;
		border: none;
		border-radius: 4px;
		background-color: #4CAF50; /* 提交按钮颜色 */
		color: white; /* 文字颜色 */
		cursor: pointer; /* 鼠标样式 */
		font-size: 15px;
	}

	input[type="submit"]:hover {
		background-color: #45a049;
	}

</style>
