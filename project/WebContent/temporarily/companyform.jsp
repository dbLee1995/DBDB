<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>임시 회사 정보 등록</h1>
	<form action="/company?cmd=cpInsert" onsubmit="return validate()">
		회사이름<br><!-- 사명 중복 체크 -->
		<input type="text" name="cpName" id="cpName">
		<span id="chk"></span><br>
		전화번호<br>
		<input type="text" name="cpPhone" id="cpPhone"><br>
		<input type="submit" value="등록" disabled><input type="submit" value="다음단계로">
	</form>
	
</body>
<script type="text/javascript">
	

</script>
</html>