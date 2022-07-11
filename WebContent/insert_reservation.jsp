<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function ch(){
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		doc.lentno.focus();
		return false;
	}if(doc.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
		doc.custname.focus();
		return false;
	}if(doc.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		doc.bookno.focus();
		return false;
	}else{
		doc.action="insert_reservationProcess.jsp"
		
	}
}
function check3(){
	var doc=document.form;
	if(doc.indate.value!=""){
		doc.status[1].checked=true;
	}else{
		doc.status[0].checked=true;
	}
}
</script>

</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<%
int du=0;
try{
	String sql="select s123.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		du=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}


String lentno=request.getParameter("lentno");
if(lentno==null){
	lentno="";}
	String outdate=request.getParameter("outdate");
	if(outdate==null){
		outdate="";}
		String indate=request.getParameter("indate");
		if(indate==null){
			indate="";}
		String custname=request.getParameter("custname");
		if(custname==null){
			custname="";}			
	

String bookname=request.getParameter("bookname");
if(bookname==null){
	bookname="";
}
String bookno=request.getParameter("bookno");
if(bookno==null){
	bookno="";
}else{

	try{
		String sql="select bookname from bookinfo0711 where bookno=? ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			bookname=rs.getString("bookname");
		}else{
			%> <script>
			alert("등록되어 있지 않는 도서코드 입니다.");
			</script>
			<% 
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
<br>
<h2>도서 대출 예약 정보 등록 화면</h2>
<form name="form" method="post" action="insert_reservation.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">대출번호</th>
	<td>
		<input type="text" name="lentno" value="<%=du%>">
	</td>
	<th class="th1">고객성명</th>
	<td>
		<input type="text" name="custname" value="<%=custname%>">
	</td>
</tr>
<tr>
	<th class="th1">도서코드</th>
	<td>
		<input type="text" name="bookno" onchange="ch()"  value="<%=bookno%>">
	</td>
	<th class="th1">도서이름</th>
	<td>
		<input type="text" name="bookname" value="<%=bookname%>">
	</td>
</tr>
<tr>
	<th class="th1">대출일자</th>
	<td>
		<input type="text" name="outdate" value="<%=outdate%>">
	</td>
	<th class="th1">반납일자</th>
	<td>
		<input type="text" name="indate" value="<%=indate%>" onclick="check3()">
	</td>
</tr>
<tr>
	<th class="th1">대출상태</th>
	<td>
		<input type="radio" name="status" value="1" checked>대출
		<input type="radio" name="status" value="2" >반납
	</td>
	<th class="th1">등급</th>
	<td>
	 	<select name="class1">
	 	<option value="S">S</option>
	 	<option value="A">A</option>
	 	<option value="B">B</option>
	 	<option value="C">C</option>
	 	
	 	</select>
	</td>
</tr>


<tr>
 <td colspan="4" class="td1">
 	<input type="submit" value="저장" onclick="check()" class="bt2">
 	<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt2">
</td>
</tr>

</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>