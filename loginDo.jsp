<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		
		String jdbcDriver = "jdbc:mysql://localhost/billingdb"+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		
		String d_user = "root";
		String d_password = "ado13!@";
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String query = "SELECT id FROM Account WHERE id = '"+id+"'";
		
		conn = DriverManager.getConnection(jdbcDriver,d_user,d_password);

		stmt = conn.prepareStatement(query);
		
		rs = stmt.executeQuery(query);
		
		rs.next();
		
		if(rs.getString("id") != null){
			session.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request,response);
			return ;
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("error_login", "ID or Password is wrong.");
			rd.forward(request,response);
			return ;
		}
	
	}
	catch(SQLException ex){
		out.println(ex.getMessage());
	}
	finally{
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}

	}
	
%>
