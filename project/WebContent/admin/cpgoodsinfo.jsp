<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="frm" method="post">
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Data Table
		</div>
		<div class="card-body">
				<div class="form-group" >
					<select class="custom-select" id="cpSelect" name="cpList" onchange="selectChange(this)" >
					  <option selected id="optSelect" value="0" >select company</option>
					</select>
				</div>
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
	window.onload=companyList;
	var cpxhr=null;
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
	var selectvalue=null;
	var glxhr=null;
	function selectChange(obj){
		selectvalue = obj.value;
		glxhr=new XMLHttpRequest();
		glxhr.onreadystatechange = goodsListCallback;
		glxhr.open('post', 'goods?', true);
		glxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="cmd=gdList";
		glxhr.send(param);
	}
	//var listNum=null
	function goodsListCallback(){
		if(glxhr.readyState==4&&glxhr.status==200){
			removeTablebody();
			var data=glxhr.responseText;
			var list=JSON.parse(data)[0];
			var tablebody = document.getElementById("tablebody");
			for(var i=0;i<list.length;i++){
				if(selectvalue==list[i].CPNum){
					var row = tablebody.insertRow(tablebody.rows.length);
					var cpNumCell = row.insertCell(0);
					var gdListNumCell = row.insertCell(1);
					var gdListCell = row.insertCell(2);
					var UpdateCell = row.insertCell(3);
					var delCell = row.insertCell(4);
					cpNumCell.innerHTML=list[i].CPNum;
					gdListNumCell.innerHTML=list[i].GDListNum;
					gdListCell.innerHTML=list[i].GDList;
					UpdateCell.innerHTML = "<button type='button' class='btn btn-info' onClick='cpUpSubmit(" +list[i].cpNum +")'>수정</button>"
					delCell.innerHTML = "<button type='button' class='btn btn-warning' onClick='cpDelSubmit("+list[i].cpNum+")'>삭제</button>"
				}
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

	
</script>