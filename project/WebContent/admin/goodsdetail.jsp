<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-wrapper">
	<div class="card-header"
		style="width: 90%; margin-left: auto; margin-right: auto;">
		<h3>신규 회사 정보 등록</h3>
	</div>
	<div class="container-fluid">
		<div class="card-body">
			<form method="post" name="gdDetailForm" enctype="multipart/form-data">
				<table class="table table-bordered"
					style="width: 90%; margin-left: auto; margin-right: auto">
					<tbody>
						<tr>
							<td>회사선택</td>
							<td width="70%"><select class="custom-select" id="cpSelect"
								name="cpList" onchange="cpSelectOption(this.value)">
									<option selected value="0">select company</option>
							</select></td>
						</tr>
						<tr>
							<td>상품 종류 선택</td>
							<td width="70%"><select class="custom-select" id="gdSelect"
								name="gdList" onchange="">
									<option selected value="0">select goodsList</option>
							</select></td>
						</tr>
						<tr>
							<td>제목</td>
							<td width="70%"><input type="text" class="form-control"
								id="gdName" name="gdName" placeholder="title"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td>
								<input type="text" class="form-control" id="gdPrice"
								name="gdPrice" placeholder="price">
							</td>
						</tr>
						<tr>
							<td>재고</td>
							<td>
								<input type="text" class="form-control" id="gdStock"
								name="gdStock" placeholder="stock">
							</td>
						</tr>
						<tr>
							<td>섬네일<br>(파일첨부)
							</td>
							<td>
								<div id="introPrivew"></div><br>
								<input type="file" id="introFileAdd" name="introFileAdd">
							</td>
						</tr>
						<tr>
							<td>상세정보<br>(파일첨부)
							</td>
							<td>
								<div id="detailPrivew"></div><br>
								<input type="file" id="detailFileAdd" name="detailFileAdd" >
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="col-lg-15 text-center">
									<button type="button" class="btn btn-secondary" onclick="cancelSubmit()">취소</button>
									<button type="button" class="btn btn-outline-primary" onclick="previewSubmit()" style="margin-left: 5px; margin-right: 5px;">미리보기</button>
									<button type="button" class="btn btn-primary" onclick="insertSubmit()">등록</button>
								</div>

							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
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
		removegoodsOption();
		selectvalue = obj;
		glxhr = new XMLHttpRequest();
		glxhr.onreadystatechange = goodsListCallback;
		glxhr.open('post', 'goods', true);
		glxhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		var param = "cmd=UpdateGdList&cpNum=" + selectvalue;//여기서 파라미터값을 넘겨서 셀렉트 구문 사용해야함
		glxhr.send(param);
	}
	function goodsListCallback() {
		if (glxhr.readyState == 4 && glxhr.status == 200) {
			var gdSelect = document.getElementById("gdSelect");
			var gdData = glxhr.responseText;
			var gdList = JSON.parse(gdData)[0];
			for (var i = 0; i < gdList.length; i++) {
				var gdOpt = document.createElement("option");
				gdOpt.value = gdList[i].GDListNum;
				gdOpt.text = gdList[i].GDList;
				gdSelect.appendChild(gdOpt);
			}
		}
	}

	function removegoodsOption() {
		var gdSelect = document.getElementById("gdSelect");
		var childs = gdSelect.childNodes;
		for (var i = childs.length - 1; i >= 0; i--) {
			var gs = childs.item(i);
			gdSelect.removeChild(gs);
		}
	}

	var  introFileAdd = document.getElementById('introFileAdd');
	var  introPrivew = document.getElementById('introPrivew');
	introFileAdd.onchange=function(){
		  var prefile = introFileAdd.files[0];
		  var prereader = new FileReader();
		  prereader.onload = function (event) {
		    var preimg = new Image();
		    preimg.src = event.target.result;
		    introPrivew.innerHTML = '';
		    introPrivew.appendChild(preimg);
		  };
		  prereader.readAsDataURL(prefile);
	}
	var  detailFileAdd = document.getElementById('detailFileAdd');
	var detailPrivew = document.getElementById('detailPrivew');
	detailFileAdd.onchange=function(){//이벤트 생성
		  var defile = detailFileAdd.files[0];
		  var dereader = new FileReader();  
		  dereader.onload = function (event) {
		    var deimg = new Image();
		    deimg.src = event.target.result; //event.targer - 이벤트가 발생된 객체(reader) / .result - blob  등 특수하게 가공된 URL을 출력
		    detailPrivew.appendChild(deimg);
		  };
		  dereader.readAsDataURL(defile);
	}
	function insertSubmit() {
		document.gdDetailForm.encoding="multipart/form-data";
		document.gdDetailForm.action = "goodsdetail?cmd=gdDetailinsert";
		document.gdDetailForm.submit();
	}
	function previewSubmit(){ 
		document.gdDetailForm.encoding="application/x-www-form-urlencoded"; //프리뷰 인코딩 방식 재설정
		var url="goodspreview.jsp";
		var title="goodspreview";
		window.open(url,"_blank",width=1000, height=900");

		//document.gdDetailForm.target=title;
		//document.gdDetailForm.action=url;

		document.gdDetailForm.submit();

	}

	
	
	
</script>

