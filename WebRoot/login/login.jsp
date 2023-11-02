<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
  
  <body>
  <h1 style="text-align: center">后台管理系统</h1>
    <form action="${pageContext.request.contextPath}/manager/ManagerServlet?operation=login" method="post">
    	用户名：<input type="text" name="username"/><br/>
    	密码：<input type="password" name="password"/><br/>
    	 <input type="submit" value="登陆"/>
    </form>
  </body>
</html>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 10px;
        margin: 180px auto;
    }
    form {
        max-width: 300px;
        margin: 10px auto;
        padding: 20px;
        border: 1px solid #ddd;
        background: #fff;
    }
    input[type="text"], input[type="password"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        color: #fff;
        background-color: #007bff;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>