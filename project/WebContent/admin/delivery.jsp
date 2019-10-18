<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content-wrapper">
	<div class="card-header" style="margin-left: auto; margin-right: auto;">
			<h3>배송 관리</h3>
		</div>
	<div class="container-fluid">
		<form method="post" name="goodsDetailForm"> 
		<table class="table table-bordered" style="margin-left: auto; margin-right: auto">
		<thead>
			<tr>	
				<td>주문번호</td>
				<td>상품명</td>
				<td>주문갯수</td>
				<td>아이디</td>
				<td>이름</td>
				<td>주소</td>
				<td>배송메세지</td>
				<td><div id="deliveryState">배송 상태</div></td>
			</tr>
		</thead>
		 <tbody id="tablebody">
		 </tbody>
	</table>
	</form>
	</div>
	</div>
	
<script>
window.onload = getDeliveryList;
var lxhr = null;
function getDeliveryList() {
	lxhr = new XMLHttpRequest();
	lxhr.onreadystatechange = listcallback;
	lxhr.open('post', 'delivery', true);
	lxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=gdDeliveryList";
	lxhr.send(param);
}
function listcallback() {
	if (lxhr.readyState == 4 && lxhr.status == 200) {
		var data = lxhr.responseText;
		var list = JSON.parse(data);
		var tablebody = document.getElementById("tablebody");
			for (var i = 0; i < list.length; i++) {
			var row = tablebody.insertRow(tablebody.rows.length);
			var orderNumCell = row.insertCell(0);
			var gdNameCell = row.insertCell(1);
			var gdCountCell = row.insertCell(2);
			var idCell = row.insertCell(3);
			var nameCell = row.insertCell(4);
			var addrCell = row.insertCell(5);
			var magCell = row.insertCell(6);
			var stateCell=row.insertCell(7);
			var stateChangeCell=row.insertCell(8);
			orderNumCell.innerHTML = list[i].ordernum;
			gdNameCell.innerHTML = list[i].gdname;
			gdCountCell.innerHTML = list[i].gdcount;
			idCell.innerHTML = list[i].id;
			nameCell.innerHTML = list[i].name;
			addrCell.innerHTML = list[i].addr;
			magCell.innerHTML = list[i].msg;
			var state=list[i].state;
			if(state==1){
				stateCell.innerHTML = "배송중";
				stateChangeCell.innerHTML = "<button type='button' class='btn btn-primary' onclick='stateChange("+list[i].state+")'>배송완료</button>";
			}else{
				stateCell.innerHTML = "배송완료";
				stateChangeCell.innerHTML = "<button type='button' class='btn btn-secondary'>배송완료</button>";
			}
		}
	}
}
	function stateChange(num){
		document.goodsDetailForm.action="goodsdetail?cmd=gdDetailDelete&gdNum="+num;
		document.goodsDetailForm.submit();
		
	}


	
	
</script>
