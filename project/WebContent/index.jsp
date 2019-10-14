<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
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
								<a href="./examples/login.jsp" class="dropdown-item">Login</a>
								<a href="./examples/register.html" class="dropdown-item">Register</a>
							</div></li>
					</ul>
					<ul class="navbar-nav align-items-lg-center ml-lg-auto">
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="https://www.facebook.com/creativetim" target="_blank"
							data-toggle="tooltip" title="Like us on Facebook"> <i
								class="fa fa-facebook-square"></i> <span
								class="nav-link-inner--text d-lg-none">Facebook</span>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="https://www.instagram.com/creativetimofficial"
							target="_blank" data-toggle="tooltip"
							title="Follow us on Instagram"> <i class="fa fa-instagram"></i>
								<span class="nav-link-inner--text d-lg-none">Instagram</span>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="https://twitter.com/creativetim" target="_blank"
							data-toggle="tooltip" title="Follow us on Twitter"> <i
								class="fa fa-twitter-square"></i> <span
								class="nav-link-inner--text d-lg-none">Twitter</span>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href="https://github.com/creativetimofficial/argon-design-system"
							target="_blank" data-toggle="tooltip" title="Star us on Github">
								<i class="fa fa-github"></i> <span
								class="nav-link-inner--text d-lg-none">Github</span>
						</a></li>
						<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">Cart</a></li>
						<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">MyPage</a></li>
						<%
							String id=(String)session.getAttribute("id");
							if(id==null) {
						%>
							<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">Login</a></li>
						<%
							}else {
						%>
							<li class="nav-item"><a href="./examples/logout.jsp"
							class="nav-link">Logout</a></li>
						<%
							}
						%>
						<li class="nav-item"><a href="./examples/register.html"
							class="nav-link">Register</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main> 
	<!--  slide  --> 
	
	<!-- <div class="container"> -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/mainslide1.jpg" class="d-block w-100"
					alt="mainslide1">
			</div>
			<div class="carousel-item">
				<img src="images/mainslide2.jpg" class="d-block w-100"
					alt="mainslide2">
			</div>
			<div class="carousel-item">
				<img src="images/mainslide3.jpg" class="d-block w-100"
					alt="mainslide3">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	<!-- </div>-->

	<section class="section section-components pb-0"
		id="section-components">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<!-- Basic elements -->
					<h2 class="mb-5">
						<span>저렴이순</span>
					</h2>
					<div class="container">
						<div class="row">
							<% int n=0; %>
							<c:forEach var="listvo" items="${pricelist }">
							<%if(n<6){ %>
							<div class="card" style="width: 18rem;">
								<img src="images/${listvo.gdsumary }" class="card-img-top"
									alt="sm_chickenbreast">
								<div class="card-body">
									<h5 class="card-title">${listvo.gdname }</h5>
									<a href="./detail?gdnum=${listvo.gdnum }">
									<button class="btn btn-1 btn-outline-warning" type="button"
									>자세히보기</button></a>
								</div>
							</div>
							<%++n;} %>
							</c:forEach>
						</div>
					</div>
					<br>
					<br>
					<h2 class="mb-5">
						<span>Basic Elements</span>
					</h2>
					<div class="container">
						<div class="row">
							<div class="card" style="width: 18rem;">
								<img src="images/sm_friedrice.jpg" class="card-img-top"
									alt="sm_friedrice">
								<!-- 대체속성 -->
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<button class="btn btn-1 btn-outline-warning" type="button">자세히
										보기</button>
								</div>
							</div>
							<div class="card" style="width: 18rem;">
								<img src="images/sm_lunchbox.jpg" class="card-img-top"
									alt="sm_lunchbox">
								<!-- 대체속성 -->
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<button class="btn btn-1 btn-outline-warning" type="button">자세히
										보기</button>
								</div>
							</div>
							<div class="card" style="width: 18rem;">
								<img src="images/sm_sausage.jpg" class="card-img-top"
									alt="sm_sausage">
								<!-- 대체속성 -->
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<button class="btn btn-1 btn-outline-warning" type="button">자세히
										보기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer --> 
	<footer class="footer has-cards">
		<div class="container">
			<hr>
			<div class="row align-items-center justify-content-md-between">
				<div class="col-md-6">
					<div class="copyright">
						&copy; 2019 <a href="https://www.creative-tim.com" target="_blank">Creative
							Tim</a>.
					</div>
				</div>
				<div class="col-md-6">
					<ul class="nav nav-footer justify-content-end">
						<li class="nav-item"><a href="https://www.creative-tim.com"
							class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a
							href="https://www.creative-tim.com/presentation" class="nav-link"
							target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com"
							class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a
							href="https://github.com/creativetimofficial/argon-design-system/blob/master/LICENSE.md"
							class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	 <!-- Core --> <script src="./assets/vendor/jquery/jquery.min.js"></script>
	<script src="./assets/vendor/popper/popper.min.js"></script> <script
		src="./assets/vendor/bootstrap/bootstrap.min.js"></script> <script
		src="./assets/vendor/headroom/headroom.min.js"></script> <!-- Optional JS -->
	<script src="./assets/vendor/onscreen/onscreen.min.js"></script> <script
		src="./assets/vendor/nouislider/js/nouislider.min.js"></script> <script
		src="./assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<!-- Argon JS --> <script src="./assets/js/argon.js?v=1.1.0"></script>
</body>
</html>