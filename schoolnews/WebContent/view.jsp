<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻浏览页</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="header-bar">
		<span class="header-title">SchoolNews--校园新闻网</span> <a
			class="header-button" href="login.jsp">登录</a>
	</div>
	<div>
		<%
		//加载数据库驱动
		Class.forName("com.mysql.jdbc.Driver");
		//数据库连接参数
		String url = "jdbc:mysql://localhost:3306/schoolnews";
		String username = "root";
		String password = "Easy@0122";
		//获取数据库连接
		Connection conn = DriverManager.getConnection(url, username, password);
		//定义数据库操作sql语句
		String sql = "select * from news";
		PreparedStatement st = conn.prepareStatement(sql);// 在此次传入，进行预编译
		//执行查询，结果放入ResultSet对象rs
		ResultSet rs = st.executeQuery();
		%>
		<table class="news_table">
			<thead>
				<tr>
					<td>分类</td>
					<td>标题</td>
					<td>时间</td>
				</tr>
			</thead>
			<tbody>
				<%
				//对查询结果的每一行
				while (rs.next()) {
					//拼接html代码块
					String row = "";
					row += "<tr>";
					row += "<td>" + rs.getString("type") + "</td>";
					row += "<td><a href='article.jsp?id=" + rs.getString("id") + "'>" + rs.getString("title") + "</a></td>";
					row += "<td>" + rs.getString("time") + "</td>";
					row += "</tr>";
					//打印到网页上
					out.write(row);
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>