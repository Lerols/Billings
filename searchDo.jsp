<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.Prototype.beans.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		
		String jdbcDriver = "jdbc:mysql://localhost/billingdb"+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		
		String d_user = "root";
		String d_password = "ado13!@";
		
		String id_number = request.getParameter("id_number");
		String name = request.getParameter("name");
		String status = request.getParameter("rb");
		String school = request.getParameter("s");
		String query="";
		
		if(status == "s"){
			status = "students";
		}else if(status == "p"){
			status = "professor";
		}
		else{
			
		}
		
		if(id_number != null && name == null){
			query = "SELECT * FROM " + status + " WHERE id_ = '"+id_number+"'";
		}else if(id_number == null && name != null){
			query = "SELECT * FROM " + status + " WHERE name = '"+name+"'";
			
		}else{
			//error ���
			// �ٽ� �Է��ϵ��� �Ѵ�.
		}
		
		conn = DriverManager.getConnection(jdbcDriver,d_user,d_password);

		stmt = conn.prepareStatement(query);
		
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			// ǥ�� ����� �ϴµ�, page�� �ѱ�� �������� �ۼ��Ѵ�.
			// ajax�� ����� ���̱� ������, ajax���� page�� ǥ�� ������ �� �ִ� ������ �ѱ��.
			
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