<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
<%
	//세션영역 무효화하기
	session.invalidate();
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>
