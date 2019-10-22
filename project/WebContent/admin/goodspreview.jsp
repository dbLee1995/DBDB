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

<%
	request.setCharacterEncoding("UTF-8");
	String gdName = request.getParameter("gdName");
	int gdPrice=Integer.parseInt(request.getParameter("gdPrice"));
	String intro=request.getParameter("introFileAdd");

%>
<script>
	window.onload=function(){ //체인지가 아닌 창 오픈하자마자 불러오기 때문에 onchange 함수를 사용하면 못들어감
		var  introPrivew = document.getElementById('introPrivew');
		var introFileAdd=opener.document.getElementById("introFileAdd"); //opener로 부모 객체 참조
			  var prefile = introFileAdd.files[0];
			  var   prereader = new FileReader();
			  prereader.onload = function (event) {
			    var preimg = new Image();
			    preimg.style="width:100%; height:100%";
			    preimg.src = event.target.result;
			    introPrivew.innerHTML = '';
			    introPrivew.appendChild(preimg);
			  };
			  prereader.readAsDataURL(prefile);
			  
		var detailPrivew=document.getElementById("detailPrivew");
		var detailFileAdd=opener.document.getElementById("detailFileAdd");
		  var defile = detailFileAdd.files[0];
		  var dereader = new FileReader();  
		  dereader.onload = function (event) {
		    var deimg = new Image();
		    deimg.style="width:100%; height:100%";
		    deimg.src = event.target.result; 
		    detailPrivew.innerHTML = '';
		    detailPrivew.appendChild(deimg);
		  };
		  dereader.readAsDataURL(defile);
	}

	function multi(price){
		var count=document.getElementById("multicount");
		var span=document.getElementById("result");
		span.innerHTML=count.value * price +"원";
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
							<div class="row">
								<div id="header">
									<div id="introPrivew"></div>
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
											onkeyup="multi(<%=gdPrice %>)" id="multicount">
										<hr>
										<h6>총 금액</h6>
										<h2 class="count">
											<span id="result"></span>
										</h2>
										<br> <br> <br>
										<button class="btn btn-1 btn-warning" type="button" id="btn">장바구니에 담기</button>
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
									</div>
								</div>
							</div>
						</div>
					</div>
				</nav>
				<div id="detailPrivew"></div><br>
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