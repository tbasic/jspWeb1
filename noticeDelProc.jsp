<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeDelProc.jsp</h3>
<%
String seq=request.getParameter("c");

String sql="delete from notices where seq="+seq;

//dbcon
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Connection con=DriverManager.getConnection(url,user,pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
int delcnt=pstmt.executeUpdate();

if(delcnt>0)
	response.sendRedirect("notice.jsp");
else
	out.write("삭제오류");
%>

</body>
</html>

<%

pstmt.close();
con.close();
%>
