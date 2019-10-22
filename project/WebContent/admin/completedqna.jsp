<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content-wrapper">
	<div class="card-header bg-transparent" style="margin-left: auto; margin-right: auto;">
			<h3>답변 완료</h3>
		</div>
	<div class="container-fluid">
	<form method="post" name="answerForm">
		<table class="table table-bordered" style="margin-left: auto; margin-right: auto">
			<tr>
				<th>아이디</th>
				<th>카테고리</th>
				<th>문의제목</th>
				<th>답변내용</th>
				<th>답변일자</th>
				<th>답변수정</th>
			</tr>
			<tbody id="tablebody">
			
			
			</tbody>
		</table>
		</form>
	</div>
	</div>
	
<script>
window.onload = getAList;
var lxhr = null;
function getAList() {
	lxhr = new XMLHttpRequest();
	lxhr.onreadystatechange = listcallback;
	lxhr.open('post', 'qna', true);
	lxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=alist";
	lxhr.send(param);
}

var state=null;
var id=null;
var title=null;
function listcallback() {
	if (lxhr.readyState == 4 && lxhr.status == 200) {
		var data = lxhr.responseText;
		var list = JSON.parse(data)[0];
		var tablebody = document.getElementById("tablebody");
			for (var i = 0; i < list.length; i++) {
			var row = tablebody.insertRow(tablebody.rows.length);
			var idCell = row.insertCell(0); 
			var categoryCell=row.insertCell(1);
			var titleCell = row.insertCell(2);
			var answerCell = row.insertCell(3);
			var answerdateCell = row.insertCell(4);
			var answerstateCell = row.insertCell(5);
			idCell.innerHTML = list[i].id;
			categoryCell.innerHTML=list[i].category;
			titleCell.innerHTML = list[i].title;
			
			if(list[i].answer==null){
				answerCell.innerHTML ="";
			}else{
				answerCell.innerHTML = list[i].answer;
			}
			answerdateCell.innerHTML = list[i].answerdate;
			var qnum=list[i].qnum;
			var state=list[i].answerstate;
			answerstateCell.innerHTML = "<button type='button' class='btn btn-secondary' onclick='answerUpdate("+qnum+")' >수정하기</button>";
		}
	}
}
function answerUpdate(num){
	document.answerForm.action="qna?cmd=answerUpdate&qnum="+num;
	document.answerForm.submit();
}
</script>