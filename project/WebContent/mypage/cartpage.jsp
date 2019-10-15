<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    mypage
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/now-ui-dashboard.css?v=1.3.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
  
  <script type="text/javascript">
  	window.onload=function(){
		getList();
	}
  	var listxhr=null;
	function getList(){
		listxhr=new XMLHttpRequest();
		listxhr.onreadystatechange=listOk;
		listxhr.open('get','mypage?cmd=cart',true);
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
  </script>
  
</head>

<body class="user-profile">
  <div class="wrapper ">
    <div class="sidebar" data-color="orange">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          CT
        </a>
        <a href="./index" class="simple-text logo-normal">
          	랭닭킹컴
        </a>
      </div>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./mypage?cmd=user">
              <i class="now-ui-icons users_single-02"></i>
              <p>내 정보</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="now-ui-icons design_app"></i>
              <p>구매목록</p>
            </a>
          </li>
          <li class="active ">
            <a href="./mypage?cmd=cart">
              <i class="now-ui-icons design_app"></i>
              <p>장바구니</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="now-ui-icons location_map-big"></i>
              <p>포인트 내역</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="now-ui-icons ui-1_bell-53"></i>
              <p>1:1 문의</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo"></a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>

        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-10">
            <div class="card">
              <div class="card-header">
              	<br>
                <h5 >내 장바구니</h5>
              </div>
              <div class="card-body">
                <form>
                	<c:forEach var="clist" items="${cartlist }">
                		<br>
						<div class='media'>
						<img src='images/${clist.gdsumary }' class='align-self-start mr-3'
						alt='' width='100' height='100'>
						<div class='media-body'>
						<h5 class='mt-0'><a href="./detail?gdnum=${clist.gdnum }">${clist.gdname }</a></h5>
						<p>${clist.count }개  &nbsp; 총 금액: ${clist.count * clist.gdprice }원 &nbsp; (${clist.regdate })
							<a href="#">삭제</a></p></div></div>
                	</c:forEach>
                	<hr>
                	<button class="btn btn-1 btn-primary" type="button" id="btn">구매하기</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/now-ui-dashboard.min.js?v=1.3.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
</body>

</html>