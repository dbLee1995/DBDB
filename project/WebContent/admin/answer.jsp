<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="card-header bg-transparent" style="margin-left: auto; margin-right: auto;">
			<h3>고객 문의 답변</h3>
		</div>
	<div class="container-fluid">
	
		<form method="post" name="qnaForm" action="qna?cmd=answer">
		<input type="hidden" value="${qvo.answerstate }" name="answerstate">
		<input type="hidden" value="${qvo.qnum }" name="qnum">
		<table class="table table-bordered" style="margin-left: auto; margin-right: auto">
			<tr>
				<th>아이디</th>
				<td>${qvo.id }</td>
				<th>작성일</th>
				<td>${qvo.regdate }</td>
				
			</tr>
			<tr>
				<th colspan="2" >카테고리</th>
				<td colspan="2">${qvo.category }</td>
			
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="2">${qvo.title }</td>
		
			</tr>
		</table>
		<div class="accordion" id="accordionExample">
			  <div class="card">
			    <div class="card-header" id="headingOne">
			      <h2 class="mb-0">
			        <button class="btn btn-link " type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          문의내용 :	${qvo.content }
			        </button>
			      </h2>
   		 </div>
   		    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample" >
		      <div class="card-body" id="answerdiv">
		         답변 :  <textarea rows="5" cols="170" id="answer" name="answer" style="margin-left: auto; margin-right: auto" >${qvo.answer }</textarea>
		         
		      </div>
		    </div>
		  </div>
		  </div>
		<button type="submit" class="btn btn-outline-primary"  style="margin-left: auto; margin-right: auto">답변하기</button>
		</form>
	   
	