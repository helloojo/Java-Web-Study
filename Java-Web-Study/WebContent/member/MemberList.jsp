<%@ page import="spms.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	<h1>회원 목록</h1>
	<p>
		<a href='add'>신규 회원</a>
	</p>
	<jsp:useBean id="members" scope="request" class="java.util.ArrayList" type="java.util.ArrayList<spms.vo.Member>"/>
	<%
	  for (Member member : members) {
	%>
	<%=member.getNo()%>,
	<a href='update?no=<%=member.getNo()%>'><%=member.getName()%></a>,
	<%=member.getEmail()%>,
	<%=member.getCreatedDate()%>
	<a href='delete?no=<%=member.getNo()%>'>[삭제]</a>
	<br>
	<% } %>
	<jsp:include page="/Tail.jsp" />
</body>
</html>