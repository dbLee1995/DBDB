<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
           
      <!--           <tr>
           					<td><button type='submit' class='btn btn-primary'>다음</button></td>
							<td><button type='submit' class='btn btn-primary'>다음</button></td>
				</tr>
           				  -->
                </tbody>
              </table>
              <div id="test"></div>
            </div>
          </div>
        </div>
        
<script>
	window.onload=getList;
	var listdetail=null;
	var lxhr=null;
	function getList(){
		lxhr=new XMLHttpRequest();
		lxhr.onreadystatechange=listcallback;
		lxhr.open('get','company?cmd=cpList',true);
		lxhr.send();
	}
	function listcallback(){
		if(lxhr.readyState==4 && lxhr.status==200){
			var data=lxhr.responseText;
			var list=JSON.parse(data)[0];
			var tablebody=document.getElementById("tablebody");
		//	var tabletr=document.getElementById("tabletr");
		//	var tabletd=document.getElementById("tabletd");
		//	var tr=document.createElement("tr");
		//	var td=document.createElement("td");
			for(var i=0;i<list.length;i++){
				var row=tablebody.insertRow(tablebody.rows.length);
				var cell1=row.insertCell(0);
				var cell2=row.insertCell(1);
				var cell3=row.insertCell(2);
				var cell4=row.insertCell(3);
				var cell5=row.insertCell(4);
				cell1.innerHTML=list[i].cpNum;
				cell2.innerHTML=list[i].cpName;
				cell3.innerHTML=list[i].phone;
				cell4.innerHTML="<button type='submit' class='btn btn-primary'>다음</button>"
				cell5.innerHTML="<button type='submit' class='btn btn-primary'>다음</button>"
				document.getElementById("test").innerHTML+=list[i].cpName+"<br>";
										
			}
			
			
		}
	}

</script>
