<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
 <!--  <div class="card card-login mx-auto mt-5">-->
	<div class="card text-white card-login bg-secondary o-hidden h-100 mx-auto mt-5">
		<div class="card-header">기존 상품 종류 정보 수정 </div>
		<div class="card-body bg-light">
			<form method="post" name="updateForm">
				<div class="form-group" >
				<input type="hidden" value="${vo.GDListNum }" name="gdListNum" id="gdListNum">
				<input type="hidden" value="${vo.GDListNum }" name="gdListNum" id="gdListNum">
				</div>
				<div class="form-group" >
					<label for="cpName" style="color:black">회사명</label> 
					<input
						type="text" class="form-control" id="cpName"
						name="cpName"  value="${cvo.cpName }"
						aria-describedby="emailHelp" disabled> 
					  <span style="color:red; font-size:12px;" id="cpchk"></span>
				</div>
				<div class="form-group">
					<label for="cpPhone" style="color:black">상품 종류</label> 
					<input type="text" class="form-control" 
						id="gdList"  value="${vo.GDList }"
						name="gdList" >
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
		var gdList=document.getElementById("gdList").value;
		if(index==1){
			document.updateForm.action="adindex.jsp?page=cpgoodsinfo.jsp";
		}
		if(index==2){
			document.updateForm.action="goods?cmd=gdUpdate";
		}
		document.updateForm.submit();
		
	}

</script>