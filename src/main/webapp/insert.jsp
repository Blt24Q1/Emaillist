<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	데이터베이스 접속 정보 확인
ServletContext context = getServletContext();

String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");

//	폼 입력 데이터
String firstName = request.getParameter("fn");	//	이름
String lastName = request.getParameter("ln");	//	성
String email = request.getParameter("email");	//	이메일

String dburl = "jdbc:oracle:thin:@localhost:1521:xe";

try {
	//	드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//	커넥션 얻기
	Connection conn = DriverManager(dburl, dbuser, dbpass);
	//	실행 계획
	String sql = "INSERT INTO emaillist (no, last_name, first_name, email)" + 
			" VALUES (seq_emaillist_pk.nextval, ?, ?, ?)"; 
	//	PreparedStatment
	PreparedStatement pstm = conn.prepareStatement(sql);
}