<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理页面</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<%
		// 设置中文编码
		request.setCharacterEncoding("utf-8");
		// 连接数据库
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/schoolnews?useUnicode=true&characterEncoding=utf8";
		String username = "root";
		String password = "Easy@0122";
		Connection conn = DriverManager.getConnection(url, username, password);
		// 准备执行插入sql语句
		String sql = "insert into news(type,title,time,content)values(?,?,?,?)";
		PreparedStatement st = conn.prepareStatement(sql);// 在此次传入，进行预编译
		// 将表单传递过来的数据，放入sql语句指定位置
		st.setString(1, request.getParameter("type"));
		st.setString(2, request.getParameter("title"));
		st.setString(3, request.getParameter("time"));
		st.setString(4, request.getParameter("content"));
		// 执行sql
		st.execute();
	%>
	<div class="header-bar">
		<span class="header-title">SchoolNews--管理后台</span>
	</div>
	<h1>发布成功</h1>
</body>
</html>