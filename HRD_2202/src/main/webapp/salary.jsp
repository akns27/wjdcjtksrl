<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>회원매출조회</b></h2>
<table border="1">
<tr>
<td>회원번호</td>
<td>회원성명</td>
<td>고객등급</td>
<td>매출</td>
</tr>
<% 
   Connection conn=null; //연결을 시켜줄 변수
   Statement stmt=null;//sql을 실행시켜줄 변수   
   String grade = "";
   try{
      conn = Util.getConnection();//db 연결
      stmt = conn.createStatement();//sql을 실행시키기 위한 변수를 생성
      String sql = "SELECT me.custno, me.custname, me.grade, sum(mo.price) price " +
                   "FROM member_tbl_02 me, money_tbl_02 mo " +
                   "WHERE me.custno = mo.custno " +
                   "GROUP BY me.custno, me.custname, me.grade " + //group by는 select절과는 동일해야 하지만, 집계함수는 사용하지 않습니다. 
                   "ORDER BY sum(mo.price) desc" ;
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next()) {
         grade = rs.getString("grade");
         switch(grade){
         case "A" :
            grade = "VIP";
            break;
         case "B" :
            grade = "일반";
            break;
         case "C" :
            grade = "직원";
            break;
         }
%>         
   <tr>
      <td><%=rs.getString("custno")%></td>
      <td><%=rs.getString("custname")%></td>
      <td><%=grade %></td>
      <td><%=rs.getString("price")%></td>
   </tr>      
<%             
      }
      rs.close(); // ResultSet 닫기
   }catch(Exception e){
      e.printStackTrace();
   } finally {
      try {
         if (stmt != null) {
            stmt.close(); // Statement 닫기
         }
         if (conn != null) {
            conn.close(); // Connection 닫기
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }
%>   
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
