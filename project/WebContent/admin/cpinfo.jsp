<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!-- get 방식으로 보내면 보낼 양이 많아 정상적으로 작동이 안됨 -->
<form name="frm" method="post">
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Data Table
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>회사번호</th>
							<th>회사명</th>
							<th>전화번호</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>회사번호</th>
							<th>회사명</th>
							<th>전화번호</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</tfoot>
					<tbody id="tablebody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>
<script>
	window.onload = getList;
	var listdetail = null;
	var lxhr = null;
	function getList() {
		lxhr = new XMLHttpRequest();
		lxhr.onreadystatechange = listcallback;
		lxhr.open('get', 'company?cmd=cpList', true);
		lxhr.send();
	}
	function listcallback() {
		if (lxhr.readyState == 4 && lxhr.status == 200) {
			var data = lxhr.responseText;
			var list = JSON.parse(data)[0];
			var tablebody = document.getElementById("tablebody");
			for (var i = 0; i < list.length; i++) {
				var row = tablebody.insertRow(tablebody.rows.length);
				var cpNumCell = row.insertCell(0);
				var cpNameCell = row.insertCell(1);
				var cpPhoneCell = row.insertCell(2);
				var UpdateCell = row.insertCell(3);
				var delCell = row.insertCell(4);
				cpNumCell.innerHTML = list[i].cpNum;
				cpNameCell.innerHTML = list[i].cpName;
				cpPhoneCell.innerHTML = list[i].phone;
				UpdateCell.innerHTML = "<button type='button' class='btn btn-info' onClick='cpUpSubmit(" +list[i].cpNum +")'>수정</button>"
				delCell.innerHTML = "<button type='button' class='btn btn-warning' onClick='cpDelSubmit("+list[i].cpNum+")'>삭제</button>"
			}
		}
	}
	//다중 서브밋
	function cpUpSubmit(cpnum){
		document.frm.action="company?cmd=cpSelect&cpnum="+cpnum;
		document.frm.submit();
	}
	function cpDelSubmit(cpnum){
		document.frm.action="company?cmd=cpDelete&cpnum="+cpnum;
		document.frm.submit();
	}
	
</script>
