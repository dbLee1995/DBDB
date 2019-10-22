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
#button-addon2{
	margin-bottom: 10px;
}
</style>
	<script type="text/javascript">
		function search(){
			
			var searchbar=document.getElementById("searchbar").value;
			var company=document.getElementsByName("company");
			var list=document.getElementsByName("list");
			var array=document.getElementsByName("array");
			
			var companyV="";
			for(var i=0;i<company.length;++i){
				if(company[i].checked==true){
					companyV+=company[i].value+"";
					break;
				}
			}
			var listV="";
			for(var i=0;i<list.length;++i){
				if(list[i].checked==true){
					listV+=list[i].value+"";
					break;
				}
			}
			var arrayV="";
			for(var i=0;i<array.length;++i){
				if(array[i].checked==true){
					arrayV+=array[i].value+"";
					break;
				}
			}
			
			location.href="./search?id=${id}&keyword="+searchbar+"&company="+companyV+"&list="+listV+"&array="+arrayV;
		}
		function searchbtn(){
			search();
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
				<a class="navbar-brand mr-lg-5" href="./index?id=${id }"> <img
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
						<%
							String id=(String)session.getAttribute("id");
							if(id==null) {
						%>
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

	
	
	<!-- </div>-->

	<section class="section section-components pb-0"
		id="section-components">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
				
					<div class="card shadow">
		                <div class="card-body" id="cb">
		                 
		                    <div >
		                      <div class="row">
		                      		&nbsp;&nbsp;
		                      		회사명 
		                      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      		<div class="custom-control custom-radio mb-3">
						              <input name="company" class="custom-control-input" id="companyall" 
						               type="radio" value="0" <c:if test="${company==0 }">checked</c:if>>
						              <label class="custom-control-label" for="companyall"><span>전체</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="company" class="custom-control-input" id="company1" 
						               type="radio" value="1" <c:if test="${company==1 }">checked</c:if>>
						              <label class="custom-control-label" for="company1"><span>맛있닭</span></label>
						            </div>
						            &nbsp;&nbsp;
						            <div class="custom-control custom-radio mb-3">
						              <input name="company" class="custom-control-input" id="company2" 
						              type="radio" value="2" <c:if test="${company==2 }">checked</c:if>>
						              <label class="custom-control-label" for="company2"><span>푸드원</span></label>
						            </div>
								</div>
								
								<div class="row">
		                      		&nbsp;&nbsp;
		                      		상품종류 
		                      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      		<div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="listall" 
						               type="radio" value="0" <c:if test="${list=='0' }">checked</c:if>>
						              <label class="custom-control-label" for="listall"><span>전체</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="list1" 
						               type="radio" value="닭가슴살" <c:if test="${list=='닭가슴살' }">checked</c:if>>
						              <label class="custom-control-label" for="list1"><span>닭가슴살</span></label>
						            </div>
						            &nbsp;&nbsp;
						            <div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="list2" 
						              type="radio" value="도시락" <c:if test="${list=='도시락' }">checked</c:if>>
						              <label class="custom-control-label" for="list2"><span>도시락</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="list3" 
						               type="radio" value="볶음밥" <c:if test="${list=='볶음밥' }">checked</c:if>>
						              <label class="custom-control-label" for="list3"><span>볶음밥</span></label>
						            </div>
						            &nbsp;&nbsp;
						            <div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="list4" 
						              type="radio" value="소세지" <c:if test="${list=='소세지' }">checked</c:if>>
						              <label class="custom-control-label" for="list4"><span>소세지</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="list" class="custom-control-input" id="list5" 
						               type="radio" value="피자" <c:if test="${list=='피자' }">checked</c:if>>
						              <label class="custom-control-label" for="list5"><span>피자</span></label>
						            </div>
								</div>
								
								<div class="row">
		                      		&nbsp;&nbsp;
		                      		정렬방법
		                      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                      		<div class="custom-control custom-radio mb-3">
						              <input name="array" class="custom-control-input" id="arraynew" 
						               type="radio" value="0" <c:if test="${array==0 }">checked</c:if>>
						              <label class="custom-control-label" for="arraynew"><span>최신순</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="array" class="custom-control-input" id="array1" 
						               type="radio" value="1" <c:if test="${array==1 }">checked</c:if>>
						              <label class="custom-control-label" for="array1"><span>낮은가격순</span></label>
						            </div>
						            &nbsp;&nbsp;
						            <div class="custom-control custom-radio mb-3">
						              <input name="array" class="custom-control-input" id="array2" 
						              type="radio" value="2" <c:if test="${array==2 }">checked</c:if>>
						              <label class="custom-control-label" for="array2"><span>높은가격순</span></label>
						            </div>
						            &nbsp;&nbsp;
									<div class="custom-control custom-radio mb-3">
						              <input name="array" class="custom-control-input" id="array3" 
						               type="radio" value="3" <c:if test="${array==3 }">checked</c:if>>
						              <label class="custom-control-label" for="array3"><span>최다판매량</span></label>
						            </div>
						            &nbsp;&nbsp;
						            <div class="custom-control custom-radio mb-3">
						              <input name="array" class="custom-control-input" id="array4" 
						              type="radio" value="4" <c:if test="${array==4 }">checked</c:if>>
						              <label class="custom-control-label" for="array4"><span>평점높은순</span></label>
						            </div>
								</div>
								
								<button class="btn btn-1 btn-outline-warning" type="button" id="tbtn"
								onclick="searchbtn()">검색하기</button>
								
		                    </div>
		                
		                </div>
		              </div>
					
					<br>

					<!-- 검색창 -->
					<div class="form-group">
		              <div class="input-group mb-15">
		                <div class="input-group-prepend">
		                  <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span>
		                </div>
		                <input class="form-control" placeholder="Search" type="text" 
		                	id="searchbar" onkeyup="if(event.keyCode==13) search()">
		              </div>
		            </div>

					
					<!-- Basic elements -->
					
					
					<div class="container">
						<div class="row">
							<% int n=0; %>
							<c:forEach var="gdlist" items="${gdvolist }">
							<%if(n<10){ %>
							<div class="card" style="width: 18rem;">
								<img src="images/${gdlist.gdsumary }" class="card-img-top"
									alt="sm_chickenbreast">
								<div class="card-body">
									<h5 class="card-title">${gdlist.gdname }</h5>
									<a href="./detail?gdnum=${gdlist.gdnum }&id=${id}">
									<button class="btn btn-1 btn-outline-warning" type="button"
									>자세히보기</button></a>
								</div>
							</div>
							<%++n;} %>
							</c:forEach>
						</div>
					</div>


					
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					    	<c:choose>
					    		<c:when test="${pageNum>1 }">
									<a class="page-link" 
										href="./search?id=${id }&pageNum=${pageNum-1}&company=${company}&list=${list}&array=${array}&keyword=${keyword}" 
											aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:otherwise>
					      	</c:choose>
					    </li>
					    <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					    	<c:choose>
					    		<c:when test="${pageNum==i }">
					    			<li class="page-item active" aria-current="page">
								    	<a class="page-link" 
								    		href="./search?id=${id }&pageNum=${i}&company=${company}&list=${list}&array=${array}&keyword=${keyword}">${i } <span class="sr-only">(current)</span></a>
								    </li>
					    		</c:when>
					    		<c:otherwise>
					    			<li class="page-item"><a class="page-link" 
					    				href="./search?id=${id }&pageNum=${i}&company=${company}&list=${list}&array=${array}&keyword=${keyword}">${i }</a></li>
					    		</c:otherwise>
					    		
					    	</c:choose>
					    </c:forEach>
					    <li class="page-item">
					    	<c:choose>
					    		<c:when test="${endPageNum>pageNum }">
									<a class="page-link" 
										href="./search?id=${id }&pageNum=${pageNum+1}&company=${company}&list=${list}&array=${array}&keyword=${keyword}" 
											aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:otherwise>
							</c:choose>
					    </li>
					  </ul>
					</nav>
					

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