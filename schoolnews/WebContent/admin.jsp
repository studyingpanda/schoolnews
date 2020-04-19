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
		request.setCharacterEncoding("utf-8");
		String inputUsername = request.getParameter("username");
		String inpputPassword = request.getParameter("password");
		if (inputUsername == null || "".equals(inputUsername) || inpputPassword == null
				|| "".equals(inpputPassword)) {
			request.getRequestDispatcher("error_nologin.jsp").forward(request, response);
		}

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/schoolnews?useUnicode=true&characterEncoding=utf8";
		String username = "root";
		String password = "Easy@0122";
		Connection conn = DriverManager.getConnection(url, username, password);
		String sql = "select * from user where username=? and password=?";
		PreparedStatement st = conn.prepareStatement(sql);// 在此次传入，进行预编译
		st.setString(1, inputUsername);
		st.setString(2, inpputPassword);
		ResultSet rs = st.executeQuery();
		if (rs.next() == false) {
			request.getRequestDispatcher("error_nologin.jsp").forward(request, response);
		}
	%>
	<div class="header-bar">
		<span class="header-title">SchoolNews--管理后台</span> <a
			class="header-button" href="#">欢迎您：<%=rs.getString("username")%></a>
	</div>
	<h1 class="article-title">发布新闻</h1>
	<form action="publish.jsp" method="post">
		<div>
			类型：<input name="type" type="text" />
		</div>
		<div>
			标题：<input name="title" type="text" />
		</div>
		<div>
			时间：<input name="time" type="date" />
		</div>
		<div>
			内容：<br>
			<textarea name="content" rows="10" cols="100">
			</textarea>
		</div>
		<div>
			<input type="submit" value="提交">
		</div>
	</form>
</body>
</html>