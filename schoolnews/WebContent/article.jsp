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
	<div>
		<%
			Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/schoolnews?characterEncoding=UTF-8";
		String username = "root";
		String password = "Easy@0122";
		Connection conn = DriverManager.getConnection(url, username, password);
		String id = request.getParameter("id");
		String sql = "select * from news where id=" + id;
		PreparedStatement st = conn.prepareStatement(sql);// 在此次传入，进行预编译
		ResultSet rs = st.executeQuery();
		rs.next();
		%>
		<h1 class="article-title"><%=rs.getString("title")%></h1>
		<div><%=rs.getString("content")%></div>
	</div>
</body>
</html>