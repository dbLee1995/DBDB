<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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