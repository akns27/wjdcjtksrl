<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>

<jsp:include page="header.jsp">
  <jsp:param name="pageName" value="list" />
</jsp:include>

<section>

<h2 style="text-align: center"><b>회원목록조회/수정</b></h2>

<form action="list.jsp" method="post">

<table>
  <tr>
    <th>회원번호</th>
    <th>회원성명</th>
    <th>전화번호</th>
    <th>주소</th>
    <th>가입일자</th>
    <th>고객등급</th>
    <th>거주지역</th>
  </tr>
  <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null; // Added to store the query results

    try {
      conn = Util.getConnection();
      stmt = conn.createStatement();
      String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
      rs = stmt.executeQuery(sql); // Execute query and store results

      while (rs.next()) {
    	    String custno = rs.getString("custno");
    	    String custname = rs.getString("custname");
    	    String phone = rs.getString("phone");
    	    String address = rs.getString("address");
    	    String joindate = rs.getString("indate"); // joindate 대신 indate 사용
    	    String gread = rs.getString("gread");

    	    String customerGrade = "";
    	    switch (gread) {
    	        case "A":
    	            customerGrade = "VIP";
    	            break;
    	        case "B":
    	            customerGrade = "일반";
    	            break;
    	        case "C":
    	            customerGrade = "직원";
    	            break;
    	        default:
    	            customerGrade = gread;
    	    }
    	%>
    	<tr>
    	    <td><%=custno%></td> <!-- rs.getString("custno") 대신 변수 custno 사용 -->
    	    <td><%=custname%></td> <!-- rs.getString("custname") 대신 변수 custname 사용 -->
    	    <td><%=phone%></td> <!-- rs.getString("phone") 대신 변수 phone 사용 -->
    	    <td><%=address%></td> <!-- rs.getString("address") 대신 변수 address 사용 -->
    	    <td><%=joindate%></td> <!-- rs.getString("indate") 대신 변수 joindate 사용 -->
    	    <td><%=customerGrade%></td> <!-- gread 대신 customerGrade 사용 -->
    	    <td><%=rs.getString("city")%></td>
    	</tr>
  <%
      }
    } catch (Exception e) {
      e.printStackTrace(); // Log the exception for debugging
    }
  %>
</table>

</form>

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
