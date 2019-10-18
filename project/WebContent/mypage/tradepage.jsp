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
	function updatetrade(){
		
		var tradestate=document.getElementsByName("trade");
		var v="";
		for(var i=0;i<tradestate.length;++i){
			if(tradestate[i].checked==true){
				v+=tradestate[i].value+"";
				break;
			}
		}
		
		location.href="./mypage?cmd=updatetrade&snum=${tradeinfo.snum }&state="+v;
	}
	window.onload=function(){
		getdiv();
	}
	function getdiv(){
		var tradediv=document.getElementById("tradediv");
		tradediv.style.display="${display}";
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
          <li >
            <a href="./mypage?cmd=shoppinglist">
              <i class="now-ui-icons design_app"></i>
              <p>구매내역</p>
            </a>
          </li>
          <li class="active ">
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
          <div class="col-md-10">
            <div class="card">
              <div class="card-header">
              	<br>
                <h5 >교환/반품 신청내역</h5>
              </div>
              
              <div class="card-body">
	              	<div class="table-responsive">
	               		<table class="table">
	               			<thead class=" text-primary">
		               			<th>주문번호</th><th>상품명</th><th>갯수</th><th>교환/반품 상황</th>
	               			</thead>
	               			<tbody>
	               			
	               				<c:forEach var="slist" items="${shoppinglist }">
	               				<c:if test="${slist.state==2 || slist.state==4 || slist.state==5 || slist.state==6 }">
	               				<tr>
	               					<td >${slist.orderNum}</td>

	               					<c:forEach var="glist" items="${goodsdetaillist }">
	               						<c:if test="${slist.gdNum == glist.gdnum }">
	               							<td><a href="./detail?gdnum=${slist.gdNum }">${glist.gdname }</a></td>
	               							<td>${slist.gdCount }</td>
	               							<c:if test="${slist.state==1 }"><td>배송중</td></c:if>
	               							<c:if test="${slist.state==2 }"><td>교환중</td></c:if>
	               							<c:if test="${slist.state==3 }"><td>배송완료</td></c:if>
	               							<c:if test="${slist.state==4 }"><td>반품중</td></c:if>
	               							<c:if test="${slist.state==5 }"><td>교환완료</td></c:if>
	               							<c:if test="${slist.state==6 }"><td>반품완료</td></c:if>
	               						</c:if>
	               					</c:forEach>
	               				</tr>
	               				</c:if>
	               				</c:forEach>
	               			</tbody>
	               		</table>
	               	</div>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="row" id="tradediv">
          <div class="col-md-10">
            <div class="card">
              <div class="card-header">
              	<br>
                <h5 >교환/반품 신청</h5>
              </div>
              
              <div class="card-body">
              	<div class="table-responsive">
					<div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" placeholder=id value="${tradeinfo.id }" disabled >
                      </div>
                    </div>
                    <div class="col-md-5 pl-1">
                      <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder=id value="${tradeinfo.name }" disabled >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                 	 <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>구매일자</label>
                        <input type="text" class="form-control" placeholder=id value="${tradeinfo.regdate }" disabled >
                      </div>
                    </div>
                    <div class="col-md-5 pl-1">
                      <div class="form-group">
                        <label>주문번호</label>
                        <input type="text" class="form-control" placeholder=id value="${tradeinfo.gdNum }" disabled >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>상품명</label>
                        <c:forEach var="glist" items="${goodsdetaillist}">
                        	<c:if test="${glist.gdnum == tradeinfo.gdNum }">
                        	<input type="text" class="form-control" placeholder=id value="${glist.gdname }" disabled >
                        	</c:if>
                        </c:forEach>
                      </div>
                    </div>
                    <div class="col-md-5 pl-1">
                      <div class="form-group">
                        <label>수량</label>
                        <input type="text" class="form-control" placeholder=id value="${tradeinfo.gdCount }" disabled >
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>교환/반품 선택</label>
								<div class="custom-control custom-radio mb-2">
					              <input name="trade" class="custom-control-input" id="customRadio1" 
					              checked type="radio" value="trade">
					              <label class="custom-control-label" for="customRadio1"><span>교환</span></label>
					            </div>
					            <div class="custom-control custom-radio mb-3">
					              <input name="trade" class="custom-control-input" id="customRadio2" 
					              type="radio" value="return">
					              <label class="custom-control-label" for="customRadio2"><span>반품</span></label>
					            </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-10 pr-2">
                      <div class="form-group">
                        <label>교환/반품 사유</label>
							<input type="text" class="form-control" placeholder="사유를 입력해주세요" >
                      </div>
                    </div>
                  </div>
                  
                  
					<button class="btn btn-1 btn-primary" type="button" id="tbtn"
						onclick="updatetrade()">신청하기</button>
				 
                  
               	</div>
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