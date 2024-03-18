<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="style.css">

<script type="text/javascript" src="check.js"></script>
<body>

   <jsp:include page="header.jsp"></jsp:include>
   <section>
      
      <h2>홈쇼핑 회원 등록</h2>
      <form name="frm">
      <
      <table>
         <%
               Connection conn=null; //연결을 시켜줄 변수
               Statement stmt=null; // sql을 실행시켜줄 변수
               String custno="";
               try{
                  conn = Util.getConnection(); //db연결
                  stmt = conn.createStatement(); //sql을 실행시키기 위한 변수
                  
                  String sql = "select MAX(custno)+1 custno from member_tbl_02";
                  ResultSet rs=stmt.executeQuery(sql);
                  custno=rs.getString("custno");
               }catch(Exception e){
                  e.printStackTrace();
               }
            %>
         <tr>
            <td>회원번호(자동발생)</td>
            <td><input type="text" name="custnumber"></td>
         </tr>
         <tr>
            <td>회원성명</td>
            <td><input type="text" name="custname"></td>
         </tr>
         <tr>
            <td>회원전화</td>
            <td><input type="text" name="phone"></td>
         </tr>
         <tr>
            <td>회원주소</td>
            <td><input type="text" name="address"></td>
         </tr>
         <tr>
            <td>가입일자</td>
            <td><input type="text" name="joindate"></td>
         </tr>
         <tr>
            <td>고객등급[A:VIP,B:일반,C:직원]</td>
            <td><input type="text" name="grade"></td>
         </tr>
         <tr>
            <td>도시코드</td>
            <td><input type="text" name=city></td>
         </tr>
         <tr>
            <td colspan="2">
               <input type="submit" value="등록" onclick="return joinCheck()">
               <input type="submit" value="조회" onclick="return serch()">
            </td>
         </tr>
         </form>
      </table>
      
   </section>
   <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>