<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content-wrapper">
	<div class="card-header bg-transparent" style="margin-left: auto; margin-right: auto;">
			<h3>미처리 답변</h3>
		</div>
	<div class="container-fluid">
	<form method="post" name="qnaForm">
		<table class="table table-bordered" style="margin-left: auto; margin-right: auto">
			<tr>
				<th>아이디</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>답변상태</th>
			</tr>
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
	lxhr.open('post', 'qna', true);
	lxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=qlist";
	lxhr.send(param);
}

var state=null;
var id=null;
var title=null;
function listcallback() {
	if (lxhr.readyState == 4 && lxhr.status == 200) {
		var data = lxhr.responseText;
		var list = JSON.parse(data);
		var tablebody = document.getElementById("tablebody");
			for (var i = 0; i < list.length; i++) {
			var row = tablebody.insertRow(tablebody.rows.length);
			var idCell = row.insertCell(0); 
			var categoryCell=row.insertCell(1);
			var titleCell = row.insertCell(2);
			var contentCell = row.insertCell(3);
			var regdateCell = row.insertCell(4);
			var answerstateCell = row.insertCell(5);
			idCell.innerHTML = list[i].id;
			categoryCell.innerHTML=list[i].category;
			titleCell.innerHTML = list[i].title;
			contentCell.innerHTML = list[i].content;
			regdateCell.innerHTML = list[i].regdate;
			var qnum=list[i].qnum;
			
			if(list[i].answerstate==1){
				answerstateCell.innerHTML = "<button type='button' class='btn btn-primary' onclick='stateChange("+qnum+")' >미답변</button>";
			}else{
				answerstateCell.innerHTML="<button type='button' class='btn btn-warning' onclick='stateChange("+qnum+")' >답변중</button>";
			}
		}
	}
}
function stateChange(num){
	document.qnaForm.action="qna?cmd=stateChange&qnum="+num+"&state=1";
	document.qnaForm.submit();
	
}

</script>	