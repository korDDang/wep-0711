<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 정보 조회</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>학사정보 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from bookinfo0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>권의 도서정보가 있습니다.</div>
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>도서코드</th>
<th>저자</th>
<th>도 서 명</th>
</tr>
<%
int no=0;
try{
	String sql="select * from bookinfo0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String bookno=rs.getString(1);
		String author=rs.getString(2);
		String bookname=rs.getString(3);
		no++;
	

%>
<tr>
<td class="td2"><%=no %></td>
<td  class="td3"><%=bookno %></td>
<td  class="td2"><%=author %></td>
<td  class="td2"><%=bookname %></td>
</tr>
<%
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
</table>
<br>
<div class="td1"><input type="button" value="도서 정보 추가" onclick="location.href='insert_info.jsp'" class="bt2"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>