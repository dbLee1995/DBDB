<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  goods -->
<script>


</script>
<div class="container">
 <!--  <div class="card card-login mx-auto mt-5">-->
	<div class="card text-white card-login bg-secondary o-hidden h-100 mx-auto mt-5">

		<div class="card-header">상품 카테고리 등록</div>
		<div class="card-body bg-light">
			<form method="post" name="gdForm"  >
				<div class="form-group" >
					<label for="cpSelect" style="color:black">회사 선택</label> 
					<!-- 사명 중복체크하기 -->
					<select class="custom-select" id="cpSelect" name="cpList" onchange="selectChange(this)">
					  <option selected id="optSelect" value="0" >select company</option>
					</select>
				</div>
				<div class="form-group">
					<label for="gdList" style="color:black">상품 종류 등록</label> 
					<input type="text" class="form-control" 
						id="gdList" onkeyup="gdListchk()" disabled
						name="gdList" placeholder="상품 종류">
					<!-- 	<small id="cpPhonesmall" class="form-text text-muted" >*필수 입력</small>  -->
						<span style="color:red; font-size:12px;" id="gdListCheck"></span>
				
				</div>
				<div class="col-lg-15 text-center">
					<button type="button" class="btn btn-secondary" onclick="insertSubmit(1)">취소</button>
					<button type="button" class="btn btn-primary" onclick="insertSubmit(2)" >등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

	window.onload=companyList;
	var cpxhr=null;
	var check=true;
	
	function companyList(){
		cpxhr=new XMLHttpRequest();
		cpxhr.onreadystatechange=cpCallback;
		cpxhr.open('post', 'goods?',true);//상대경로
		cpxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param="cmd=cpList";
		cpxhr.send(param);
	}
	function cpCallback(){
		if(cpxhr.readyState==4 && cpxhr.status==200){
			var cpSelect=document.getElementById("cpSelect");
			var data=cpxhr.responseText;
			var list=JSON.parse(data)[0];
			for(var i=0;i<list.length;i++){
				var opt=document.createElement("option");
				opt.value=list[i].cpNum;
				opt.text=list[i].cpName;
				cpSelect.appendChild(opt);
			}
		}
	}
	var glxhr=null;
	var cpListNum=null;
	var gdListCheck= document.getElementById("gdListCheck");
	function gdListchk(){
		var gdList=document.getElementById("gdList").value;
		var cpList=document.getElementsByName("cpList")[0];
		var cpIndex=cpList.selectedIndex;
		cpListNum=cpList.options[cpIndex].value;
		if(gdListCheck==""){
			gdListCheck.innerHTML="";
			check=false;
			return check;
		}
		glxhr=new XMLHttpRequest();
		glxhr.onreadystatechange=gdlistCallback;
		glxhr.open('post','goods?',true);
		glxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param="cmd=gdCheck&cpListNum="+cpListNum+"&gdList="+gdList; // 파라미터로 인덱스(회사번호) 넘겨주기
		glxhr.send(param);
	}
	function gdlistCallback(){
		if(glxhr.readyState==4&&glxhr.status==200){
			var data=glxhr.responseText;
			var json=JSON.parse(data);
			if(json.using==true){
				gdListCheck.innerHTML="이미 등록된 상품 종류입니다."
				check = false;
				return check;
			}else{
				gdListCheck.innerHTML="";
				return check;
			}
		}
	}
	function selectChange(obj){
		var GL=document.getElementById("gdList");
		if(obj.value==0){
			GL.disabled=true;
			GL.value="";
			check=false;
			return check;
			validate();
		}else{
			GL.disabled=false;
			GL.value="";
			gdListCheck.innerHTML="";

		}
	}
	
	function insertSubmit(index){
		var gdList=document.getElementById("gdList").value;
		if(index==1){
			document.gdForm.action="adindex.jsp?page=cpinfo.jsp";
		}
		if(index==2){
			document.gdForm.action="goods?cmd=gdInsert&cpListNum="+cpListNum;
		//	alert("성공적으로 등록되었습니다.");
			alert(check);
		}
		document.gdForm.submit();
	}
	function validate(){
		var gdList=document.getElementById("gdList").value;
		
		var list=JSON.parse(data)[0];
		if(gdList==""){
			return false;
		}
		
		return true;
	}


</script>