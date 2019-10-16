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
.buypagelabel{
	margin-top: 5px;
	font-size: 1.2em;
}
#margintext{
	margin-left: 35px;
}
#margindiv{
	margin-left: 800px;
}
#pointinfo{
	font-size: 0.7em;
}
</style>
	<script type="text/javascript">
		var buyxhr=null;
		function addbuy(){
			var name=document.getElementsByName("name")[0].value;
			var email=document.getElementsByName("email")[0].value;
			var addr=document.getElementsByName("addr")[0].value;
			
			var buyway=document.getElementsByName("buyway");
			var bwvalue="";
			for(var i=0;i<buyway.length;++i){
				if(buyway[i].checked==true){
					bwvalue+=buyway[i].value+" ";
					break;
				}
			}
			var usepoint=document.getElementById("usepoint").value;
			var useablepoint=document.getElementById("useablepoint").value;
			var msg=document.getElementById("msg").value;
			
			if(usepoint>useablepoint){
				alert("사용포인트는 가용포인트보다 클 수 없습니다.");
				return;
			}
			
			buyxhr=new XMLHttpRequest();
			buyxhr.onreadystatechange=modiinfoOk;
			buyxhr.open('post','./buy?cmd=user',true);
			buyxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			var param="name="+name+"&email="+email+"&addr="+addr+"b";
			buyxhr.send(param);
		}
		function addbuyOk(){
			if(buyxhr.readyState==4 && buyxhr.status==200){
				alert("");
				location.href="./index";
			}
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

						<%
							String id=(String)session.getAttribute("id");
							if(id==null) {
						%>
							<li class="nav-item"><a href="./examples/login.jsp"
							class="nav-link">Login</a></li>
							<li class="nav-item"><a href="./examples/register.html"
							class="nav-link">Register</a></li>
						<%
							}else {
						%>
							<li class="nav-item"><a href="./mypage?cmd=cart&id=<%=id %>"
							class="nav-link">Cart</a></li>
							<li class="nav-item"><a href="./mypage?cmd=user&id=<%=id %>"
							class="nav-link">MyPage</a></li>
							<li class="nav-item"><a href="./examples/logout.jsp"
							class="nav-link">Logout</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="section section-components pb-0"
		id="section-components">
		<div class="container">
				<br>
				<c:forEach var="clist" items="${cartlist }">
                		<br>
						<div class='media'>
						<img src='images/${clist.gdsumary }' class='align-self-start mr-3'
						alt='' width='100' height='100'>
						<div class='media-body'>
						<h5 class='mt-0'><a href="./detail?gdnum=${clist.gdnum }">${clist.gdname }</a></h5>
						<p>${clist.count }개  &nbsp; 총 금액: ${clist.count * clist.gdprice }원 &nbsp;
							</p></div></div>
                	</c:forEach>
                	<br>
					<div class="row" id="margindiv">
					<label class="buypagelabel">total:</label> &nbsp;&nbsp;
					<h2>${totalprice }원</h2>
					</div>
				<nav class="navbar navbar-expand-lg navbar-dark bg-warning mt-4">
					<div class="container">
						<a class="navbar-brand" href="#" id="detailcontent">주문자 정보</a>
						<div class="collapse navbar-collapse" id="navbar-warning">
							<div class="navbar-collapse-header">
								<div class="row">
									<div class="col-6 collapse-brand">
										<a href="./index.html"> <img alt="image"
											src="./assets/img/brand/blue.png">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</nav>
				<br>
				
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<!-- Basic elements -->
						<div class="container">
						<br>
							<div class="row">
								<label class="buypagelabel">이름</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="이름을 입력해주세요" id="margintext" 
				             		class="form-control" value="${userinfo.fname}${userinfo.lname}"
				             		name="name"/>
				            	</div>
							</div>
							<div class="row">
								<label class="buypagelabel">메일주소</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="메일주소를 입력해주세요" 
				             		class="form-control" width="300" value="${account.email }"
				             		name="email"/>
				            	</div>
							</div>
							<div class="row">
								<label class="buypagelabel">주소</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="주소를 입력해주세요" id="margintext" 
				             		class="form-control" value="${userinfo.addr }"
				             		name="addr"/>
				            	</div>
							</div>
							<br><br><hr>
						</div>

					</div>
				</div>

				
            	
            	<nav class="navbar navbar-expand-lg navbar-dark bg-warning mt-4">
					<div class="container">
						<a class="navbar-brand" href="#" id="detailcontent">결제 정보</a>
						<div class="collapse navbar-collapse" id="navbar-warning">
							<div class="navbar-collapse-header">
								<div class="row">
									<div class="col-6 collapse-brand">
										<a href="./index.html"> <img alt="image"
											src="./assets/img/brand/blue.png">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</nav>
				
				<div class="row justify-content-center">
					<div class="col-lg-12">
						<!-- Basic elements -->
						<div class="container">
						<br>
							<div class="row">
								<label class="buypagelabel">결제수단</label>
								&nbsp;&nbsp;&nbsp;
								<div class="custom-control custom-radio mb-3">
					              <input name="buyway" class="custom-control-input" id="customRadio1" 
					              checked type="radio" value="카드">
					              <label class="custom-control-label" for="customRadio1"><span>카드</span></label>
					            </div>
					            &nbsp;&nbsp;
					            <div class="custom-control custom-radio mb-3">
					              <input name="buyway" class="custom-control-input" id="customRadio2" 
					              type="radio" value="무통장입금">
					              <label class="custom-control-label" for="customRadio2"><span>무통장입금</span></label>
					            </div>
							</div>
							<br>
							<div class="row">
								<label class="buypagelabel">사용포인트</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="사용 포인트 입력" id="usepoint"
				             		class="form-control" width="300" value="0"/>
				            	</div>
				            	&nbsp;&nbsp;&nbsp;
				            	<label class="buypagelabel">가용포인트</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="" id="useablepoint"
				             		class="form-control" width="300" value="${account.point }" disabled/>
				            	</div>
				            	<span id="pointinfo">포인트를 사용한 결제는 포인트가 적립되지 않습니다!</span>
							</div>
							<br>
								<label class="buypagelabel">배송메시지 입력</label>
								&nbsp;&nbsp;&nbsp;
								<div class="form-group">
				             		<input type="text" placeholder="배송메시지를 13자 이내로 입력해주세요" 
				             		class="form-control" id="msg"/>
				            	</div>
							

							<br><br><hr>
						</div>

					</div>
				</div>
					
					
			<hr>
			<form>
				<button class="btn btn-1 btn-outline-warning" type="button"
					id="buybtn" onclick="addbuy()">구매하기</button>
			</form>

			

			<footer class="footer has-cards">
				<div class="container">
					<hr>
					<div class="row align-items-center justify-content-md-between">
						<div class="col-md-6">
							<div class="copyright">
								&copy; 2019 <a href="https://www.creative-tim.com"
									target="_blank">Creative Tim</a>.
							</div>
						</div>
						<div class="col-md-6">
							<ul class="nav nav-footer justify-content-end">
								<li class="nav-item"><a href="https://www.creative-tim.com"
									class="nav-link" target="_blank">Creative Tim</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/presentation"
									class="nav-link" target="_blank">About Us</a></li>
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