<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%
   String id=request.getParameter("id");
   String email=request.getParameter("email");
 	String pwd=null;
   Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean pwdusing=false;
	try{
		con=JdbcUtil.getConn();
		String sql="select pwd from account where id=? and email=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			pwdusing=true;
			pwd=rs.getString("pwd");
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JdbcUtil.close(con,pstmt,rs);
	}
   
   %>
<!DOCTYPE html>
<html>
<head>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Design System for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Argon Design System - Free Design System for Bootstrap 4</title>
  <!-- Favicon -->
  <link href="../assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="../assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="../assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="../assets/css/argon.css?v=1.1.0" rel="stylesheet">
</head>
<body>
  <main>
    <section class="section section-shaped section-lg">
      <div class="shape shape-style-1 bg-gradient-default">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="container pt-lg-md">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="card bg-secondary shadow border-0">
              
              <%
              if(pwdusing==false){
                  %>
              <div class="card-body px-lg-5 py-lg-5">
                <div class="text-center text-muted mb-4">
                  <small>비밀번호 찾기 결과</small>
                  
                </div>
                <form method="post" action="login.jsp"  name="frm1">
                <div class="col-12"><span style="color:gray; font-size:12px">회원님의 아이디:</span></div>
                  
                    <div class="input-group input-group-alternative mb-3">                  
                      <input class="form-control" id="checkId4" placeholder="ID" type="text"  readonly="readonly" value="입력하신 정보가 없습니다.">
                      <div class="col-12">
                    </div>
                  </div>
                  
               
             
                  
                  <div class="text-center">
                    <button type="button" class="btn btn-primary mt-4" onclick="research();">다시 검색하기</button>
                    <button type="submit" class="btn btn-primary mt-4">로그인 하러 가기</button>
                  </div>
                </form>
              </div>
             	<%
                  }else{
             	%>
             	<div class="card-body px-lg-5 py-lg-5">
                <div class="text-center text-muted mb-4">
                  <small>비밀번호 찾기 결과</small>
                  
                </div>
                <form method="post" action="login.jsp"  name="frm1">
                <div class="col-12"><span style="color:gray; font-size:12px">회원님의 아이디:</span></div>
                  
                    <div class="input-group input-group-alternative mb-3">                  
                      <input class="form-control" id="checkId4" placeholder="ID" type="text"  readonly="readonly" value="<%=id %>">
                      <div class="col-12">
                    </div>
                  </div>
                  <div class="col-12"><span style="color:gray; font-size:12px" >회원님의 이메일:</span></div>
                  <div class="form-group">
                  
                    <div class="input-group input-group-alternative mb-3">
                      
                      <input class="form-control" placeholder="Email" type="email"  readonly="readonly" id="checkEmail4" value=<%=email %>>
                    </div>
                  </div>
                  <div class="col-12"><span style="color:gray; font-size:12px">회원님의 비밀번호:</span></div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <input class="form-control" placeholder="Password" type="text" id="checkPassword4"  readonly="readonly" value="<%=pwd %>">
                    </div>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary mt-4" onclick="research();">다시 검색하기</button>
                    <button type="submit" class="btn btn-primary mt-4">로그인 하러 가기</button>
                  </div>
                </form>
              </div>
              <%
                  }
              %>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
<script type="text/javascript">
	function research(){
	history.go(-1);
	}
</script>
  <!-- Core -->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/popper/popper.min.js"></script>
  <script src="../assets/vendor/bootstrap/bootstrap.min.js"></script>
  <script src="../assets/vendor/headroom/headroom.min.js"></script>
  <!-- Argon JS -->
  <script src="../assets/js/argon.js?v=1.1.0"></script>
</body>
</html>