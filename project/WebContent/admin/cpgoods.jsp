<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  goods -->

<div class="container">
 <!--  <div class="card card-login mx-auto mt-5">-->
	<div class="card text-white card-login bg-secondary o-hidden h-100 mx-auto mt-5">
		<div class="card-header">상품 분류 등록</div>
		<div class="card-body bg-light">
			<form>
				<div class="form-group" action="/admin?cmd=cpInsert" onsubmit="return validate()">
					<label for="exampleInputEmail1">상품</label> 
					<!-- 사명 중복체크하기 -->
					<input
						type="email" class="form-control" id="cpName"
						aria-describedby="emailHelp" placeholder="회사명"> 
					<small id="cpchk" class="form-text text-muted"> </small>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">상품종류 등록</label> <input
						type="password" class="form-control" id="cpPhone"
						placeholder="상품종류 등록">
						<small id="cpPhonesmall" class="form-text text-muted">하이픈(-)제외 입력</small>
				</div>
				<div class="col-lg-15 text-center">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>