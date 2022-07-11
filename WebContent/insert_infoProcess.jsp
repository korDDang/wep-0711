<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<% 
try{
	String sql="insert into bookinfo0711 values(?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("bookno"));
	pstmt.setString(2, request.getParameter("author"));
	pstmt.setString(3, request.getParameter("bookname"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="select_info.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>