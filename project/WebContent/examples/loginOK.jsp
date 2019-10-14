<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<<<<<<< HEAD
   <%
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      String chk=request.getParameter("chk");
      if(chk!=null){
         Cookie cook1=new Cookie("id1",id);
         cook1.setMaxAge(60*60*24*30);
         response.addCookie(cook1);
      }else{
         Cookie cook1=new Cookie("id1","");
         cook1.setMaxAge(0);
         response.addCookie(cook1);
         
      }
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = JdbcUtil.getConn();
         String sql = "select * from account where id=? and pwd=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, pwd);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            session.setAttribute("id", id);
            session.setAttribute("pwd", pwd);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
         } 
   %>
   <script type="text/javascript">
      alert("아이디 또는 비밀번호 오류");
      history.go(-1);
   </script>
   <%
      
      } catch (SQLException se) {
         se.printStackTrace();
      } finally {
         JdbcUtil.close(con, pstmt, rs);
      }
   %>
=======
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = JdbcUtil.getConn();
			String sql = "select * from account where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			} 
	%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호 오류");
		history.go(-1);
	</script>
	<%
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	%>
>>>>>>> branch 'master' of https://github.com/dbLee1995/DBDB.git
</body>
</html>