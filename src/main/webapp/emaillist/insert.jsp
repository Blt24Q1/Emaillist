<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@page import="himedia.vo.EmailVo"%>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
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

EmailVo vo = new EmailVo(lastName, firstName, email);
EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);

boolean success = dao.insert(vo);

if (success) {	//	INSERT 성공
	response.sendRedirect(request.getContextPath() + "/emaillist/");
} else {
	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 입력 중 오류가 발생했습니다.");
}
%>