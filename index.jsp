<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome to OUR page</title>
</head>
<body>
	<h1>index page</h1>
	<hr>
	<div class="contents">
		<p>Welcome our service</p>
		<%
		if(session != null && session.getAttribute("id") != null){
		%>
			<a href="#">logout</a><br>
			<a href="search.jsp">search</a>
		<%
		}else {%>
			<a href="login.jsp">login</a>
		<%}%>
	</div>
</body>
</html>