<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with a Design System for Bootstrap 4.">
<meta name="author" content="Creative Tim">
<title>랭닭킹컴</title>
<!-- Favicon -->
<link href="../icon/mainicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="../assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
<link href="../assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Argon CSS -->
<link type="text/css" href="../assets/css/argon.css?v=1.1.0"
	rel="stylesheet">
<style type="text/css">
.card {
	margin-left: 30px;
}

#header {
	margin-left: 50px;
}

#count {
	float: right;
}

.count {
	float: right;
}

#btn {
	margin-left: 30px;
}

#detailcontent {
	margin-left: 420px;
	font-size: 1.2em;
}
</style>
<script type="text/javascript">
/*		var xhr=null;
		function multi(price){
			var count=document.getElementById("multicount");
			var span=document.getElementById("result");
			span.innerHTML=count.value * price +"원";
		}
		window.onload=function(){
			getList();
		}
		var listxhr=null;
		function getList(){
			listxhr=new XMLHttpRequest();
			listxhr.onreadystatechange=listOk;
			listxhr.open('get','review?cmd=list&gdnum=${gdnum}',true);
			listxhr.send();
		}
		function listOk(){
			if(listxhr.readyState==4 && listxhr.status==200){
				var data=listxhr.responseText;
				var list=JSON.parse(data)[0];
				var revdiv=document.getElementById("revdiv");
				for(var i=0;i<list.length;++i){
					var str="<br>"+
					"<div class='media'>"+
					"<img src='images/${sumimg }' class='align-self-start mr-3'"+ 
					"alt='' width='100' height='100'>"+
					"<div class='media-body'>"+
					"<h5 class='mt-0'>"+list[i].title+"</h5>"+
					"<p>"+list[i].id+"("+list[i].regdate+")";
					for(var j=0;j<list[i].score;++j){
						str+="★";
					}
					str+="<a href='review?cmd=delete&gdnum=${gdnum}&id="+list[i].id+"&rid=${id}&revnum="+list[i].revnum+"'>"+
						 "삭제</a></p><p>"+list[i].content+"</p></div></div>";
					
					var div=document.createElement("div");
					div.innerHTML=str;
					revdiv.appendChild(div);
				}
			}
		}
		var addxhr=null;
		function addReview(){
			var title=document.getElementById("title").value;
			var score=document.getElementById("score").value;
			var content=document.getElementById("content").value;
			addxhr=new XMLHttpRequest();
			addxhr.onreadystatechange=addReviewOk;
			addxhr.open('post','review?cmd=insert',true);
			addxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			var param="gdnum=${gdnum}&id=${id}&title="+title+"&score="+score+"&content="+content;
			addxhr.send(param);
		}
		function addReviewOk(){
			if(addxhr.readyState==4 && addxhr.status==200){
				var data=addxhr.responseText;
				var insert=JSON.parse(data);
				removerevAll();
				getList();
			}
		}
		function removerevAll(){
			var revdiv=document.getElementById("revdiv");
			var child=revdiv.childNodes;
			for(var i=child.length-1;i>=0;--i){
				var rev=child.item(i);
				revdiv.removeChild(rev);
			}
		}
		var cartxhr=null;
		function addCart(){
			var count=document.getElementById("multicount").value;
			cartxhr=new XMLHttpRequest();
			cartxhr.onreadystatechange=addCartOk;
			cartxhr.open('post','cart?cmd=insert',true);
			cartxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			var param="count="+count+"&gdnum=${gdnum}";
			cartxhr.send(param);
		}
		function addCartOk(){
			if(cartxhr.readyState==4 && cartxhr.status==200){
				var data=cartxhr.responseText;
				var insert=JSON.parse(data);
				alert("장바구니에 추가되었습니다!");
			}
		}
		*/
	
		
		
		
	</script>
<%
	request.setCharacterEncoding("UTF-8");
	String cpName=request.getParameter("");
	String gdName = request.getParameter("gdName");
	int gdPrice=Integer.parseInt(request.getParameter("gdPrice"));
	String intro=request.getParameter("introFileAdd");
	String setprefile=request.getParameter("setprefile");
	String detail=request.getParameter("detailFileAdd");
	String setdefile=request.getParameter("setdefile");
	

%>
<script>
	
	
	var  introFile ='<%=intro %>';
	var  introPrivew = document.getElementById('introPrivew');
	window.onload=function(){
	
	  var prereader = new FileReader();
	  prereader.onload = function (event) {
	    var preimg = new Image();
	    preimg.src = event.target.result;
	    introPrivew.innerHTML = '';
	    introPrivew.appendChild(preimg);
	  };
	  prereader.readAsDataURL('<%=setprefile%>');

}

</script>

</head>
<body>

	<section class="section section-components pb-0"
		id="section-components">
		<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<!-- Basic elements -->
						<div class="container">
						<input type="hidden">
							<h2 class="mb-2">[${compname}]</h2>
							<div class="row">
								<div id="header">
									<img src="images/<%=intro %>" alt="sm_chickenbreast"
										width="400" height="400">
								</div>
								<div id="header">
									<form action="">
										<h3 class="mb-2">
											<span><%=gdName %></span><br> <span>&nbsp;&nbsp;&nbsp;:
												<%=gdPrice %>원</span>
										</h3>
										<h6 id="count">구매수량 입력</h6>
										<input type="text" placeholder="숫자만 입력해주세요"
											class="form-control" name="count"
											onkeyup="multi(${listvo.gdprice })" id="multicount">
										<hr>
										<h6>총 금액</h6>
										<h2 class="count">
											<span id="result"></span>
										</h2>
										<br> <br> <br>
										<button class="btn btn-1 btn-warning" type="button" id="btn"
											onclick="addCart()">장바구니에 담기</button>
										<button class="btn btn-1 btn-outline-warning" type="button"
											id="btn">바로 결제하기</button>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
				<hr>
				<br>
				<br>
				<nav class="navbar navbar-expand-lg navbar-dark bg-warning mt-4">
					<div class="container">
						<a class="navbar-brand" href="#" id="detailcontent">상세 내용</a>
						<div class="collapse navbar-collapse" id="navbar-warning">
							<div class="navbar-collapse-header">
								<div class="row">
									<div class="col-6 collapse-brand">
										<a href="../index.html"> <img alt="image"
											src="../assets/img/brand/blue.png">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</nav>
				<div id="introPrivew" style="width:100%;
					height:100%"></div><br>
				<%--   <img alt="gddetail" src="images/<%=detail %> }" width="100%"
					height="100%">
			--%>
			<hr>
			<br> <br>
	

		</div>
	
	</section>


	<!-- Core -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/popper/popper.min.js"></script>
	<script src="../assets/vendor/bootstrap/bootstrap.min.js"></script>
	<script src="../assets/vendor/headroom/headroom.min.js"></script>
	<!-- Optional JS -->
	<script src="../assets/vendor/onscreen/onscreen.min.js"></script>
	<script src="../assets/vendor/nouislider/js/nouislider.min.js"></script>
	<script
		src="../assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<!-- Argon JS -->
	<script src="../assets/js/argon.js?v=1.1.0"></script>
</body>
</html>