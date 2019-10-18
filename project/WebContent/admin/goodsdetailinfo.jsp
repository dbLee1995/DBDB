<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="content-wrapper">
	<div class="card-header" style="width: 90%; margin-left: auto; margin-right: auto;">
		<h3>상품 상세 정보 관리</h3>
	</div>
	<div class="container-fluid">
	<form method="post" name="goodsDetailForm"> 
		<table class="table" style="width: 90%; margin-left: auto; margin-right: auto">
		<thead>
			<tr>	
				<td>상품 종류 번호</td>
				<td>상품 번호</td>
				<td>제목</td>
				<td>가격</td>
				<td>재고</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		 <tbody id="tablebody">
		 </tbody>
	</table>
	</form>
	</div>
</div>    

<script>
window.onload = getList;
var listdetail = null;
var lxhr = null;
function getList() {
	lxhr = new XMLHttpRequest();
	lxhr.onreadystatechange = listcallback;
	lxhr.open('post', 'goodsdetail', true);
	lxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=gdDetailList";
	lxhr.send(param);
}
function listcallback() {
	if (lxhr.readyState == 4 && lxhr.status == 200) {
		var data = lxhr.responseText;
		var list = JSON.parse(data)[0];
		var tablebody = document.getElementById("tablebody");
			for (var i = 0; i < list.length; i++) {
			var row = tablebody.insertRow(tablebody.rows.length);
			var gdListNumCell = row.insertCell(0);
			var gdNumCell = row.insertCell(1);
			var gdNameCell = row.insertCell(2);
			var gdPriceCell = row.insertCell(3);
			var gdStockCell = row.insertCell(4);
			var updateCell = row.insertCell(5);
			var delCell = row.insertCell(6);
			gdListNumCell.innerHTML = list[i].gdlistnum;
			gdNumCell.innerHTML = list[i].gdnum;
			gdNameCell.innerHTML = list[i].gdname;
			gdPriceCell.innerHTML = list[i].gdprice;
			gdStockCell.innerHTML = list[i].gdstock;
			updateCell.innerHTML = "<button type='button' class='btn btn-primary')'>수정</button>";//나중에 시간 되면 추가
			delCell.innerHTML = "<button type='button' class='btn btn-warning' onClick='gdListDelSubmit("+list[i].gdnum+")'>삭제</button>"
		
		}
	}
}
	function gdListDelSubmit(num){
		document.goodsDetailForm.action="goodsdetail?cmd=gdDetailDelete&gdNum="+num;
		document.goodsDetailForm.submit();
		
	}

</script>
    
<%-- 
<div id="content-wrapper">
	<div class="card-header" style="width: 90%; margin-left: auto; margin-right: auto;">
		<h3>상품 상세 정보 관리</h3>
	</div>
	<div class="container-fluid">
		<table class="table" style="width: 90%; margin-left: auto; margin-right: auto">
		  <thead>
		    <tr>
		      <td>
		      		<select class="custom-select" id="cpSelect" name="cpList" onchange="cpSelectOption(this.value)">
						<option selected value="0">select company</option>
					</select>
		      </td>
		    </tr>
		  </thead>
		 <tbody id="tablebody">
		 </tbody>
	</table>
	</div>
</div>

<script>
	window.onload = companyList;
	var cpxhr = null;
	function companyList() {
		cpxhr = new XMLHttpRequest();
		cpxhr.onreadystatechange = cpCallback;
		cpxhr.open('post', 'goods', true);//상대경로
		cpxhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		var param = "cmd=cpList";
		cpxhr.send(param);
	}
	function cpCallback() {
		if (cpxhr.readyState == 4 && cpxhr.status == 200) {
			var cpSelect = document.getElementById("cpSelect");
			var data = cpxhr.responseText;
			var cpList = JSON.parse(data)[0];
			for (var i = 0; i < cpList.length; i++) {
				var cpOpt = document.createElement("option");
				cpOpt.value = cpList[i].cpNum;
				cpOpt.text = cpList[i].cpName;
				cpSelect.appendChild(cpOpt);
			}
		}
	}
	var selectvalue = null;
	var glxhr = null;
	function cpSelectOption(obj) {
	//	removegoodsOption();
		selectvalue = obj;
		glxhr = new XMLHttpRequest();
		glxhr.onreadystatechange = goodsDeatailListCallback;
		glxhr.open('post', 'goodsdetail', true);
		glxhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		var param = "cmd=gdDetailList&cpNum=" + selectvalue;//여기서 파라미터값을 넘겨서 셀렉트 구문 사용해야함
		glxhr.send(param);
	}
	function goodsDeatailListCallback(){
		if(glxhr.readyState==4 && glxhr.status==200){
			
		}
	}



</script>

--%>