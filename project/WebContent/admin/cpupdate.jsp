<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
 <!--  <div class="card card-login mx-auto mt-5">-->
	<div class="card text-white card-login bg-secondary o-hidden h-100 mx-auto mt-5">
		<div class="card-header">파트너 회사 정보 수정</div>
		<div class="card-body bg-light">
			<form method="post" name="updateForm">
				<div class="form-group" >
				<input type="hidden" value="${vo.cpNum }" name="cpNum" id="cpNum">
				</div>
				<div class="form-group" >
					<label for="cpName" style="color:black">회사명</label> 
					<!-- 사명 중복체크하기 -->
					<input
						type="text" class="form-control" id="cpName"
						name="cpName"  value="${vo.cpName }"
						aria-describedby="emailHelp" placeholder="회사명" > 
					  <span style="color:red; font-size:12px;" id="cpchk"></span>
				</div>
				<div class="form-group">
					<label for="cpPhone" style="color:black">회사 대표 번호</label> 
					<input type="text" class="form-control" 
						id="cpPhone"  value="${vo.phone }"
						name="cpPhone" placeholder="대표 번호">
						<small id="cpPhonesmall" class="form-text text-muted">하이픈(-)제외 입력</small>
						 <span style="color:red; font-size:12px;" id="phonechk"></span>
				
				</div>
				<div class="col-lg-15 text-center">
					<button type="button" class="btn btn-secondary" onclick="updateSubmit(1)">취소</button>
					<button type="button" class="btn btn-primary" onclick="updateSubmit(2)">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	function updateSubmit(index){
		var cpNum=document.getElementById("cpNum").value;
		if(index==1){
			document.updateForm.action="adindex.jsp?page=cpinfo.jsp";
		}
		if(index==2){
			document.updateForm.action="company?cmd=cpUpdate";
		}
		document.updateForm.submit();
		
	}

</script>
