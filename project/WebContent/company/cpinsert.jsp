<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header">신규 회사 정보 등록</div>
		<div class="card-body">
	
			<form>
				<div class="form-group">
					<label for="exampleInputEmail1">회사명</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter email"> <small
						id="emailHelp" class="form-text text-muted">We'll never
						share your email with anyone else.</small>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">회사 대표 연락처</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						placeholder="Password">
				</div>
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<label class="form-check-label" for="exampleCheck1">Check
						me out</label>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<div class="text-center">
				<a class="d-block small mt-3" href="register.html">Register an
					Account</a> <a class="d-block small" href="login.html">Login Page</a>
			</div>
		</div>
	</div>
</div>