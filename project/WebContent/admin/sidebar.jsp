<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 사이드바 -->
     <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <span>menu</span>
        </a>
      </li>
      <!-- 사이드바 회사정보 등록 및 변경 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>회사정보 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
        <!-- "layout.jsp?page=home.jsp -->
          <a class="dropdown-item" href="adindex.jsp?page=cpinsert.jsp">파트너 회사 등록</a>
          <a class="dropdown-item" href="adindex.jsp?page=cpinfo.jsp">파트너 회사 관리</a>
        <!--   <div class="dropdown-divider"></div> -->
        </div>
      </li>
      <!-- 사이드바 상품등록 및 변경 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>상품 정보 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
      	  <a class="dropdown-item" href="adindex.jsp?page=cpgoods.jsp">상품 종류 등록</a>
          <a class="dropdown-item" href="#">상품등록</a>
          <a class="dropdown-item" href="#">등록상품수정</a>
        <!--   <div class="dropdown-divider"></div> -->
        </div>
      </li>
      <!-- 사이드바 주문관리 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>주문 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="">신규주문</a>
          <a class="dropdown-item" href="">발송처리</a><!-- 넣을지? -->
          <a class="dropdown-item" href="">배송중/배송완료</a><!-- 넣을지?2 -->
        </div>
      </li>
            <!-- 사이드바 클레임 관리 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>클레임 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="">취소관리</a>
          <a class="dropdown-item" href="">반품관리</a>
          <a class="dropdown-item" href="">교환관리</a>
        </div>
      </li>
    </ul>