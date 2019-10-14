<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header">신규 회사 정보 등록</div>
		<div class="card-body">
	
			<form action="company?cmd=cpInsert" method="post" onsubmit="return validate()">
				<div class="form-group" >
					<label for="cpName">회사명</label> 
					<!-- 사명 중복체크하기 -->
					<input
						type="text" class="form-control" id="cpName"
						name="cpName" onkeyup="cpcheck()"
						aria-describedby="emailHelp" placeholder="회사명" > 
					  <span style="color:red; font-size:12px;" id="cpchk"></span>
				</div>
				<div class="form-group">
					<label for="cpPhone">회사 대표 번호</label> 
					<input type="text" class="form-control" 
						id="cpPhone" 
						name="cpPhone" placeholder="대표 번호">
						<small id="cpPhonesmall" class="form-text text-muted">하이픈(-)제외 입력</small>
						 <span style="color:red; font-size:12px;" id="phonechk"></span>
				
				</div>
				<div class="col-lg-15 text-center">
					<button type="submit" class="btn btn-primary" disabled="disabled">등록</button>
					<button type="submit" class="btn btn-primary">다음</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	var check=true;
	var cxhr=null;
	var cpchk=document.getElementById("cpchk");
	var phonechk=document.getElementById("phonechk");

	function cpcheck(){
		cxhr=new XMLHttpRequest();
		var cpName=document.getElementById("cpName").value;
		if(cpchk==""){
			cpchk.innerHTML="";
			return;
		}
		cxhr.onreadystatechange=cpchkcallback;
		cxhr.open('get', 'company?cmd=cpCheck&cpName='+cpName,true);
		cxhr.send();
	}
	function cpchkcallback(){
		if(cxhr.readyState==4 && cxhr.status==200){
			var data=cxhr.responseText;
			var using=JSON.parse(data);
			if(using.using==true){
				cpchk.innerHTML="동명의 회사가 존재합니다."
				check = false;
				return check;
				validate();
			}else{
				cpchk.innerHTML="";
				check=true;
				return check;
				validate();
			}
		}
	}
	
	function validate(){
		var cpPhone=document.getElementById("cpPhone").value;
		if(cpPhone==""){
			phonechk.innerHTML="전화번호 입력 필수";
			return false;
		}
		return check;
	}
</script>