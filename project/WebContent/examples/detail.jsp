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
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
<link href="./assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Argon CSS -->
<link type="text/css" href="./assets/css/argon.css?v=1.1.0"
	rel="stylesheet">
<style type="text/css">
.card {
	margin-left: 30px;
}

#header {
	margin-left: 50px;
}
#count{float:right;}
.count{float:right;}
#btn{margin-left: 30px;}
#detailcontent{margin-left: 420px; font-size: 1.2em;}

</style>
	<script type="text/javascript">
		var xhr=null;
		function multi(price){
			var count=document.getElementById("multicount");
			var span=document.getElementById("result");
			span.innerHTML=count.value * price +"원";
		}
	</script>
</head>
<body>
	<header class="header-global">
		<nav id="navbar-main"
			class="navbar navbar-expand-lg navbar-dark bg-warning mt-3">
			<!-- navbar navbar-expand-lg navbar-dark bg-default -->
			<!-- navbar navbar-expand-lg navbar-dark bg-warning mt-4 -->
			<!-- navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom -->
			<div class="container">
				<a class="navbar-brand mr-lg-5" href="./index.html"> <img
					alt="image" src="./assets/img/brand/white.png">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar_global" aria-controls="navbar_global"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="navbar-collapse collapse" id="navbar_global">
					<div class="navbar-collapse-header">
						<div class="row">
							<div class="col-6 collapse-brand">
								<a href="./index.html"> <img alt="image"
									src="./assets/img/brand/blue.png">
								</a>
							</div>
							<div class="col-6 collapse-close">
								<button type="button" class="navbar-toggler"
									data-toggle="collapse" data-target="#navbar_global"
									aria-controls="navbar_global" aria-expanded="false"
									aria-label="Toggle navigation">
									<span></span> <span></span>
								</button>
							</div>
						</div>
					</div>
					<ul class="navbar-nav navbar-nav-hover align-items-lg-center">
						<li class="nav-item dropdown"><a href="#" class="nav-link"
							data-toggle="dropdown" role="button"> <i
								class="ni ni-collection d-lg-none"></i> <span
								class="nav-link-inner--text">Examples</span>
						</a>
							<div class="dropdown-menu">
								<a href="./examples/landing.html" class="dropdown-item">Landing</a>
								<a href="./examples/profile.html" class="dropdown-item">Profile</a>
								<a href="./examples/login.jsp" class="dropdown-item">Login</a> <a
									href="./examples/register.html" class="dropdown-item">Register</a>
							</div></li>
					</ul>
					<ul class="navbar-nav align-items-lg-center ml-lg-auto">

						<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">Cart</a></li>
						<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">MyPage</a></li>
						<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">Login</a></li>
						<li class="nav-item"><a href="./examples/register.html"
							class="nav-link">Register</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="section section-components pb-0"
		id="section-components">
		<div class="container">
		<c:forEach var="listvo" items="${list }">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<!-- Basic elements -->
						<div class="container">
						<h2 class="mb-2">[${listvo.gdlistnum}]</h2>
							<div class="row">
								<div id="header">
									<img src="images/${listvo.gdsumary }" alt="sm_chickenbreast"
										width="400" height="400">
								</div>
								<div id="header">
									<form action="">
										<h3 class="mb-2">
											<span>${listvo.gdname }</span><br>
											<span>&nbsp;&nbsp;&nbsp;: ${listvo.gdprice }원</span>
										</h3>
										<h6 id="count">갯수를 입력해주세요.</h6>
										<input type="text" placeholder="숫자만 입력해주세요" class="form-control" 
											name="count" onkeyup="multi(${listvo.gdprice })" id="multicount">
										<hr>
										<h6>총 금액</h6>
										<h2 class="count"><span id="result"></span></h2>
										<br><br><br>
										<button class="btn btn-1 btn-warning" type="button" id="btn">장바구니에 담기</button>
										<button class="btn btn-1 btn-outline-warning" type="button" id="btn">바로 결제하기</button>
									</form>
								</div>
							</div>
						</div>
					
				</div>
			</div>
			<hr>
			<br><br>
			<nav class="navbar navbar-expand-lg navbar-dark bg-warning mt-4">
	        <div class="container">
	          <a class="navbar-brand" href="#" id="detailcontent">상세 내용</a>
	          <div class="collapse navbar-collapse" id="navbar-warning">
	            <div class="navbar-collapse-header">
	              <div class="row">
	                <div class="col-6 collapse-brand">
	                  <a href="./index.html">
	                    <img alt="image" src="./assets/img/brand/blue.png">
	                  </a>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	   	   </nav>
      
      	<img alt="gddetail" src="images/${listvo.gddetail }" width="100%" height="100%">
      
      	</c:forEach>
      	<hr>
      	<br><br>
      	<nav class="navbar navbar-expand-lg navbar-dark bg-warning mt-4">
	        <div class="container">
	          <a class="navbar-brand" href="#" id="detailcontent">리뷰</a>
	          <div class="collapse navbar-collapse" id="navbar-warning">
	            <div class="navbar-collapse-header">
	              <div class="row">
	                <div class="col-6 collapse-brand">
	                  <a href="./index.html">
	                    <img alt="image" src="./assets/img/brand/blue.png">
	                  </a>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	   	   </nav>
      	
      		<div class="media">
			  <img src="..." class="align-self-start mr-3" alt="...">
			  <div class="media-body">
			    <h5 class="mt-0">Top-aligned media</h5>
			    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
			    <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
			  </div>
			</div>
			<br>
			<div class="media">
			  <img src="..." class="align-self-start mr-3" alt="...">
			  <div class="media-body">
			    <h5 class="mt-0">Top-aligned media</h5>
			    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
			    <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
			  </div>
			</div>
		</div>
	</section>


	<!-- Core -->
	<script src="./assets/vendor/jquery/jquery.min.js"></script>
	<script src="./assets/vendor/popper/popper.min.js"></script>
	<script src="./assets/vendor/bootstrap/bootstrap.min.js"></script>
	<script src="./assets/vendor/headroom/headroom.min.js"></script>
	<!-- Optional JS -->
	<script src="./assets/vendor/onscreen/onscreen.min.js"></script>
	<script src="./assets/vendor/nouislider/js/nouislider.min.js"></script>
	<script
		src="./assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<!-- Argon JS -->
	<script src="./assets/js/argon.js?v=1.1.0"></script>
</body>
</html>