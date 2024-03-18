<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2><b>회원매출조회</b></h2>
	<form>
		<table border="1">
			<tr>
				<td>회원정보</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>