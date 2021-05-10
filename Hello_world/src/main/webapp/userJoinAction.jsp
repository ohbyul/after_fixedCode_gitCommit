<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDTO" %>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW = null;
	if(request.getParameter("userID") != null){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPW") != null){
		userPW = (String) request.getParameter("userPW");
	}
	if(userID == null || userPW == null){
		System.out.println("userID : "+userID + "/userPW : "+userPW);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPW);
	
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료 되었습니다.');");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	
%>