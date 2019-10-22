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
<link href="./icon/mainicon.png" rel="icon" type="image/png">
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
.marginclass{
	margin-left: 150px;
}
#errspan{
	color: red;
	font-size: 0.8em;
}
</style>
	<script type="text/javascript">
		function search(){
			
			var searchbar=document.getElementById("searchbar").value;
			
			location.href="./search?keyword="+searchbar+"&id=${id}";
		}
		$('#exampleModal').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) // Button that triggered the modal
			  var recipient = button.data('whatever') // Extract info from data-* attributes
			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			  var modal = $(this)
			  modal.find('.modal-title').text('New message to ' + recipient)
			  modal.find('.modal-body input').val(recipient)
		})
		function ordercheck(){
			var ordernum=document.getElementById("ordernum").value;
			var orderpwd=document.getElementById("orderpwd").value;
			
			var errspan=document.getElementById("errspan");
			if(orderpwd!=1111){
				errspan.innerHTML="비밀번호가 틀렸습니다!";
				return;
			}
			
			location.href="./guestordercheck?id=${id}&ordernum="+ordernum;
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
				<a class="navbar-brand mr-lg-5" href="./index"> <img
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
								class="nav-link-inner--text">카테고리</span>
						</a>
							<div class="dropdown-menu">
								<a href="./search?id=${id }&list=닭가슴살" class="dropdown-item">닭가슴살</a>
								<a href="./search?id=${id }&list=도시락" class="dropdown-item">도시락</a>
								<a href="./search?id=${id }&list=볶음밥" class="dropdown-item">볶음밥</a>
								<a href="./search?id=${id }&list=소세지" class="dropdown-item">소세지</a>
								<a href="./search?id=${id }&list=피자" class="dropdown-item">피자</a>
							</div></li>
					</ul>
					<ul class="navbar-nav align-items-lg-center ml-lg-auto">
						<li class="nav-item"><a class="nav-link nav-link-icon"
							href=""
							target="_blank" data-toggle="tooltip" title="웅앵웅깃허브">
								<i class="fa fa-github"></i> <span
								class="nav-link-inner--text d-lg-none">Github</span>
						</a></li>
						<%
							String id=(String)session.getAttribute("id");
							if(id==null) {
						%>
							<li class="nav-item"><a href=""
							class="nav-link" class="btn btn-primary" data-toggle="modal" 
							data-target="#exampleModal" data-whatever="@getbootstrap">주문조회</a></li>
							
							<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">비회원 주문조회하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <form>
						          <div class="form-group">
						            <label for="recipient-name" class="col-form-label">주문번호</label>
						            <input type="text" class="form-control" id="ordernum">
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="col-form-label">비밀번호</label>
						            <input type="text" class="form-control" id="orderpwd">
						          </div>
						          <span id="errspan"></span>
						        </form>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						        <button type="button" class="btn btn-primary"
						        	onclick="ordercheck()">조회하기</button>
						        	<!-- onclick="location.href='./search'" -->
						      </div>
						    </div>
						  </div>
						</div>
							
							
							<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="./examples/register.html"
							class="nav-link">회원가입</a></li>
						<%
							}else {
						%>
							<li class="nav-item"><a href="./mypage?cmd=cart&id=${id }"
							class="nav-link">장바구니</a></li>
							<li class="nav-item"><a href="./mypage?cmd=user&id=${id }"
							class="nav-link">마이페이지</a></li>
							<li class="nav-item"><a href="./examples/logout.jsp"
							class="nav-link">로그아웃</a></li>
						<%
							}
						%>
						
						
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
					

					<!-- 검색창 -->
					<div class="form-group">
		              <div class="input-group mb-4">
		                <div class="input-group-prepend">
		                  <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span>
		                </div>
		                <input class="form-control" placeholder="Search" type="text" 
		                	id="searchbar" onkeyup="if(event.keyCode==13) search()">
		              </div>
		            </div>

					
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
									<h5 class="marginclass">${df.format(listvo.gdprice) }원</h5>
									<a href="./detail?gdnum=${listvo.gdnum }&id=${id}">
									<button class="btn btn-1 btn-outline-warning" type="button"
									>자세히보기</button></a>
								</div>
							</div>
							<%++n;} %>
							</c:forEach>
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