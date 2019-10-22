<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id=(String)session.getAttribute("id");
    
    %>
	<nav class="navbar fixed-top navbar-dark bg-dark">
  <a class="navbar-brand" href="adindex.jsp?page=main.jsp">로고 </a>
  <ul class="nav justify-content-end">
	  <li class="nav-item">
	  <%
	  		if(id!=null){
	  			
	  	%>
	  		 <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=id %>님이 접속하셨습니다.</a>
	  	<% 		
	  		}else{
	  	%>
	  		 <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">관리자 페이지</a>
	  	<%
	  		}
		  %>
	   
	  </li>	  
	  <li class="nav-item">
	    <a class="nav-link" href="adlogin?cmd=adminlogout">로그아웃</a><!-- 로그아웃시 로그인 폼으로 -->
	  </li>
	</ul>
	</nav>