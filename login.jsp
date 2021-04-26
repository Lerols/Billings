<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String isError = (String)request.getAttribute("error_login");
		if(isError != null){ %>
			<script>
				alert("Password or ID is not correct!");
			</script>
		<%}%>

	<h1>login</h1>
	<hr>
	<div class="contents">
		<%
		if(session != null && session.getAttribute("id")!=null){
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request,response);
			return ;
		}
		%>
		<form class="fc" method="post" action="loginDo.jsp" >
			ID: <input type="text" name="id"><br>
			PASSWORD: <input type="password" name="pwd"><br>
			<input type="submit" value="login">
		</form>
	</div>
</body>
</html>