<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header bg-dark text-white" >로그인</div>
		<div class="card-body">
			<form action="adlogin?cmd=adminlogin" method="post">
				<div class="form-group" >
					<label for="cpId">아이디</label> 
					<!-- 사명 중복체크하기 -->
					<input
						type="text" class="form-control" id="id" name="id" 
						aria-describedby="emailHelp" placeholder="id" > 
				</div>
				<div class="form-group">
					<label for="cpPwd">비밀번호</label> 
					<input type="password" class="form-control"  id="pwd" 
						name="pwd" placeholder="password">				
				</div>
				<div class="col-lg-15 text-center">
					<button type="submit" class="btn btn-primary" >로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>