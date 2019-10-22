<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="content-wrapper">
	<div class="card-header" style="width: 90%; margin-left: auto; margin-right: auto;">
		<h3>상품 상세 정보 관리</h3>
	</div>
	<div class="container-fluid">
	<form method="post" name="goodsDetailForm"> 
		<table class="table " style="width: 90%; margin-left: auto; margin-right: auto">
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
	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
	  	<div class="btn-group mr-2" role="group" aria-label="First group" id="btn">
	  </div>
  </div>
	</form>
	</div>
</div>    

<script>
window.onload = getList;

var cxhr=null;
function getPageCount(){
	cxhr=new XMLHttpRequest();
	cxhr.onreadystatechange=getCount;
	cxhr.open('post', 'goodsdetail', true);
	cxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	var param="cmd=gdPageCount";
	cxhr.send(param);
}
var pagecount=null;
function getCount(){
	if (cxhr.readyState == 4 && cxhr.status == 200) {
		var data=cxhr.responseText;
		var json=JSON.parse(data);
		pagecount=json.pagecount;
	}
}

var listdetail = null;
var lxhr = null;
var pagenum=null;
function getList() {
	lxhr = new XMLHttpRequest();
	lxhr.onreadystatechange = listcallback;
	lxhr.open('post', 'goodsdetail', true);
	lxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=gdDetailList&pagenum="+1//첫 page;
	lxhr.send(param);
}


function listcallback() {
	getPageCount();
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
		//페이지 갯수만큼 button 붙이기
		var btn=document.getElementById("btn");
		for(var j=1;j<=pagecount;j++){
			var pagebtn=document.createElement("button");
			pagebtn.className="btn btn-secondary";
			pagebtn.type="button";
			pagebtn.onclick=ajaxlist;
			pagebtn.innerHTML=j;
			btn.appendChild(pagebtn);	
		}
	}
	
}
var axhr=null;
function ajaxlist(e){
	var num=e.target.innerHTML;
	axhr = new XMLHttpRequest();
	axhr.onreadystatechange = ajaxlistcallback;
	axhr.open('post', 'goodsdetail', true);
	axhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	var param = "cmd=gdDetailList&pagenum="+num;
	axhr.send(param);
}
function ajaxlistcallback(){
	if (axhr.readyState == 4 && axhr.status == 200) {
		getPageCount();
		removeTablebody();
		removebtn();
		var data = axhr.responseText;
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
			var btn=document.getElementById("btn");
			for(var j=1;j<=pagecount;j++){
				var pagebtn=document.createElement("button");
				pagebtn.className="btn btn-secondary";
				pagebtn.type="button";
				pagebtn.onclick=ajaxlist;
				pagebtn.innerHTML=j;
				btn.appendChild(pagebtn);	
			}
		}
	
}

function removeTablebody(){
    var tablebody=document.getElementById("tablebody");
    var childs=tablebody.childNodes;
    for(var i=childs.length-1;i>=0;i--){
            var tbody=childs.item(i);
            tablebody.removeChild(tbody);
    }
}
function removebtn(){
    var btn=document.getElementById("btn");
    var childs=btn.childNodes;
    for(var i=childs.length-1;i>=0;i--){
            var pagebtn=childs.item(i);
            btn.removeChild(pagebtn);
    }
}
	function gdListDelSubmit(num){
		document.goodsDetailForm.action="goodsdetail?cmd=gdDetailDelete&gdNum="+num;
		document.goodsDetailForm.submit();
		
	}
</script>
    
