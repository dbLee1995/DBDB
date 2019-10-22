<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  		var pwdxhr=null;
  		
  		function modipwd(){
  			var pwd=document.getElementById("pwd").value;
  			var email=document.getElementById("email").value;
  			var npwd=document.getElementById("npwd").value;
  			
  			if(pwd.length<4){
  				alert("비밀번호 4자이상 입력");
  				return ;
  			}
  			if(pwd!==npwd){
  				alert("비밀번호 확인");
  				return;
  			}
  			pwdxhr=new XMLHttpRequest();
  			pwdxhr.onreadystatechange=modipwdOk;
  			pwdxhr.open('post','./mypage?cmd=editpwdinfo', true);
  			pwdxhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
  			var param="id=${id}&email=${email}&pwd="+pwd ;
  			pwdxhr.send(param);
  			
  		}
  		function modipwdOk(){
  			if(pwdxhr.readyState==4 && pwdxhr.status==200){
				alert("비밀번호가 수정되었습니다!");
			location.href="./mypage?cmd=user";
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
        <a href="./index?id=${id }" class="simple-text logo-normal">
          	랭닭킹컴
        </a>
      </div>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="./mypage?cmd=user">
              <i class="now-ui-icons users_single-02"></i>
              <p>내 정보</p>
            </a>
          </li>
          <li>
            <a href="./mypage?cmd=shoppinglist">
              <i class="now-ui-icons design_app"></i>
              <p>구매내역</p>
            </a>
          </li>
          <li>
            <a href="./mypage?cmd=trade">
              <i class="now-ui-icons design_app"></i>
              <p>교환/반품 신청내역</p>
            </a>
          </li>
          <li>
            <a href="./mypage?cmd=cart">
              <i class="now-ui-icons design_app"></i>
              <p>장바구니</p>
            </a>
          </li>
          <li>
            <a href="./mypage?cmd=point">
              <i class="now-ui-icons location_map-big"></i>
              <p>포인트 내역</p>
            </a>
          </li>
          <li>
            <a href="./mypage?cmd=qna">
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
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5>내 정보</h5>
              </div>
              <div class="card-body">
                <form >
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" placeholder="Username" value="${id }" disabled >
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" placeholder="Email" id="email" value="${email }" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>비밀번호</label>
                        <input type="password" class="form-control" placeholder="비밀번호" id="pwd" value="${pwd }">
                      </div>
                    </div>
                  </div>
                 <div class="row">
                 	 <div class="col-md-6 pl-1">
                     	 <div class="form-group">
                       	 <label>비밀번호 확인</label>
                      	  <input type="password" class="form-control" placeholder="비밀번호 확인" name="npwd" id="npwd" value="${npwd }">
                      	</div>
                    </div>	 
                 </div>
                  <button class="btn btn-1 btn-primary" type="button" id="pwdbtn" onclick="modipwd()">비밀번호 변경하기</button>
         
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