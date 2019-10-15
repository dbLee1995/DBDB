<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  goods -->

<div class="container">
 <!--  <div class="card card-login mx-auto mt-5">-->
	<div class="card text-white card-login bg-secondary o-hidden h-100 mx-auto mt-5">
		<div class="card-header">상품 카테고리 등록</div>
		<div class="card-body bg-light">
			<form action="" method="post" onsubmit="return validate()">
				<div class="form-group" >
					<label for="cpName" style="color:black">회사 선택</label> 
					<!-- 사명 중복체크하기 -->
					<select class="custom-select" id="cpSelect">
					  <option selected >select company</option>
					</select>
				</div>
				<div class="form-group">
					<label for="cpPhone" style="color:black">상품 종류 등록</label> 
					<input type="text" class="form-control" 
						id="cpPhone" 
						name="cpPhone" placeholder="상품 종류">
					<!-- 	<small id="cpPhonesmall" class="form-text text-muted" >*필수 입력</small>  -->
						<span style="color:red; font-size:12px;" id="phonechk"></span>
				
				</div>
				<div class="col-lg-15 text-center">
					<button type="button" class="btn btn-secondary">취소</button>
					<button type="button" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	window.onload=companyList;
	var cpxhr=null;
	function companyList(){
		cpxhr=new XMLHttpRequest();
		cpxhr.onreadystatechange=goodscallback;
		cpxhr.open('post', 'goods?',true);//상대경로
		cpxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="cmd=goodsList";
		cpxhr.send(param);
	}
	function goodscallback(){
		if(cpxhr.readyState==4 && cpxhr.status==200){
			var cpSelect=document.getElementById("cpSelect");
			var opt=document.createElement("option");
			var data=cpxhr.responseText;
			var list=JSON.parse(data)[0];
			for(var i=0;i<list.length;i++){
				opt.value=list[i].cpName;
				opt.text=list[i].cpName;
			}
			cpSelect.appendChild(opt);
			
		}
	}
	
	

</script>