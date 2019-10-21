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
  
  <link href='css/bootstrap.css' rel='stylesheet' />
  <link href='css/rotating-card.css' rel='stylesheet' />
  <link href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
  
  <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
  <script src="js/bootstrap.min.js" type="text/javascript"></script>
  
  <script type="text/javascript">
  $().ready(function(){
      $('[rel="tooltip"]').tooltip();

      $('a.scroll-down').click(function(e){
          e.preventDefault();
          scroll_target = $(this).data('href');
           $('html, body').animate({
               scrollTop: $(scroll_target).offset().top - 60
           }, 1000);
      });

  });

  function rotateCard(btn){
      var $card = $(btn).closest('.card-container');
      console.log($card);
      if($card.hasClass('hover')){
          $card.removeClass('hover');
      } else {
          $card.addClass('hover');
      }
  }
  function addqna(){
	  var title=document.getElementById("title").value;
	  var content=document.getElementById("content").value;
	  var qnaselect=document.getElementById("qnaselect").value;
	  location.href="./mypage?cmd=updateqna&id=${id}&title="+title+"&content="+content+"&qnaselect="+qnaselect;
  }
  </script>
  <style type="text/css">
  	#qnacard{
  	}
  	#qnacardd{
  	}
  	.footer{
  	}
  	#qnacontent{
  	}
  </style>
  
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
          <li >
            <a href="./mypage?cmd=shoppinglist">
              <i class="now-ui-icons design_app"></i>
              <p>구매내역</p>
            </a>
          </li>
          <li >
            <a href="./mypage?cmd=trade">
              <i class="now-ui-icons design_app"></i>
              <p>교환/반품 신청내역</p>
            </a>
          </li>
          <li >
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
          <li class="active ">
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
      
      
      
      
      
      
      
      <div class="row" id="tradediv">
          <div class="col-md-10">
            <div class="card">
              <div class="card-header">
              	<br>
                <h5 >문의작성</h5>
              </div>
              
              <div class="card-body">
              	<div class="table-responsive">
					<div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" placeholder=id value="${id }" disabled >
                      </div>
                    </div>
                    <div class="col-md-5 pl-1">
                      <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder=name value="${name }" disabled >
                      </div>
                    </div>
                  </div>
                  
                  	<div class="col-md-5 pl-1">
                  	<div class="form-group">
                  	<label>문의종류</label>
                  	<select class="form-control" id="qnaselect">
				      <option>구매관련</option>
				      <option>상품관련</option>
				      <option>배송관련</option>
				      <option>기타</option>
				    </select>
				    </div>
				    </div>
                  
                  <div class="row">
                    <div class="col-md-10 pr-2">
                      <div class="form-group">
                        <label>제목</label>
							<input type="text" class="form-control" placeholder="제목을 입력해주세요" 
								id="title">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-10 pr-2">
                      <div class="form-group">
                        <label>문의내용</label>
							<input type="text" class="form-control" placeholder="내용을 입력해주세요" 
								id="content">
                      </div>
                    </div>
                  </div>

					<button class="btn btn-1 btn-outline-warning" type="button" id="tbtn"
						onclick="addqna()">작성하기</button>
				 
                  
               	</div>
              </div>
            </div>
          </div>
        </div>
      
      
      

      
      
      
      
        <div class="row">
          <div class="col-md-10">
            <div class="card">
              <div class="card-header">
              	<br>
                <h5 >문의내역</h5>
              </div>
              <div class="card-body">

			<c:forEach var="vo" items="${volist }">
			

             <div class="card-container manual-flip" id="qnacard">
                <div class="card" id="qnacardd">
                    <div class="front">
                        <div class="content" id="qnacontent">
                            <div class="main">
                                <h3 class="name">[${vo.category }] &nbsp; ${vo.title }</h3>
                                <p class="profession">${vo.id }(${vo.regdate })</p>
                                <p class="text-center">${vo.content }</p>
                            </div>
                            <div class="footer">
                            	<c:if test="${vo.answerstate==1 }">
	                                	답변 대기중.. 
                                </c:if>
                                <c:if test="${vo.answerstate==2 }">
	                               		처리중..
                                </c:if>
                                <c:if test="${vo.answerstate==3 }">
	                                <button class="btn btn-simple" onclick="rotateCard(this)">
	                                    <i class="fa fa-mail-forward"></i> 답변보기
	                                </button>
                                </c:if>
                                
                            </div>
                        </div>
                    </div> <!-- end front panel -->
                    <div class="back">
                        <div class="header">
                            <h5 class="motto">[${vo.category }] &nbsp; ${vo.title } &nbsp; (처리일자:${vo.answerdate })</h5>
                        </div>
                            <div class="main">
                                <p class="text-center">${vo.answer }</p>
                            </div>
                        <div class="footer">
                            <button class="btn btn-simple" rel="tooltip" title="Flip Card" onclick="rotateCard(this)">
                                <i class="fa fa-reply"></i> 질문보기
                            </button>
                        </div>
                </div> <!-- end card -->
            </div> <!-- end card-container -->
  
  				

              </div>
              
              </c:forEach>
              
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