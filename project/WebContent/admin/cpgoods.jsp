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
					<label for="exampleInputEmail1" style="color:black">회사 선택</label> 
				<select class="custom-select">
				  <option selected>select company</option>
				  <option value="1">One</option>
				 
				</select>
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