<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="content-wrapper">
		<div class="card-header" style="width:90%;margin-left: auto; margin-right: auto;"><h3>신규 회사 정보 등록</h3></div>
			<div class="container-fluid">
				<div class="card-body">
					<table class="table table-bordered" style="width:90%; margin-left: auto; margin-right: auto">
						  <tbody>
						    <tr>
						      <td >회사선택</td>
						      <td width="70%">
							      <select class="custom-select" id="cpSelect" name="cpList" onchange="" >
							  		<option selected value="0" >select company</option>
								  </select>	
								</td>
						    </tr>
						    <tr>
						      <td >상품 종류 선택</td>
						      <td width="70%">
						      	  <select class="custom-select" id="gdSelect" name="gdList" onchange="" >
							  		<option selected value="0" >select goodsList</option>
								  </select>	
						      </td>
						    </tr>
						    <tr>
						      <td>제목</td>
						      <td width="70%">
						      	<input type="text" class="form-control" id="gdName"
								  name="gdName" placeholder="title" > 
						      </td>
						    </tr>
						     <tr>
						      <td >가격</td>
						      <td>
						      	<input type="text" class="form-control" id="gdPrice"
								  name="gdPrice" placeholder="price"> 
						      </td>
						    </tr>
						     <tr>
						      <td >섬네일<br>(파일첨부)</td>
						      <td>
  							    <textarea class="form-control" id="gdDetail" rows="10" name="gdPrice"></textarea>
  							    <div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="introFileSpan">업로드</span>
								  </div>
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="introFileAdd" aria-describedby="inputGroupFileAddon01">
								    <label class="custom-file-label" for="inputGroupFile01">파일선택</label>
								  </div>
								</div>
						      </td>
						    </tr>
						    <tr>
						      <td >상세정보<br>(파일첨부)</td>
						      <td>
  							    <textarea class="form-control" id="gdDetail" rows="15" name="gdDetail"></textarea>
  							    <div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="detailFileSpan">업로드</span>
								  </div>
								  <div class="custom-file">
								    <input type="file" class="custom-file-input" id="detailFileAdd" aria-describedby="inputGroupFileAddon01">
								    <label class="custom-file-label" for="inputGroupFile01">파일선택</label>
								  </div>
								</div>
						      </td>
						    </tr>
						    <tr>
						    	<td colspan="2">
						    		<div class="col-lg-15 text-center">
										<button type="submit" class="btn btn-secondary" >취소</button>
										<button type="submit" class="btn btn-outline-primary" >미리보기</button>
										<button type="submit" class="btn btn-primary" >다음</button>
									</div>
						    	
						    	</td>
						    </tr>
						  </tbody>
						</table>
					</div>
			</div>
			</div>
		
	</div>