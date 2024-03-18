<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section>
<h2><b>홈쇼핑 회원 정보 수정</b></h2>
<form name="frm">
<table border="1">
  <%
    Connection conn = null;
    Statement stmt = null;
    String mod_custno = request.getParameter("custno");
    String custno = "";
    String custname = "";
    String phone = "";
    String address = "";
    String joindate = "";
    String grade = "";
    String city = "";

    try {
      conn = Util.getConnection();
      stmt = conn.createStatement();
      String sql = "SELECT * FROM member_tbl_02 WHERE custno='" + mod_custno + "'";
      ResultSet rs = stmt.executeQuery(sql);
      if(rs.next()) {
         custno = rs.getString("custno");
         custname = rs.getString("custname");
         phone = rs.getString("phone");
         address = rs.getString("address");
         joindate = rs.getString("joindate");
         grade = rs.getString("grade");
         city = rs.getString("city");
      }
      rs.close(); // ResultSet 닫기

    } catch (Exception e) {
      e.printStackTrace(); // Log the exception for debugging
    }
  %>
<tr><td>회원번호(자동등록)</td><td><input type="text" name="custno" value="<%=custno%>"></td></tr>
<tr><td>회원성명</td><td><input type="text" name="custname" value="<%=custname%>"></td></tr>
<tr><td>회원전화</td><td><input type="text" name="phone" value="<%=phone%>"></td></tr>
<tr><td>회원주소</td><td><input type="text" name="address" value="<%=address%>"></td></tr>
<tr><td>가입일자</td><td><input type="text" name="joindate" value="<%=joindate%>"></td></tr>
<tr><td>고객등급[A:VIP,B:일반,C:직원]</td><td><input type="text" name="grade" value="<%=grade%>"></td></tr>
<tr><td>도시코드</td><td><input type="text" name="city" value="<%=city%>"></td></tr>
<tr><td colspan="2"><input type="submit" value="등록" onclick="return joinCheck()"></td></tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script src="./check.js"></script>
</body>
</html>
