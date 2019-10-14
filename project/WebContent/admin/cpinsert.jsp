<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header">신규 회사 정보 등록</div>
		<div class="card-body">
	
			<form action="company?cmd=cpInsert" method="post" >
				<div class="form-group" >
					<label for="cpName">회사명</label> 
					<!-- 사명 중복체크하기 -->
					<input
						type="text" class="form-control" id="cpName"
						name="cpName" onkeyup="cpcheck()"
						aria-describedby="emailHelp" placeholder="회사명"> 
					<small id="cpchk" class="form-text text-muted"> </small>
				</div>
				<div class="form-group">
					<label for="cpPhone">회사 대표 번호</label> <input
						type="text" class="form-control" id="cpPhone"
						name="cpPhone" placeholder="연락처 입력">
						<small id="cpPhonesmall" class="form-text text-muted">하이픈(-)제외 입력</small>
				</div>
				<div class="col-lg-15 text-center">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	var cxhr=null;
	function cpcheck(){
		cxhr=new XMLHttpRequest();
		var cpName=document.getElementById("cpName").value;
		cxhr.onreadystatechange=cpchkcallback;
		cxhr.open('get', 'company?cmd=cpCheck&cpName='+cpName,true);
		cxhr.send();
	}
	function cpchkcallback(){
		if(cxhr.readyState==4 && cxhr.status==200){
			
		}
	}
</script>