<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻浏览</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="header-bar">
		<span class="header-title">SchoolNews--校园新闻网</span> <a
			class="header-button" href="login.jsp">登录</a>
	</div>

	<form action="admin.jsp" method="post">
		<div>
			用户名：<input name="username" type="text" />
		</div>
		<div>
			密码：<input name="password" type="password" />
		</div>
		<div>
			<input type="submit" value="登录">
		</div>
	</form>
</body>
</html>