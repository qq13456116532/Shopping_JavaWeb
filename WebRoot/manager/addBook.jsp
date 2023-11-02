<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/login/header.jsp"%>
	
	
    <form action="${pageContext.request.contextPath}/manager/ManagerServlet?operation=ReviseBooks" method="post" enctype="multipart/form-data">
  	<div class="divNormalClass">
  		产品名：<input type="text" name="name"  /><br/>
  		产地：<input type="text" name="author"/><br/>
  		单价：<input type="text" name="price" /><br/>
  		图片：<input type="file" name="image"/><br/>
  		描述：<textarea rows="3" cols="38" name="description" ></textarea><br/>
  		所属分类：<select name="categoryId" >
  			<c:forEach items="${applicationScope.cs}" var="c">
  				<option value="${c.id}">${c.name}</option>
  			</c:forEach>
  		</select>
  		<input type="submit" value="保存"/>
  	</div>
  </form> 
  </body>
</html>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		padding: 20px;
	}
	.divNormalClass {
		background: #fff;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		max-width: 500px;
		margin: auto;
		height: 450px;
	}
	.divNormalClass input[type="text"],
	.divNormalClass input[type="file"],
	.divNormalClass textarea,
	.divNormalClass select {
		width: calc(100% - 22px);
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
	}
	.divNormalClass input[type="submit"] {
		width: 100%;
		padding: 10px;
		border: none;
		border-radius: 4px;
		color: #fff;
		background-color: #007bff;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	.divNormalClass input[type="submit"]:hover {
		background-color: #0056b3;
	}
	.divNormalClass textarea {
		resize: vertical;
	}
</style>