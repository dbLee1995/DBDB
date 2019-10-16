<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="content-wrapper">
		<div class="card-header" style="width:90%;margin-left: auto; margin-right: auto;"><h3>신규 회사 정보 등록</h3></div>
			<div class="container-fluid">
				<div class="card-body">
					<table class="table table-bordered" style="width:90%; margin-left: auto; margin-right: auto">
						  <tbody>
						    <tr>
						      <td >회사선택</td>
						      <td width="70%">
							      <select class="custom-select" id="cpSelect" name="cpList" onchange="cpSelect(this.value)" >
							  		<option selected value="0" >select company</option>
								  </select>	
								</td>
						    </tr>
						    <tr>
						      <td >상품 종류 선택</td>
						      <td width="70%">
						      	  <select class="custom-select" id="gdSelect" name="gdList" onchange="" >
							  		<option selected value="0" >select goodsList</option>
								  </select>	
						      </td>
						    </tr>
						    <tr>
						      <td>제목</td>
						      <td width="70%">
						      	<input type="text" class="form-control" id="gdName"
								  name="gdName" placeholder="title" > 
						      </td>
						    </tr>
						     <tr>
						      <td >가격</td>
						      <td>
						      	<input type="text" class="form-control" id="gdPrice"
								  name="gdPrice" placeholder="price"> 
						      </td>
						    </tr>
						     <tr>
						      <td >섬네일<br>(파일첨부)</td>
						      <td>
  							    <textarea class="form-control" id="gdDetail" rows="10" name="gdPrice"></textarea>
  							    <div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="introFileSpan">업로드</span>
								  </div>
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="introFileAdd" aria-describedby="inputGroupFileAddon01">
								    <label class="custom-file-label" for="inputGroupFile01">파일선택</label>
								  </div>
								</div>
						      </td>
						    </tr>
						    <tr>
						      <td >상세정보<br>(파일첨부)</td>
						      <td>
  							    <textarea class="form-control" id="gdDetail" rows="15" name="gdDetail"></textarea>
  							    <div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="detailFileSpan">업로드</span>
								  </div>
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="detailFileAdd" aria-describedby="inputGroupFileAddon01">
								    <label class="custom-file-label" for="inputGroupFile01">파일선택</label>
								  </div>
								</div>
						      </td>
						    </tr>
						    <tr>
						    	<td colspan="2">
						    		<div class="col-lg-15 text-center">
										<button type="submit" class="btn btn-secondary" >취소</button>
										<button type="submit" class="btn btn-outline-primary" >미리보기</button>
										<button type="submit" class="btn btn-primary" >다음</button>
									</div>
						    	
						    	</td>
						    </tr>
						  </tbody>
						</table>
					</div>
			</div>
			</div>
<script>
	//에버노트 켜기 전 정렬하기
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
			var cpList=JSON.parse(data)[0];
			for(var i=0;i<cpList.length;i++){
				var cpOpt=document.createElement("option");
				cpOpt.value=cpList[i].cpNum;
				cpOpt.text=cpList[i].cpName;
				cpSelect.appendChild(cpOpt);
			}
		}
	}
	var selectvalue=null;
	var glxhr=null;
	function cpSelect(obj){
		removegoodsOption();
		selectvalue = obj;
		glxhr=new XMLHttpRequest();
		glxhr.onreadystatechange = goodsListCallback;
		glxhr.open('post', 'goods?', true);
		glxhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		var param="cmd=gdList";
		glxhr.send(param);
	}
	function goodsListCallback(){
		if(glxhr.readyState==4 && glxhr.status==200){
			var gdSelect=document.getElementById("gdSelect");
			var gdData=glxhr.responseText;
			var gdList=JSON.parse(gdData)[0];
			for(var i=0;i<gdList.length;i++){
				var gdOpt=document.createElement("option");
				gdOpt.value=gdList[i].GDList;
				gdOpt.text=gdList[i].GDList;
				gdSelect.appendChild(gdOpt);
			}
		}
	}
	 function removegoodsOption(){
         var gdSelect=document.getElementById("gdSelect");
         var childs=gdSelect.childNodes;
         for(var i=childs.length-1;i>=0;i--){
                 var gs=childs.item(i);
                 gdSelect.removeChild(gs);
         }
 	}
	

</script>			
	
		