<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section>
<h2><b>홈쇼핑 회원 등록</b></h2>
<form name=frm>
<table>

<tr><td>회원번호(자동등록)</td><td><input type="text" name="custno"></td></tr>
<tr><td>회원성명</td><td><input type="text" name="custname"></td></tr>
<tr><td>회원전화</td><td><input type="text" name="phone"></td></tr>
<tr><td>회원주소</td><td><input type="text" name="address"></td></tr>
<tr><td>가입일자</td><td><input type="text" name="joindate"></td></tr>
<tr><td>고객등급[A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade"></td></tr>
<tr><td>도시코드</td><td><input type="text" name="city"></td></tr>
<tr><td colspan="2"><input type="submit" value="등록" onclick="return joinCheck()"><input type="submit" value="조회" onclick="return search()"></td><td></td></tr>

</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script src="./check.js"></script>
</body>
</html>