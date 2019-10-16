<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="frm" method="post">
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Data Table
		</div>
		<div class="card-body">
				<div class="form-group" >
					<select class="custom-select" id="cpSelect" name="cpList" onchange="selectChange(this.value)" >
					  <option selected id="optSelect" value="0" >select company</option>
					</select>
				</div>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>회사번호</th>
							<th>상품 종류번호</th>
							<th>상품 종류</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>회사번호</th>
							<th>상품 종류번호</th>
							<th>상품 종류</th>
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

//	request
/*	var upxhr=null;
//	var cpNum=${gvo.CPNum};
	var cppNum=0;
 		if(cppNum!=0){
 		window.onload=updateGoodsList;
		function updateGoodsList(){
			alert(cppNum)
			selectvalue == cppNum;
			upxhr=new XMLHttpRequest();
			upxhr.onreadystatechange = updategoodsListCallback;
			upxhr.open('post', 'goods?', true);
			upxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			var param="cmd=UpdateGdList&cpNum="+cppNum;
			upxhr.send(param);
		}
		function updategoodsListCallback(){
			if(upxhr.readyState==4&&upxhr.status==200){
				removeTablebody();
				var data=upxhr.responseText;
				var list=JSON.parse(data)[0];
				var tablebody = document.getElementById("tablebody");
			//	var cpNum=${gvo.CPNum};
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
						UpdateCell.innerHTML = "<button type='button' class='btn btn-info' onClick='goodsUpSubmit(" +list[i].GDListNum +")'>수정</button>"
						delCell.innerHTML = "<button type='button' class='btn btn-warning' onClick='goodsDelSubmit("+list[i].GDListNum+")'>삭제</button>"
					}
				}
			}
		}
	}
 		*/
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
		selectvalue = obj;
		glxhr=new XMLHttpRequest();
		glxhr.onreadystatechange = goodsListCallback;
		glxhr.open('post', 'goods?', true);
		glxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="cmd=gdList";
		glxhr.send(param);

	}
	
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
					cppNum=list[i].CPNum;
					cpNumCell.innerHTML=list[i].CPNum;
					gdListNumCell.innerHTML=list[i].GDListNum;
					gdListCell.innerHTML=list[i].GDList;
					UpdateCell.innerHTML = "<button type='button' class='btn btn-info' onClick='goodsUpSubmit(" +list[i].GDListNum +")'>수정</button>"
					delCell.innerHTML = "<button type='button' class='btn btn-warning' onClick='goodsDelSubmit("+list[i].GDListNum+")'>삭제</button>"
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

	function goodsUpSubmit(GDListNum) {
		document.frm.action = "goods?cmd=gdSelect&GDListNum=" + GDListNum;
		document.frm.submit();
	}
	var dxhr=null;
	function goodsDelSubmit(GDListNum) {
		dxhr=new XMLHttpRequest();
		dxhr.onreadystatechange=goodsDeleteCallback;
		dxhr.open('post','goods?',true);
		dxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param="cmd=gdDelete&GDListNum="+ GDListNum;
		dxhr.send(param);
	}
	function goodsDeleteCallback(){
		if (dxhr.readyState == 4 && dxhr.status == 200) {
			var data=dxhr.responseText;
			var json=JSON.parse(data);
			if(json.code=='success'){
				var selobj=json.selvo;
				alert(selobj);
				selectChange(selobj);
			}else{
				alert("삭제실패");
			}
		}
	}
</script>